#
# -removeaux == remove aux files
#


has_param() {
	local term="$1"
	shift
	for arg; do
		if [[ $arg == "$term" ]]; then
			return 0
		fi
	done
	return 1
}

echo "\033[1mCompiling with XeLaTeX...\033[0m"
xelatex --file-line-error --synctex=1 "main.tex"
echo
echo "\033[1mRecompiling...\033[0m"
xelatex --file-line-error --synctex=1 "main.tex"
echo

if has_param '-removeaux' "$@"; then
	echo "\033[1mRemoving AUX files...\033[0m"
	find . -name "*.aux" -delete
	rm main.log 
	rm main.synctex.gz
	echo
fi



open ./main.pdf

echo "\033[1mDone.\033[0m"
