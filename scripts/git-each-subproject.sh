#!/usr/bin/env bash
set -e
PROJECT_BASE_DIR=$(cd $"${BASH_SOURCE%/*}/../" && pwd)

SCRIPT_BASE_DIR="$PROJECT_BASE_DIR/scripts"


OPT_NAMES='hvc-:'

ARGS=
HELP=
VERBOSE=
CONTINUE_ON_ERROR=


# @main@
SUBPROJECTS='subprojects/common-model
subprojects/domain-model-project-template
subprojects/generator-project-template
subprojects/metamodel
subprojects/model-project-template
subprojects/project-group-project-template
subprojects/project-domain-model
subprojects/project-project-types
subprojects/template-project-template
'

main() {
  for subproject in $SUBPROJECTS
  do
    local path="$PROJECT_BASE_DIR/$subproject"
    if [[ -d "$path/.git" ]]
    then
      echo "
      === $subproject ===
      "
      (cd $path
        git $ARGS
      )
    fi
  done
}
# @main@

# @+additional-declarations@
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
      continue-on-error)
        CONTINUE_ON_ERROR='yes';;
      *)
        echo "ERROR: Unknown OPTION --$OPTARG" >&2
        exit 1
      esac
      ;;
    h) HELP='yes';;
    v) VERBOSE='yes';;
    c) CONTINUE_ON_ERROR='yes';;
    esac
  done
  ARGS=$@
}

show_usage () {
cat << 'END'
Usage: ./scripts/git-each-subproject.sh [OPTION]...
  -h, --help
    Displays how to use this command.
  -v, --verbose
    Displays more detailed command execution information.
  -c, --continue-on-error
    Even if the given command fails in a subproject in the middle, executes it for the remaining subprojects.
END
}

parse_args "$@"

! [ -z $VERBOSE ] && set -x
! [ -z $HELP ] && show_usage && exit 0
main