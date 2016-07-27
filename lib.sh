#!/bin/bash
set -e

__escape_string(){
	local string="$1"; shift

	echo "$string" | sed -e 's/[]\/$*.^|[]/\\&/g'
}

__insert(){
	local insert="$1"; shift
	local file="$1"; shift

	if ! grep -qF "$insert" "$file"; then
		echo -e "$insert" >> "$file"
	fi
}

__replace(){
	local find="$1"; shift
	local replace="$1"; shift
	local file="$1"; shift

	local _replace=$(__escape_string "$replace")
	# local _find=$(__escape_string "$find")

	sed -i "s/$find/$_replace/g" "$file"
}

__after(){
	local find="$1"; shift
	local append="$1"; shift
	local file="$1"; shift

	local _append=$(__escape_string "$append")
	local _find=$(__escape_string "$find")

	if ! grep -qF "$append" "$file"; then
		sed -i "s/$_find/&\n$_append/g" "$file"
	fi
}

__after_find_regex(){
	local find="$1"; shift
	local append="$1"; shift
	local file="$1"; shift

	local _append=$(__escape_string "$append")
	local _find=$(__escape_string "$find")

	if ! grep -qF "$append" "$file"; then
		sed -i "s/$find/&\n$_append/g" "$file"
	fi
}

__after_append_regex(){
	local find="$1"; shift
	local append="$1"; shift
	local file="$1"; shift

	local _append=$(__escape_string "$append")
	local _find=$(__escape_string "$find")

	if ! grep -qF "$append" "$file"; then
		sed -i "s/$_find/&\n$append/g" "$file"
	fi
}

__append(){
	local find="$1"; shift
	local append="$1"; shift
	local file="$1"; shift

	local _append=$(__escape_string "$append")
	local _find=$(__escape_string "$find")

	sed -i "s/$find/\1 $_append/g" "$file"
}

__add_user(){
	local user="$1"; shift

	adduser --system --group "$user" "$user"
}