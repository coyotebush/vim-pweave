" Vim filetype plugin file to load vim-latex or latex-box if installed

" Adapted from https://github.com/jcfaria/Vim-R-plugin/blob/master/ftplugin/rnoweb.vim,
" as it existed on 6 June 2014.

" Only do this when not yet done for this buffer
if exists("b:did_ftplugin")
    finish
endif

runtime! ftplugin/tex.vim

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" Enables Vim-Latex-Suite, LaTeX-Box if installed
runtime ftplugin/tex_*.vim

