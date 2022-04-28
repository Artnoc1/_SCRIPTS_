

git filter-branch --tree-filter 'mv * ./cm11-b4r2; git mv -k * ./cm11-b4r2' HEAD

git filter-branch --index-filter \
	'git ls-files -s | sed "s-\t\"*-&cm11\-b3/-" |
		GIT_INDEX_FILE=$GIT_INDEX_FILE.new \
			git update-index --index-info &&
	 mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE"' HEAD