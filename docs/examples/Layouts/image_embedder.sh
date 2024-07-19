#!/bin/bash

regex="!\[(.*\.(png|jpeg|jpg))\]\(.*\)"

# Loop all parameter files
for file in "$@"
do
  # Find all the instances of markdown images where the alt-text is the path to the image
  results=$(grep -E "${regex}" $file)
  for old_embed in $results
  do
    # Use bash =~ to extract the groups of each match
    if [[ $old_embed =~ $regex ]]
    then
      echo "Replacing ${BASH_REMATCH[1]} embed"
      image_path="${BASH_REMATCH[1]}"
      extension="${BASH_REMATCH[2]}"
      # Encode base64 the image without line breaks
      encoded=$(base64 $image_path -w 0)
      # Create the new markdown image by adding the base64 image
      new_markdown_embed="![${BASH_REMATCH[1]}](data:image/${extension};base64,${encoded})"
      # Prepare the match to be used by sed by escaping regex metacharacters
      old_markdown_embed=$(echo ${BASH_REMATCH[0]} | sed -E 's/(\[|\]|\(|\)|\.)/\\\1/g')
      # Replace the template.yaml keeping a .bkp in case of errors. We use -f to avoid ARG_MAX on big images
      sed -i.bkp -r -f - $file << EOF
s|^(\s*)${old_markdown_embed}|\1${new_markdown_embed}|
EOF
    else
      echo "$file doesn't match" >&2
    fi
  done
done