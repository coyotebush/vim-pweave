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

" Highlighting of python code using an existing r.vim syntax file if available {{{1
syn include @pynowebPy syntax/python.vim
syn region pynowebChunk matchgroup=pynowebDelimiter start="^<<.*>>=" matchgroup=pynowebDelimiter end="^@" contains=@pynowebPy,pynowebChunkReference,pynowebChunk fold keepend
syn match pynowebChunkReference "^<<.*>>$" contained
syn region pynowebSexpr matchgroup=Delimiter start="\\Sexpr{" matchgroup=Delimiter end="}" contains=@pynowebPy

" Sweave options command {{{1
syn region pynowebSweaveopts matchgroup=Delimiter start="\\SweaveOpts{" matchgroup=Delimiter end="}"

" pynoweb Cluster {{{1
syn cluster pynoweb contains=pynowebChunk,pynowebChunkReference,pynowebDelimiter,pynowebSexpr,pynowebSweaveopts

" Highlighting {{{1
hi def link pynowebDelimiter	Delimiter
hi def link pynowebSweaveOpts Statement
hi def link pynowebChunkReference Delimiter

let   b:current_syntax = "pynoweb"
" vim: foldmethod=marker:
