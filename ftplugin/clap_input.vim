if exists('b:clap_input_loaded') || !has('nvim')
  finish
endif

let b:clap_input_loaded = 1

setlocal
  \ nonumber
  \ norelativenumber
  \ nopaste
  \ nomodeline
  \ noswapfile
  \ nocursorline
  \ nocursorcolumn
  \ colorcolumn=
  \ nobuflisted
  \ buftype=nofile
  \ bufhidden=hide
  \ signcolumn=no
  \ textwidth=0
  \ nolist
  \ winfixwidth
  \ winfixheight
  \ nospell
  \ nofoldenable
  \ foldcolumn=0
  \ nowrap

function! s:preview() abort
  echom "preview unimplemented"
endfunction

function! s:action(action) abort
  let g:__clap_action = a:action
  call s:sink()
endfunction

autocmd CursorMoved,CursorMovedI <buffer> call clap#handler#on_typed()

" From vim-rsi
if !exists('g:loaded_rsi')
  inoremap <silent> <buffer> <C-a>  <C-o>0
  inoremap <silent> <buffer> <C-X><C-A> <C-A>

  inoremap <silent> <buffer> <expr> <C-B> getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"
  inoremap <silent> <buffer> <expr> <C-F> col('.')>strlen(getline('.'))?"\<Lt>C-F>":"\<Lt>Right>"
endif

inoremap <silent> <buffer> <expr> <C-E> col('.')>strlen(getline('.'))<bar><bar>pumvisible()?"\<Lt>C-E>":"\<Lt>End>"

inoremap <silent> <buffer> <CR> <Esc>:call clap#handler#sink()<CR>

nnoremap <silent> <buffer> <C-c> :call clap#handler#exit()<CR>
nnoremap <silent> <buffer> <Esc> :call clap#handler#exit()<CR>

inoremap <silent> <buffer> <C-c> <Esc>:call clap#handler#exit()<CR>
inoremap <silent> <buffer> <Esc> <Esc>:call clap#handler#exit()<CR>

inoremap <silent> <buffer> <C-j> <C-R>=clap#handler#navigate_result('down')<CR>
inoremap <silent> <buffer> <C-k> <C-R>=clap#handler#navigate_result('up')<CR>

inoremap <silent> <buffer> <Tab> <C-R>=clap#handler#select_toggle()<CR>

inoremap <silent> <buffer> <C-t> <Esc>:call <SID>action('ctrl-t')<CR>
inoremap <silent> <buffer> <C-x> <Esc>:call <SID>action('ctrl-x')<CR>
inoremap <silent> <buffer> <C-v> <Esc>:call <SID>action('ctrl-v')<CR>

inoremap <silent> <buffer> <C-p> <Esc>:call <SID>preview()<CR>
