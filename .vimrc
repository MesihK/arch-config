set nocompatible
set t_Co=256
set background=dark
set nu
syntax on
set title

set hlsearch
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set encoding=utf8
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'rickhowe/diffchar.vim'
Plugin 'dbeniamine/cheat.sh-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Don't force me to save when switching buffers
set hidden

" sudo write this
cmap W! silent w !sudo tee % >/dev/null

" for pure hard tabs
" set tabstop=4
" set shiftwidth=4
" set noexpandtab
"
" for black and white print outputs
set printoptions+=syntax:n

" for linux kernel development
" set tabstop=8
" set softtabstop=8
" set shiftwidth=8
" set noexpandtab
" set colorcolumn=80

" for normal development
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set colorcolumn=80

" for pure spaces
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
" set expandtab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching

set nowrap
set nobackup
set nowritebackup
set swapfile
set dir=/tmp

"vim airline
let g:airline#extensions#tabline#enabled = 1

nnoremap gb :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_enable_diagnostic_highlighting = 0
nnoremap <leader>ja :YcmCompleter GoTo<CR>
nnoremap <leader>jh :YcmCompleter GoToInclude<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>

vnoremap L >gv
vnoremap H <gv

let g:livepreview_previewer = 'zathura'

" Requires +clipboard, you can check via vim --version
vnoremap <C-c> "+y
map <C-p> "+P

let g:DiffColors=100
set spelllang=en_us

"when pasting turn of indendation by pressing F3
set pastetoggle=<F3>

set timeout
set timeoutlen=250
set ttimeoutlen=100
" Navigating with guides
	inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	map <Space><Tab> <Esc>/<++><Enter>"_c4l

"""LATEX
	" Word count:
	" autocmd FileType tex map <leader><leader>o :w !detex \| wc -w<CR>
	" Code snippets
	autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,li <Enter>\item<Space>
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,r (\ref{})<++><Esc>F}i
	autocmd FileType tex inoremap ,c \cite{}<++><Esc>F}i
	" Equations
	autocmd FileType tex inoremap ,e \begin{equation}<Enter><Enter>\end{equation}<Enter><++><Esc>2kA<Tab>
	autocmd FileType tex inoremap ,el \begin{equation}<Enter><Enter>\label{<++>}<Enter>\end{equation}<Enter><++><Esc>3kA<Tab>
	autocmd FileType tex inoremap ,ea \begin{eqnarray}<Enter><Enter>\end{eqnarray}<Enter><++><Esc>2kA<Tab>
	autocmd FileType tex inoremap ,eal \begin{eqnarray}<Enter><Enter>\label{<++>}<Enter>\end{eqnarray}<Enter><++><Esc>3kA<Tab>
	autocmd FileType tex inoremap ,sp \begin{split}<Enter><Enter>\end{split}<Enter><++><Esc>2kA<Tab>
	autocmd FileType tex inoremap ,sa \begin{aligned}<Enter><Enter>\end{aligned}<Enter><++><Esc>2kA<Tab>
	autocmd FileType tex inoremap ,p \begin{proof}<Enter><Enter>\end{proof}<Enter><++><Esc>2kA<Tab>
	autocmd FileType tex inoremap ,pr \begin{property}<Enter><Enter>\end{property}<Enter><++><Esc>2kA<Tab>
	autocmd FileType tex inoremap ,th \begin{theorem}<Enter><Enter>\end{theorem}<Enter><++><Esc>2kA<Tab>
	autocmd FileType tex inoremap ,lm \begin{lemma}<Enter><Enter>\end{lemma}<Enter><++><Esc>2kA<Tab>
	autocmd FileType tex inoremap ,a \begin{array}{}<Enter><++><Enter>\end{array}<Enter><++><Esc>3k$F{a
	autocmd FileType tex inoremap ,se $$ <++><Esc>F$i
	autocmd FileType tex inoremap ,m \in \mathbb{} <++><Esc>F}i
	autocmd FileType tex inoremap ,mr \in \mathbb{R}^{} <++><Esc>F}i
	autocmd FileType tex inoremap ,d \dot{} <++><Esc>F}i
	autocmd FileType tex inoremap ,dd \ddot{} <++><Esc>F}i
	autocmd FileType tex inoremap ,ddd \dddot{} <++><Esc>F}i
	autocmd FileType tex inoremap ,[ \left[ \right] <++><Esc>F[a
	autocmd FileType tex inoremap ,{ \left\{ \right\} <++><Esc>F{a
	autocmd FileType tex inoremap ,( \left( \right) <++><Esc>F(a
	autocmd FileType tex inoremap ,int \int_{}^{<++>} <++><Esc>2F{a
	autocmd FileType tex inoremap ,lim \lim_{} <++><Esc>F{a
	autocmd FileType tex inoremap ,f \frac{}{<++>} <++><Esc>2F{a
	autocmd FileType tex inoremap ,sum \sum_{}^{<++>} <++><Esc>2F{a
	autocmd FileType tex inoremap ,pr \prod{}^{<++>} <++><Esc>2F{a
	autocmd FileType tex inoremap ,do _{}<++><Esc>F{a
	autocmd FileType tex inoremap ,u ^{}<++><Esc>F{a
	autocmd FileType tex inoremap ,v \vert \vert \vert \vert <++><Esc>3Fta 
	autocmd FileType tex inoremap ,tl \tilde{}<++><Esc>F{a
	autocmd FileType tex inoremap ,b \bar{}<++><Esc>F{a
	autocmd FileType tex inoremap ,l \in \mathcal{L}_{}<++><Esc>F{a
	autocmd FileType tex inoremap ,li \in \mathcal{L}_{\infty}
	autocmd FileType tex inoremap ,i \infty
	autocmd FileType tex inoremap ,t \theta
	autocmd FileType tex inoremap ,te \triangleq

"""Git Commits

autocmd FileType gitcommit inoremap ,s Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
autocmd FileType gitcommit setlocal tw=72

