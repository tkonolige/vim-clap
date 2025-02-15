" Author: liuchengxu <xuliuchengxlc@gmail.com>
" Description: List the files managed by git.

let s:save_cpo = &cpo
set cpo&vim

let s:git_files = {}

if executable('git')
  let s:git_files.source = 'git ls-files '.(has('win32') ? '' : ' | uniq')
else
  let s:git_files.source = ['git executable not found']
endif

let s:git_files.sink = 'e'

let g:clap#provider#git_files# = s:git_files

let &cpo = s:save_cpo
unlet s:save_cpo
