#!/usr/bin/zsh

foreach folder in $(find "$PWD" -maxdepth 1 -mindepth 1 -name ".*" -prune -o -type d -exec basename {} \;)
    echo "moving folder $folder:"
    number="$(( ${folder##e} ))"
    if [[ $number -lt 10 ]]; then
        newfolder="000$number"
    elif [[ $number -lt 100 ]]; then
        newfolder="00$number"
    elif [[ $number -lt 1000 ]]; then
        newfolder="0$number"
    else
        newfolder="$number"
    fi

    if [[ "$folder" != "e$newfolder" ]]; then
        git mv -v "$folder" "e$newfolder"
    fi
end

foreach folder in e*
    cd "$folder"

    foreach file in *
        echo "moving file $file:"
        ending="${file##*.}"
        number="$(( ${${file##euler}%%.*} ))"
        if [[ $number -lt 10 ]]; then
            newfile="000$number"
        elif [[ $number -lt 100 ]]; then
            newfile="00$number"
        elif [[ $number -lt 1000 ]]; then
            newfile="0$number"
        else
            newfile="$number"
        fi

        if [[ "$file" != "euler${newfile}.${ending}" ]]; then
            git mv -v "$file" "euler${newfile}.${ending}"
        fi
    end

    cd ..
end
