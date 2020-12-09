#!/bin/bash
echo "Export Git Diff"

read -p "Export Start Commit ID: " input1

commitIdStart="${input1}"

#Create Export Folder
# now=$(date +%Y%m%d_%H%M%S)
#echo "Current date: $now"
# dirpath="GitExport/$now"
dirpath="GitExport"
echo "Export Path:$dirpath"
mkdir -p $dirpath


#Get File List
files=$(git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRT $commitIdStart HEAD);
#echo $files;

for item in $files ; do
    echo "Copy: $item"
  # For Linux (Todo Test)
  # cp --parents "$item" "$dirpath/$item"
  # For Mac OS
   ditto "$item" "$dirpath/$item"
   if [[ $item != *"-meta.xml"* ]]; then
      ditto "$item-meta.xml" "$dirpath/$item-meta.xml"
   fi
done

appDir="$dirpath/force-app"

echo "Convert MetaData"
echo $appDir
sfdx force:source:convert --outputdir mdapi_output_dir -r $appDir

echo "Clean the Export folder"
rm -fr "$dirpath/main"

# read -p "Press enter to exit"
echo "Done"
