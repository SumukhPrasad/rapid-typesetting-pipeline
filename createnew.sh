echo "\033[1mPlease specify an absolute path:\033[0m"
read path

echo "\033[1mCreating directory...\033[0m"
mkdir "$path"

echo "\033[1mCopying files...\033[0m"
rsync -av --exclude=".*" ./* "$path"
