#!/bin/bash

STATA_DIR="~/local/stata"

# see how we are called
flavor="$(basename $0)"
# version
version=14
args=$*

# where's the extra stuff
link=$(readlink $0)
INSTALLDIR=$(dirname $link)
export LD_LIBRARY_PATH=$INSTALLDIR/lib:$INSTALLDIR/lib64:$LD_LIBRARY_PATH

exec $STATA_DIR/$flavor $args

