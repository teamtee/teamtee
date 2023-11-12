export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # 加载 nvm
nvm use 10
gitbook install book
gitbook build book docs
git add . 
git commit -m "Update"
git push
gitbook serve book docs
