[[ -z "$1" ]] && echo "Version number required. Eg. 0.53.1" && exit 1;
VERSION="v$1"
echo "Building version $VERSION. That should only have one v in it."
mkdir -p dist/flow/
cp bin/flow dist/flow/flow
zip -rj "flow-osx-$VERSION.zip" dist
