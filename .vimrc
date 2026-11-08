" ==============================================================
" Configuration .vimrc - Esprit Tokyo Night (Pure & Natif)
" ==============================================================

" --- 1. Général & Performance ---
set nocompatible              " Désactive la compatibilité Vi natif
filetype plugin indent on     " Active la détection du type de fichier et l'indentation
syntax on                     " Active la coloration syntaxique
set encoding=utf-8            " Encodage UTF-8 universel
set hidden                    " Masque les buffers sans forcer la sauvegarde
set nobackup nowritebackup    " Évite les fichiers de sauvegarde inutiles
set noswapfile                " Désactive les fichiers .swp
set autoread                  " Recharge le fichier s'il est modifié à l'extérieur

" --- 2. Thème & Couleurs Tokyo Night ---
set termguicolors             " Active les couleurs 24-bit True Color (indispensable)
set background=dark

" Thème natif adapté ou personnalisation fine des groupes de couleurs
colorscheme habamax           " Base sombre moderne (sur Vim 9+)

" Ajustements de couleurs pour se rapprocher de la palette Tokyo Night
" (#1a1b26 : fond sombre, #7aa2f7 : bleu vif, #bb9af7 : violet, #e0af68 : orange)
highlight Normal guibg=#1a1b26 guifg=#c0caf5
highlight LineNr guifg=#3b4261 guibg=#1a1b26
highlight CursorLineNr guifg=#7aa2f7 gui=bold
highlight CursorLine guibg=#24283b
highlight SignColumn guibg=#1a1b26
highlight StatusLine guifg=#c0caf5 guibg=#24283b gui=none
highlight StatusLineNC guifg=#565f89 guibg=#1f2335 gui=none
highlight Visual guibg=#33467c
highlight Search guibg=#3d59a1 guifg=#c0caf5
highlight IncSearch guibg=#ff9e64 guifg=#15161e

" --- 3. Interface & Caractères Invisibles ---
set number relativenumber     " Numérotation hybride (ligne actuelle + relative)
set scrolloff=8               " Conserve 8 lignes sous/sur le curseur
set sidescrolloff=8
set cmdheight=1               " Hauteur minimale pour la ligne de commande
set signcolumn=yes            " Colonne de gauche fixe (stabilité visuelle)

set list                      " Affiche discrètement les caractères invisibles
set listchars=tab:┆\ ,trail:•,extends:»,precedes:«

" Barre d'état personnalisée aux couleurs du thème
set laststatus=2
set statusline=%#CursorLineNr#\ %f\ %#StatusLine#%m%r%=%#Search#\ %y\ %#CursorLineNr#\ %l:%c\ 

" --- 4. Indentation & Édition ---
set autoindent smartindent
set expandtab                 " Remplace les tabulations par des espaces
set tabstop=4 softtabstop=4 shiftwidth=4
set wrap linebreak            " Retour à la ligne fluide sans couper les mots

" --- 5. Recherche ---
set incsearch hlsearch        " Recherche dynamique avec surlignage
set ignorecase smartcase      " Insensible à la casse sauf si majuscule

" --- 6. Presse-papier & Souris ---
set mouse=a                   " Support souris complet
set clipboard=unnamedplus     " Intégration au presse-papier système

" --- 7. Mappings (Raccourcis) ---
let mapleader = " "           " Barre d'espace comme touche Leader

" Effacer le surlignage de la recherche avec <Leader> + h
nnoremap <silent> <leader>h :nohlsearch<CR>

" Navigation fluide entre les volets (Splits) avec Ctrl + [h,j,k,l]
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Déplacement de lignes sélectionnées en mode Visuel
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" --- Mappage pour sortir du mode Insertion ---
inoremap jj <Esc>
inoremap jk <Esc>
