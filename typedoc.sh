VERSION=5.0.0

echo "Generate API docs for VexFlow" $VERSION

# Make sure ../vexflow/ and ../vexflow-docs/ exist.
if [ ! -d "../vexflow" ]; then
  echo "Error: ../vexflow/ does not exist."
  exit 1
fi

if [ ! -d "../vexflow-docs" ]; then
  echo "Error: ../vexflow-docs/ does not exist."
  exit 1
fi

cd ../vexflow/
git checkout $VERSION
SOURCE_DIR=$(pwd)
cd ../vexflow-docs/
DEST_DIR=$(pwd)

echo "Source: " $SOURCE_DIR
echo "Destination: " $DEST_DIR/api/$VERSION

echo "Press ENTER to continue or CTRL-C to cancel..."
read -n 1 -s

npx typedoc --out ./temp-docs
mv temp-docs $DEST_DIR/api/$VERSION
