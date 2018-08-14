function! spacevim#lang#rust#Run() abort
  if has_key(g:plugs, 'asyncrun.vim')
    AsyncRun cargo run
  else
    exec ':!cargo run<CR>'
  endif
endfunction

function! spacevim#lang#rust#Build() abort
  if has('terminal')
    call spacevim#vim#term#Open({'cmd': ['cargo', 'build']})
    wincmd p
  elseif has_key(g:plugs, 'asyncrun.vim')
    AsyncRun cargo build
  else
    !cargo build
  endif
endfunction

function! spacevim#lang#rust#Fmt() abort
  if exists('*LanguageClient#textDocument_formatting()')
    call LanguageClient#textDocument_formatting()
  elseif exists(':RustFmt')
    RustFmt
  else
    call spacevim#util#warn('No Rust formatting tools avaliable')
  endif
endfunction
