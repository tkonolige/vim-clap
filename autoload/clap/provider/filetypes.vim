" Author: liuchengxu <xuliuchengxlc@gmail.com>
" Description: List the filetypes.

let s:save_cpo = &cpo
set cpo&vim

let s:filetypes = {}

let s:filetypes.source = uniq(sort(map(split(globpath(&rtp, 'syntax/*.vim'), '\n'), 'fnamemodify(v:val, ":t:r")')))
let s:filetypes.sink = 'setf'

let g:clap#provider#filetypes# = s:filetypes

let &cpo = s:save_cpo
unlet s:save_cpo
