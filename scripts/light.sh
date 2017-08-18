#!/bin/bash
# advanced annoying thinklight blinking script for thinkpads

sudo chown cat:users /proc/acpi/ibm/light
for ((;;)); do
    echo  "on" > /proc/acpi/ibm/light
    sleep "$1"
    echo "off" > /proc/acpi/ibm/light
    sleep "$1"
done
