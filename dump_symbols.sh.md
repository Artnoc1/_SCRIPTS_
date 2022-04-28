

LIBS_DIR="$1"

OUT_DIR="/tmp/symbols.dump"

mkdir "$OUT_DIR"


dump_symbols() {
	dir=$(basename "$1")
	mkdir "$OUT_DIR/$dir" 
	mkdir "$OUT_DIR/$1"

	shopt -s nullglob
	for lib in "$dir/"*.so ; do
		nm -D "$lib" > "$OUT_DIR/$lib.sym"
	done; 
}

dump_symbols "$LIBS_DIR"

	find "$LIBS_DIR/"* -type d | while read line; do 
	echo "\"$line"\"; 
	dump_symbols "$line"
	done