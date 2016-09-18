" Vim syntax file
" Language:    Python noweb rst Files
" Last Change: 2010 May 14
" Version:     0.1
" Remarks:     - Inspired by rnoweb.vim
"

" Version Clears: {{{1
" For version 5.x: Clear all syntax items
" For version 6.x and 7.x: Quit when a syntax file was already loaded
if version < 600 
  syntax clear
elseif exists("b:current_syntax")
  finish
endif 

syn case match

" Extension of Tex clusters {{{1
runtime syntax/rst.vim
unlet b:current_syntax

" Highlighting of python code using an existing python.vim syntax file if available {{{1
syn include @pyrstnowebPy syntax/python.vim
syn region pyrstnowebChunk matchgroup=pyrstnowebDelimiter start="^<<.*>>=" matchgroup=pyrstnowebDelimiter end="^@" contains=@pyrstnowebPy,pyrstnowebChunkReference,pyrstnowebChunk fold keepend
syn match pyrstnowebChunkReference "^<<.*>>$" contained
syn region pyrstnowebInline matchgroup=Delimiter start="<%" matchgroup=Delimiter end="%>" contains=@pyrstnowebPy

" pyrstnoweb Cluster {{{1
syn cluster pyrstnoweb contains=pyrstnowebChunk,pyrstnowebChunkReference,pyrstnowebDelimiter,pyrstnowebSexpr

" Highlighting {{{1
hi def link pyrstnowebDelimiter	Delimiter
hi def link pyrstnowebChunkReference Delimiter

let   b:current_syntax = "pyrstnoweb"
" vim: foldmethod=marker:
