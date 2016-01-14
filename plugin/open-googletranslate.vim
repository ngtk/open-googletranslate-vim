function! GoogleTranslateRange(...) range
  let curline = a:firstline
  let strline = ''

  while curline <= a:lastline
    let tmpline = substitute(getline(curline), '^\s\+\|\s\+$', '', 'g')
    if tmpline=~ '\m^\a' && strline =~ '\m\a$'
      let strline = strline .' '. tmpline
    else
      let strline = strline . tmpline
    endif
    let curline = curline + 1
  endwhile

  let encodedWord = webapi#http#encodeURI(strline)
  let url = "https://translate.google.co.jp/#en/ja/" . encodedWord
  call OpenBrowser(url)
endfunction

command! -nargs=* -range GoogleTranslate <line1>,<line2>call GoogleTranslateRange(<f-args>)
