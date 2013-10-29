"plugins
execute pathogen#infect()

" personnal preferences
set nu "numbers
set hlsearch "Highlights search
set lazyredraw "no idea...
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent

" key mapping for urxvt
map  <C-_>

map <ESC>OA <Up>
map <ESC>OB <Down>
map <ESC>OC <Right>
map <ESC>OD <Left>

map <ESC>Oa <C-Up>
map <ESC>Ob <C-down>
map <ESC>Oc <C-Right>
map <ESC>Od <C-Left>

map <ESC>[a <C-S-Up>
map <ESC>[b <C-S-Down>
map <ESC>[c <C-S-Right>
map <ESC>[d <C-S-Left>

"Sublime like line up-down

function! s:swap_lines(n1, n2)
  let line1 = getline(a:n1)
  let line2 = getline(a:n2)
  call setline(a:n1, line2)
  call setline(a:n2, line1)
endfunction

function! s:swap_up()
  let n = line('.')
  if n == 1
    return
  endif

  call s:swap_lines(n, n - 1)
  exec n - 1
endfunction

function! s:swap_down()
  let n = line('.')
  if n == line('$')
    return
  endif

  call s:swap_lines(n, n + 1)
  exec n + 1
endfunction

noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>


"tabs management

map <C-right> <Esc>:tabnext<CR>
map <C-left> <Esc>:tabprev<CR>
map <C-n> <Esc>:tabe .<CR>

"colorscheme
colorscheme desert

" gvim specifics
if has('gui_running')
  set guioptions-=e
  set guifont=ProggyCleanTTSZ\ 12
  colo two2tango
endif

" linux tty scpecifics
if (match(system("echo $TERM"), "linux") == 0)
      colorscheme delek
endif

"git gutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

"multi-selection options
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" vim:set ft=vim et sw=2: