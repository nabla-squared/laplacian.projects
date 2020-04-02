#!/usr/bin/env bash
set -e
SCRIPT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}" && pwd)
PROJECT_BASE_DIR=$(cd $SCRIPT_BASE_DIR && cd .. && pwd)

GENERATOR_SCRIPT_FILE_NAME=laplacian-schema-metamodel-generate.sh
TARGET_SCRIPT_DIR="$TARGET_PROJECT_DIR/scripts"
TARGET_PROJECT_GENERATOR_SCRIPT="$TARGET_SCRIPT_DIR/$GENERATOR_SCRIPT_FILE_NAME"

normalize_path () {
  local path=$1
  if [[ $path == /* ]]
  then
    echo $path
  else
    echo "${PROJECT_BASE_DIR}/$path"
  fi
}

#
# Generate resources for schema.metamodel project.
#
${SCRIPT_BASE_DIR}/laplacian-generate.sh \
  --schema 'laplacian:laplacian.schema.metamodel:1.0.0' \
  --template 'laplacian:laplacian.template.entity.kotlin:1.0.0' \
  --model-files './model/project.yaml' \
  --model-files $(normalize_path '/home/iwauo/workspace/laplacian.projects/./subprojects/laplacian.model.metamodel/model/entities') \
  --target-dir ./