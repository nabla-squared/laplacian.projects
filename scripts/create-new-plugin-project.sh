#!/usr/bin/env bash
set -e
PROJECT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}/../" && pwd)

SCRIPT_BASE_DIR="$PROJECT_BASE_DIR/scripts"


OPT_NAMES='hv-:'

ARGS=
HELP=
VERBOSE=
PROJECT_NAME=plugin
PROJECT_VERSION=0.0.1
NAMESPACE=laplacian


SUBPROJECTS_DIR="model/project/subprojects/laplacian"

main() {
  create_subproject_model_file
  generate_subproject
  show_next_action_message
}

create_subproject_model_file() {
  local model_file="$PROJECT_BASE_DIR/$SUBPROJECTS_DIR/$PROJECT_NAME.yaml"
  mkdir -p $(dirname $model_file)
cat <<EOF > $model_file
_description: &description
  en: |
    The $PROJECT_NAME project.

project:
  subprojects:
  - group: 'laplacian'
    type: 'plugin'
    name: '$PROJECT_NAME'
    namespace: '$NAMESPACE'
    description: *description
    version: '$PROJECT_VERSION'
#   source_repository:
#     url: https://github.com/laplacian/$PROJECT_NAME.git
EOF
}

hyphenize() {
  local str=$1
  echo  ${str//[_.: ]/-}
}

generate_subproject() {
  $SCRIPT_BASE_DIR/generate.sh
  $SCRIPT_BASE_DIR/generate-$(hyphenize "$PROJECT_NAME").sh
}

show_next_action_message() {
  echo "The new subproject is created at ./subprojects/$(hyphenize ${PROJECT_NAME})/"
}

# @additional-declarations@
# @additional-declarations@

parse_args() {
  while getopts $OPT_NAMES OPTION;
  do
    case $OPTION in
    -)
      case $OPTARG in
      help)
        HELP='yes';;
      verbose)
        VERBOSE='yes';;
      project-name)
        PROJECT_NAME=("${!OPTIND}"); OPTIND=$(($OPTIND+1));;
      project-version)
        PROJECT_VERSION=("${!OPTIND}"); OPTIND=$(($OPTIND+1));;
      namespace)
        NAMESPACE=("${!OPTIND}"); OPTIND=$(($OPTIND+1));;
      *)
        echo "ERROR: Unknown OPTION --$OPTARG" >&2
        exit 1
      esac
      ;;
    h) HELP='yes';;
    v) VERBOSE='yes';;
    esac
  done
  ARGS=$@
}

read_user_input() {
  local input=
  read -p "Enter project-name${PROJECT_NAME:+$(printf ' [%s]' $PROJECT_NAME)}: " input
  PROJECT_NAME=${input:-"$PROJECT_NAME"}
  read -p "Enter project-version${PROJECT_VERSION:+$(printf ' [%s]' $PROJECT_VERSION)}: " input
  PROJECT_VERSION=${input:-"$PROJECT_VERSION"}
  read -p "Enter namespace${NAMESPACE:+$(printf ' [%s]' $NAMESPACE)}: " input
  NAMESPACE=${input:-"$NAMESPACE"}
}

show_usage () {
cat << 'END'
Usage: ./scripts/create-new-plugin-project.sh [OPTION]...
  -h, --help
    Displays how to use this command.
  -v, --verbose
    Displays more detailed command execution information.
  --project-name [VALUE]
    New project's name (Default: plugin)
  --project-version [VALUE]
    The initial version number (Default: 0.0.1)
  --namespace [VALUE]
    Namespace (Default: laplacian)
END
}

parse_args "$@"
read_user_input

! [ -z $VERBOSE ] && set -x
! [ -z $HELP ] && show_usage && exit 0
main