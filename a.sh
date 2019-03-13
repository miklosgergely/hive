function yetus_comma_to_array
{
  declare var=$1
  declare string=$2

  oldifs="${IFS}"
  #shellcheck disable=SC2229
  IFS=',' read -r -a "${var}" <<< "${string}"
  IFS="${oldifs}"
}


WHITESPACE_EOL_IGNORE_LIST='.*.q.out','.*/gen/thrift/gen-javabean/.*'

  if [[ -n "${WHITESPACE_EOL_IGNORE_LIST}" ]]; then
    eolignore=("grep" "-v")
    yetus_comma_to_array temp1 "${WHITESPACE_EOL_IGNORE_LIST}" ""
    for temp2 in "${temp1[@]}"; do
      eolignore+=("-e" "^$temp2:")
    done
  else
    eolignore=("cat")
  fi

echo ${eolignore[@]}
