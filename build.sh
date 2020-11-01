OUTPUT_FOLDER="versions"

git clone https://github.com/google/flatbuffers flatc && cd flatc
VERSION=$(git describe --abbrev=0 --tags)


CC="/usr/bin/x86_64-alpine-linux-musl-gcc -static -Os"
echo "Running CMAKE with CC=$CC"


cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
cmake -DCMAKE_C_COMPILER="/usr/bin/x86_64-alpine-linux-musl-gcc" -DCMAKE_EXE_LINKER_FLAGS="-static -Os" .
cmake --build .

cd ../
mkdir $OUTPUT_FOLDER

FILE=$OUTPUT_FOLDER/flatc_$VERSION

mv flatc/flatc $FILE
echo "Removing build folder.."
rm -R flatc
echo "Flatc version $VERSION compiled! Output file: $FILE"
