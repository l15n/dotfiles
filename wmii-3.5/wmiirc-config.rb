# {{{ ======== ruby-wmii CONFIGURATION BEGINS HERE ==============
 
# Set the log level
# It defaults to Logger::INFO.
# Set to Logger::DEBUG for extra verbosity.
#LOGGER.level = Logger::DEBUG

# programs to run when wmiirc starts
# one per line, they're run sequentially right before the main loop begins
START_PROGS = <<EOF
xsetroot -solid '#333333'
EOF

# {{{ WM CONFIGURATION
WMII::Configuration.define do
  border      
  font        "fixed,k14"
  focuscolors '#FFFFFF #248047 #147027'
  normcolors  '#4D4E4F #DDDDAA #FFFFCC'
  grabmod     'Mod1'
  rules <<EOF
/Kdict.*/ -> dict
/XMMS.*/ -> ~
/Gimp.*/ -> ~
/MPlayer.*/ -> ~
/XForm.*/ -> ~
/XSane.*/ -> ~
/fontforge.*/ -> ~
/.*/ -> !
/.*/ -> 1
EOF

  # Translate the following names in the on_key and use_binding definitions.
  key_subs  :MODKEY  => :Mod1,
            :MODKEY2 => :Mod4,
            :LEFT    => :h,
            :RIGHT   => :i,
            :UP      => :e,
            :DOWN    => :n


  # Constant used by the intellisort tag selection mechanism
  # set it to   0.0 <= value <= 1.0
  # Lower values make recent choices more likely (modified first order
  # markovian process with exponential decay):
  # 0.0 means that only the last transition counts (all others forgotten)
  # 1.0 means that the probabilities aren't biased to make recent choices more
  #     likely
  view_history_decay 0.8

  # Favor the view we came from in intellisort.
  # 1.0: that view is the first choice
  # 0.0: that view comes after all views with non-zero transition probability,
  #      but before all views we haven't yet jumped to from the current one
  view_history_prev_bias 0.4

  dmenu_options %(-b -fn "#{font}" -nf "#{normcolors.split[0]}" -nb "#{normcolors.split[1]}" -sf "#{focuscolors.split[0]}" -sb "#{focuscolors.split[1]}")

  # {{{ Plugin config
  
  # Uncomment and change to override default on_click actions for the status
  # bar
  #plugin_config["standard:status"]["left_click_action"] = lambda{ system "xeyes" }
  #plugin_config["standard:status"]["right_click_action"] = lambda{ system "xeyes" }
  #plugin_config["standard:status"]["middle_click_action"] = lambda{ system "xeyes" }
  
  plugin_config["standard:status"]["refresh_time"] = 1
  
  # Uncomment and change to override default text
  #currload = nil
  #Thread.new{ loop { currload = `uptime`.chomp.sub(/.*: /,"").gsub(/,/,""); sleep 10 } }
  #plugin_config["standard:status"]["text_proc"] = lambda do
  #  "#{Time.new.strftime("%d/%m/%Y %X %Z")} #{currload}"
  #end

  plugin_config["standard"]["x-terminal-emulator"] = "x-terminal-emulator"

  plugin_config["standard:actions"]["history_size"] = 3  # set to 0 to disable
  plugin_config["standard:programs"]["history_size"] = 5 # set to 0 to disable

  plugin_config["standard:volume"]["mixer"] = "Master"
  
  plugin_config["standard:mode"]["mode_toggle_keys"] = ["MODKEY2-space"]

  plugin_config["standard:battery-monitor"]["statefile"] = 
      '/proc/acpi/battery/BAT0/state'
  plugin_config["standard:battery-monitor"]["infofile"] =
      '/proc/acpi/battery/BAT0/info'
  plugin_config["standard:battery-monitor"]["low"] = 5
  plugin_config["standard:battery-monitor"]["low_action"] =
      'echo "Low battery" | xmessage -center -buttons quit:0 -default quit -file -'
  plugin_config["standard:battery-monitor"]["critical"] = 1
  plugin_config["standard:battery-monitor"]["critical_action"] =
      'echo "Critical battery" | xmessage -center -buttons quit:0 -default quit -file -'

  # Allows you to override the default internal actions and define new ones:
  #plugin_config["standard:actions"]["internal"].update({
  #  "screenshot" => nil,    # remove default screenshot action
  #  "google" => lambda do |wmii, *selection|
  #    require 'cgi'
  #    if selection && !selection.empty?
  #      selection = CGI.escape(selection.join(" "))
  #    else
  #      selection = CGI.escape(%!#{`sselp`.strip}!)
  #    end
  #    url = "http://www.google.com/search?q=#{selection}"
  #    case browser = ENV["BROWSER"]
  #    when nil: system "ssid /etc/alternatives/x-www-browser '#{url}' &"
  #    else system "ssid #{browser} '#{url}' &"
  #    end
  #  end,
  #  "foo" => lambda do |wmii, *args|
  #    IO.popen("xmessage -file -", "w"){|f| f.puts "Args: #{args.inspect}"; f.close_write }
  #  end
  #})

  # {{{ Import bindings and bar applets
  from "standard"  do
    use_feature "tag-bar"

    #use_bar_applet "volume", 999
    use_bar_applet "mode", 900
    use_bar_applet "status", 100
    #use_bar_applet "cpuinfo", 150
    #use_bar_applet "mpd", 110
    #use_bar_applet "battery-monitor"

    use_binding "dict-lookup"
    use_binding "execute-program-with-tag"
    use_binding "execute-action"
    use_binding "execute-program"
    (0..9).each{|k| use_binding "numeric-jump-#{k}"  }
    use_binding "detag"
    use_binding "tag-jump"
    use_binding "retag"
    use_binding "retag-jump"
    use_binding "namespace-retag"
    use_binding "namespace-retag-jump"
    (('a'..'z').to_a+('0'..'9').to_a).each{|k| use_binding "letter-jump-#{k}" }
    (0..9).each{|k| use_binding "numeric-retag-#{k}" }
    (('a'..'z').to_a+('0'..'9').to_a).each{|k| use_binding "letter-retag-#{k}" }
    use_binding "move-prev"
    use_binding "move-next"
    use_binding "namespace-move-prev"
    use_binding "namespace-move-next"
    use_binding "history-move-forward"
    use_binding "history-move-back"

    use_binding "bookmark"
    use_binding "bookmark-open"
    use_feature "bookmark:actions"
  end
  
  # {{{ del.icio.us bookmark import
  #plugin_config["standard:bookmark"]["del.icio.us-user"] = 'myusername'
  #plugin_config["standard:bookmark"]["del.icio.us-password"] = 'mypass'
  
  ## WORD OF CAUTION! 
  ## Before setting the sync mode to :bidirectional, make sure
  ## that your bookmarks.txt file contains all the bookmarks you want to keep,
  ## because all the del.icio.us bookmarks not listed there will be deleted!
  ## You can import your del.icio.us bookmarks by setting it to
  ## :unidirectional and reloading wmiirc ("ALT-a wmiirc" by default).
  ## Allow some time for the bookmarks to be downloaded (wait until you see
  ## "Done importing bookmarks from del.icio.us." in
  ## $HOME/.wmii-3.5/wmiirc.log). You can then change the mode to :bidirectional
  ## and reload wmiirc. From that point on, the bookmark lists will be
  ## synchronized, so local modifications will be propagated to del.icio.us,
  ## and if you remove a bookmark locally it will also be deleted on
  ## del.icio.us.
  #plugin_config["standard:bookmark"]["del.icio.us-mode"] = :bidirectional
  #plugin_config["standard:bookmark"]["del.icio.us-share"] = true

  ## Sets the encoding used to:
  #  * store the bookmark descriptions in bookmarks.txt
  #  * present choices through dmenu
  # Please make sure your bookmarks.txt uses the appropriate encoding before
  # setting the next line. If you had already imported bookmarks from
  # del.icio.us, they will be stored UTF-8, so you might want to
  #   recode utf-8..NEW_ENCODING bookmarks.txt
  #
  # If left to nil, bookmarks imported from del.icio.us will be in UTF-8, and
  # those created locally will be in the encoding specified by your locale.
  #plugin_config["standard:bookmark"]["encoding"] = 'KOI8-R'

  # Allows you to override the default bookmark protocols and define new ones:
  #plugin_config["standard:bookmark"]["protocols"].update({
  #  'http' => nil,    # remove default http protocol
  #  'ssh' => {
  #    :open_urls => lambda do |wmii,bms|
  #      term = wmii.plugin_config["standard"]["x-terminal-emulator"] || "xterm"
  #      bms.each do |bm|
  #        uri = bm[:uri]
  #        ssh_host = uri.host
  #        ssh_host = "#{uri.user}@" + ssh_host unless uri.user.nil?
  #        ssh_port = "-p #{uri.port}" unless uri.port.nil?
  #        system "ssid #{term} -T '#{bm[:bm].url}' -e 'ssh #{ssh_host} #{ssh_port} || read' &"
  #      end
  #    end,
  #    :get_title => lambda do |wmii,uri|
  #      title = uri.host
  #      title = "#{uri.user}@" + title unless uri.user.nil?
  #      title << ":#{uri.port.to_s}" unless uri.port.nil?
  #      title
  #    end
  #  },
  #  'pdf' => {
  #    :open_urls => lambda do |wmii,bms|
  #      bms.each do |bm|
  #        path = URI.unescape(bm[:uri].path)
  #        LOGGER.info "Opening #{path} with xpdf."
  #        system "ssid xpdf '#{path}' &"
  #      end
  #    end,
  #    :get_title => lambda do |wmii,uri|
  #      fname = File.basename(URI.unescape(uri.to_s)).gsub(/\.\S+$/,"")
  #      [fname, fname.downcase, fname.capitalize]
  #    end
  #  }
  #})

  # {{{ Tag all browser instances as 'web' in addition to the current tag
  browsers = %w[Firefox Konqueror]
  browser_re = /^#{browsers.join("|")}/
  on_createclient(condition{|c| browser_re =~ read("/client/#{c}/props")}) do |cid|
    write("/client/#{cid}/tags", "+web")
  end

  # {{{ Simpler key bindings --- not defined in plugins
  on_key("MODKEY-LEFT"){ write "/tag/sel/ctl", "select left" }
  on_key("MODKEY-RIGHT"){ write "/tag/sel/ctl", "select right" }
  on_key("MODKEY-DOWN"){ write "/tag/sel/ctl", "select down" }
  on_key("MODKEY-UP"){ write "/tag/sel/ctl", "select up" }
  on_key("MODKEY-space"){ write "/tag/sel/ctl", "select toggle" }
	# was MODKEY-d
  on_key("MODKEY-s"){ write "/tag/sel/ctl", "colmode sel default" }
	# was MODKEY-s
  on_key("MODKEY-r"){ write "/tag/sel/ctl", "colmode sel stack" }
  on_key("MODKEY-m"){ write "/tag/sel/ctl", "colmode sel max" }
  on_key("MODKEY-Return") do 
    term = plugin_config["standard"]["x-terminal-emulator"] || "xterm"
    system "#{term} &"
  end
  on_key("MODKEY-Shift-LEFT"){ write "/tag/sel/ctl", "send sel left" }
  on_key("MODKEY-Shift-RIGHT"){ write "/tag/sel/ctl", "send sel right" }
  on_key("MODKEY-Shift-DOWN"){ write "/tag/sel/ctl", "send sel down" }
  on_key("MODKEY-Shift-UP"){ write "/tag/sel/ctl", "send sel up" }
  on_key("MODKEY-Shift-space"){ write "/tag/sel/ctl", "send sel toggle" }
  on_key("MODKEY-Shift-c"){ write "/client/sel/ctl", "kill" }
	# was MODKEY-r
  on_key("MODKEY-p"){ view prev_view }
  on_key("MODKEY-Control-LEFT") { write "/tag/sel/ctl", "swap sel left" }
  on_key("MODKEY-Control-RIGHT"){ write "/tag/sel/ctl", "swap sel right" }

  
  # {{{ ======== CONFIGURATION ENDS HERE ==============
end
