nvm use 10
gitbook install book
gitbook build book docs
git add . 
git commit -m "Update"
git push
gitbook serve book docs
