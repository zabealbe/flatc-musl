OUTPUT_FOLDER="versions"

git clone https://github.com/google/flatbuffers flatc && cd flatc
VERSION=$(git describe --abbrev=0 --tags)

FILE=$OUTPUT_FOLDER/flatc_$VERSION

if test -f "../$FILE"; then
	echo "Version $VERSION already exists, please remove $FILE if you want to rebuild it!"
	exit 0
fi

CC="/usr/lib/musl-gcc -static -Os"
echo "Running CMAKE with CC=$CC"

cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
cmake .
cmake --build .

cd ../
mkdir $OUTPUT_FOLDER

mv flatc/flatc $FILE
echo "Removing build folder.."
rm -R flatc
echo "FlatC version $VERSION compiled! Output file: $FILE"
