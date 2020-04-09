#!/usr/bin/env bash

HEADER=$'/**\n * Generated stub declarations for Advanced Custom Fields Pro.\n * https://www.advancedcustomfields.com/\n */'

FILE="acf-pro-stubs.php"

fix_phpdoc()
{
    # - make
    # - Fix type and variable name order for @param
    # - Remove remaining parentheses for @param
    # - Fix type and variable name order for @return
    # - Remove remaining parentheses for @return
    # - Fix "void"
    find ./ -type f -name $FILE -exec sed \
        -e 's#^\(\s*/\*\)$#\1*#' \
        -e 's#^\(\s*\*\s*@param\s\+\)\(\$\S\+\)\s\+(\(\S\+\))\(.*\)$#\1\3 \2\4#' \
        -e 's#^\(\s*\*\s*@param\s\+\)(\(\S\+\))\(.*\)$#\1\2\3#' \
        -e 's#^\(\s*\*\s*@return\s\+\)\(\$\S\+\)\s\+(\(\S\+\))\(.*\)$#\1\3 \2\4#' \
        -e 's#^\(\s*\*\s*@return\s\+\)(\(\S\+\))\(.*\)$#\1\2\3#' \
        -e 's#n/a#void#i' \
        -i "{}" ";"
}

"$(dirname $0)/vendor/bin/generate-stubs" \
  --finder=finder.php \
  --out="$FILE" \
  --force \
  --header="$HEADER" \
  --nullify-globals

fix_phpdoc

# Trim tailing whitespace.  Not using sed because it seemed to struggle with
# some characters in the file.
perl -i -lpe "s/[[:space:]]+$//g" $FILE

# Exclude specific functions.
# ? Does anyone have a better way of doing this?
join_by() { local d=$1; shift; echo -n "$1"; shift; printf "%s" "${@/#/$d}"; }
EXCLUDE_FUNC_ONLY=$(join_by "|" determine_locale)
perl -0777 -i -pe "s/\s*function\s+($EXCLUDE_FUNC_ONLY)\s*\(.*?\)[^{]*\{[^}]*\}//msg" $FILE
# EXCLUDE_FUNC_AND_DOC=$(join_by "|" determine_locale)
# perl -0777 -i -pe "s/(\/\*\*([^*]|(\*(?!\/)))*?\*\/(?=\n?\s*function\s+($EXCLUDE_FUNC_AND_DOC)))?\s*function\s+($EXCLUDE_FUNC_AND_DOC)\s*\(.*?\)[^{]*\{[^}]*\}//msg" $FILE
