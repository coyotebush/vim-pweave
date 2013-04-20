" Vim syntax file
" Language:    Pweave Files
" Remarks:     Based on the R noweb syntax file by Johannes Ranke included in
"              the Vim distribution.

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

syn cluster texMatchGroup add=@pweave
syn cluster texMathMatchGroup add=pweaveInline
syn cluster texEnvGroup add=@pweave
syn cluster texFoldGroup add=@pweave
syn cluster texDocGroup		add=@pweave
syn cluster texPartGroup		add=@pweave
syn cluster texChapterGroup		add=@pweave
syn cluster texSectionGroup		add=@pweave
syn cluster texSubSectionGroup		add=@pweave
syn cluster texSubSubSectionGroup	add=@pweave
syn cluster texParaGroup		add=@pweave

" Highlighting of Python code using an existing python.vim syntax file if available {{{1
syn include @pweavePy syntax/python.vim
syn region pweaveChunk matchgroup=pweaveDelimiter start="^<<.*>>=" matchgroup=pweaveDelimiter end="^@" contains=@pweavePy,pweaveChunkReference,pweaveChunk fold keepend
syn match pweaveChunkReference "^<<.*>>$" contained
syn region pweaveInline matchgroup=Delimiter start="<%" matchgroup=Delimiter end="%>" contains=@pweavePy

" pweave Cluster {{{1
syn cluster pweave contains=pweaveChunk,pweaveChunkReference,pweaveDelimiter,pweaveInline,pweaveSweaveopts

" Highlighting {{{1
hi def link pweaveDelimiter	Delimiter
hi def link pweaveSweaveOpts Statement
hi def link pweaveChunkReference Delimiter

let   b:current_syntax = "pweave"
" vim: foldmethod=marker:
