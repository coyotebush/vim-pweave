" Vim syntax file
" Language:    Pweave (python latex) noweb File
" Maintainer:  Grant Goodyear <g2boojum@grantgoodyear.org>
" Last Change: 20120429
" Based on: rnoweb.vim

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
runtime syntax/tex.vim
unlet b:current_syntax

syn cluster texMatchGroup add=@pytexnoweb
syn cluster texMathMatchGroup add=pytexnowebSexpr
syn cluster texEnvGroup add=@pytexnoweb
syn cluster texFoldGroup add=@pytexnoweb
syn cluster texDocGroup		add=@pytexnoweb
syn cluster texPartGroup		add=@pytexnoweb
syn cluster texChapterGroup		add=@pytexnoweb
syn cluster texSectionGroup		add=@pytexnoweb
syn cluster texSubSectionGroup		add=@pytexnoweb
syn cluster texSubSubSectionGroup	add=@pytexnoweb
syn cluster texParaGroup		add=@pytexnoweb

" Highlighting of R code using an existing r.vim syntax file if available {{{1
syn include @pytexnowebPy syntax/python.vim
syn region pytexnowebChunk matchgroup=pytexnowebDelimiter start="^<<.*>>=" matchgroup=pytexnowebDelimiter end="^@" contains=@pytexnowebPy,pytexnowebChunkReference,pytexnowebChunk fold keepend
syn match pytexnowebChunkReference "^<<.*>>$" contained
syn region pytexnowebSexpr matchgroup=Delimiter start="\\Sexpr{" matchgroup=Delimiter end="}" contains=@pytexnowebPy
syn region pytexnowebinline matchgroup=Delimiter start="<%" matchgroup=Delimiter end="%>" contains=@pytexnowebPy

" Sweave options command {{{1
syn region pytexnowebSweaveopts matchgroup=Delimiter start="\\SweaveOpts{" matchgroup=Delimiter end="}"

" pytexnoweb Cluster {{{1
syn cluster pytexnoweb contains=pytexnowebChunk,pytexnowebChunkReference,pytexnowebDelimiter,pytexnowebSexpr,pytexnowebSweaveopts,pytexnowebinline

" Highlighting {{{1
hi def link pytexnowebDelimiter	Delimiter
hi def link pytexnowebSweaveOpts Statement
hi def link pytexnowebChunkReference Delimiter

let   b:current_syntax = "pytexnoweb"
" vim: foldmethod=marker:
