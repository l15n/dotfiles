" Ruby
au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec	set filetype=ruby

" Ruby on Rails
au BufNewFile,BufRead *.builder,*.rxml,*.rjs		set filetype=ruby

" Rakefile
au BufNewFile,BufRead [rR]akefile,*.rake		set filetype=ruby

" Rantfile
au BufNewFile,BufRead [rR]antfile,*.rant		set filetype=ruby

" IRB config
au BufNewFile,BufRead .irbrc,irbrc			set filetype=ruby

" eRuby
au BufNewFile,BufRead *.erb,*.rhtml			set filetype=eruby

au BufNewFile,BufRead [gG]emfile,[gG]emfile.lock	set filetype=ruby

au BufNewFile,BufRead [fF]astfile	set filetype=ruby

" Ridgepole Schema https://github.com/winebarrel/ridgepole
au BufNewFile,BufRead *.schema set filetype=ruby

" Axlsx templates https://github.com/randym/axlsx
au BufNewFile,BufRead *.xlsx.axlsx set filetype=ruby
