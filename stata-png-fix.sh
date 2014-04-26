#!/bin/bash
INSTALLDIR=/usr/local/stata-png-fix
cd /tmp
mkdir build
cd build
wget http://downloads.sourceforge.net/project/libpng/zlib/1.2.3/zlib-1.2.3.tar.gz
wget http://downloads.sourceforge.net/project/libpng/libpng16/older-releases/1.6.2/libpng-1.6.2.tar.gz
tar zxf zlib-1.2.3.tar.gz
cd zlib-1.2.3
export CFLAGS="-fPIC"
./configure --prefix=$INSTALLDIR
make
sudo make install
cd ..
cd libpng-1.6.2
export CFLAGS="-I$INSTALLDIR/include -fPIC"
export LDFLAGS="-L$INSTALLDIR/lib"
./configure --prefix=$INSTALLDIR
patch -p0 stata-png.patch

