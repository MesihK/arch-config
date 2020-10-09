#!/bin/sh

echo '<span color="#ffb52a">''</span>' $(xclip -o 2>/dev/null | wc -w)
