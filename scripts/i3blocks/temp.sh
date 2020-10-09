#!/bin/sh

sensors | grep Package | tr -s ' ' | cut -f 4 -d ' ' | cut -c 2-
