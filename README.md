
## plugin-ref

+ [Vundle](https://github.com/gmarik/Vundle.vim)


```sh
cd ~
[ ! -d ~/.vim/bundle ] && { mkdir ~/.vim/bundle }
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/gisboxwinner/vim-config.git /tmp/vim-config
cp ~/.vimrc ~/.vimrc.$(date) -rf
cp /tmp/vim-config/.vimrc ~/.vimrc

##echo vim :PluginInstall

vim +PluginInstall +qall

echo  "install finish"
```
