#!/bin/bash
# advanced annoying thinklight blinking script for thinkpads

if [[ -z "$1" ]]; then
    echo "supply interval"
    exit 1
fi
echo  "off" > /proc/acpi/ibm/light || sudo chown cat:users /proc/acpi/ibm/light

for ((;;)); do
    echo  "on" > /proc/acpi/ibm/light
    sleep "$1"
    echo "off" > /proc/acpi/ibm/light
    sleep "$1"
done
