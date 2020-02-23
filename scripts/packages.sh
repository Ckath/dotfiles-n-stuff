#!/bin/bash
base_devel=""
explicit=""

packages=$(pacman -Qettq)
for package in $packages; do
    # Get number of packages removed when uninstalling
    deps=$(pacman -Rsp $package | wc -l)
    if [[ $deps == "1" ]]; then
        deps=""
    else
        deps="($deps)"
    fi

    # Get package group
    group=$(pacman -Qi $package | grep "Groups" | sed 's/.* \(.*\)/\1/')

    if [[ $group == "base" ]]; then
        base="$base\n$package $deps"
    elif [[ $group == "base-devel" ]]; then
        base_devel="$base_devel\n$package $deps"
    else
        explicit="$explicit\n$package $deps"
    fi
done

echo "$(pacman -Q | wc -l) total packages"
echo

echo "> BASE DEVEL ($(($(echo -e $base_devel | wc -l) - 1))):"
echo -e "$base_devel" | sort -Vrk 2 | head -n -1
echo

echo "> EXPLICIT ($(($(echo -e $explicit | wc -l) - 1))):"
echo -e "$explicit" | sort -Vrk 2 | head -n -1

unused=$(pacman -Qdttq)
if [ -n "$unused" ]; then
    echo
    echo -e "> UNUSED ($(echo -e "$unused" | wc -l)):"
    echo -e "$unused"
fi
