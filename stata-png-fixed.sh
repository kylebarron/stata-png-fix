#!/bin/bash

# see how we are called
flavor="$(basename $0)"
args=$*

# where's the extra stuff
INSTALLDIR=$(dirname $0)
export LD_LIBRARY_PATH=$INSTALLDIR/lib:$INSTALLDIR/lib64

exec /usr/local/stata13/$flavor $args

