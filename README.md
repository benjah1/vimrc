# The vimrc


## How to install it on local? (Mist)

```
	git clone git://github.com/benjah1/vimrc.git ~/vim_runtime
	sh ~/vim_runtime/install_vimrc.sh
```

After this, open vim and execute :PluginInstall.
And then, you need to complete the dependency for youCompleteMe, Tern_for_vim, Tagbar-phpctags. It may be different on different OS.

ps: not sure as I haven't used it in this way for a long time.

## How to install it with docker?
The awesome part of this is you can use docker image of it and without worry about the dependency. To install it simply do following:

```
	git clone git://github.com/benjah1/vimrc.git ~/vimrc
	cd ~/vimrc
	docker build .
```

## Use it from docker hub

Even better, use it from Docker hub directly.

```
  docker run -d --name [xxx] -v $(pwd):/src \
		-e GIT_AUTHOR_NAME=[xxx] \
		-e GIT_AUTHOR_EMAIL=[xxx] \
		-e GIT_COMMITTER_NAME=[xxx]
		-e GIT_COMMITTER_EMAIL=[xxx]


		benjah1/vimrc:1.7.[x]

	docker exec -it [xxx]
```

## What plugins are included?

### Language
* ~~[mattn/emmet-vim](https://github.com/mattn/emmet-vim)~~
* [othree/html5.vim](https:/github.com/othree/html5.vim)
* ~~[briancollins/vim-jst](https:/github.com/briancollins/vim-jst)~~
* [cakebaker/scss-syntax.vim](https:/github.com/cakebaker/scss-syntax.vim)
* [godlygeek/tabular](https:/github.com/godlygeek/tabular)
* [plasticboy/vim-markdown](https:/github.com/plasticboy/vim-markdown)

### Completion
* [valloric/youCompleteMe](https:/github.com/valloric/youCompleteMe) 

### Code display
* [ap/vim-css-color](https:/github.com/ap/vim-css-color) 
* [nathanaelkane/vim-indent-guides](https:/github.com/nathanaelkane/vim-indent-guides) 

### Integration
* [tpope/vim-fugitive](https:/github.com/tpope/vim-fugitive) 
* [airblade/vim-gitgutter](https:/github.com/airblade/vim-gitgutter) 
* [majutsushi/tagbar](https:/github.com/majutsushi/tagbar) 
* [vim-php/tagbar-phpctags.vim](https:/github.com/vim-php/tagbar-phpctags.vim) 
* [mileszs/ack.vim](https:/github.com/mileszs/ack.vim) 
* [marijnh/tern_for_vim](https:/github.com/marijnh/tern_for_vim) 

### Interface
* [kien/ctrlp.vim](https:/github.com/kien/ctrlp.vim)
* [terryma/vim-multiple-cursors](https:/github.com/terryma/vim-multiple-cursors) 
* [bling/vim-airline](https:/github.com/bling/vim-airline)
* [tomasr/molokai](https:/github.com/tomasr/molokai) 

### Command
* [terryma/vim-expand-region](https:/github.com/terryma/vim-expand-region) 
* [Shougo/vimproc.vim](https:/github.com/Shougo/vimproc.vim)
* [editorconfig/editorconfig-vim](https:/github.com/editorconfig/editorconfig-vim)

## Key Mappings

### Spell checking
Pressing `<leader>ss` will toggle and untoggle spell checking

    map <leader>ss :setlocal spell!<cr>

Shortcuts using `<leader>` instead of special chars

    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=

## ToDo

* Update plugin keymap
* Reduce docker image size
