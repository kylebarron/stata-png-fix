#!/bin/bash
INSTALLDIR=~/local/stata-png-fix
cwd=$(pwd)
builddir=$(mktemp -d)
cd $builddir
wget http://downloads.sourceforge.net/project/libpng/zlib/1.2.3/zlib-1.2.3.tar.gz
wget http://downloads.sourceforge.net/project/libpng/libpng16/older-releases/1.6.2/libpng-1.6.2.tar.gz
cp ${cwd}/stata-png.patch .
cp ${cwd}/stata-png-fixed.sh .
# unpack and compile
tar zxf zlib-1.2.3.tar.gz
cd zlib-1.2.3
export CFLAGS="-fPIC"
./configure --prefix=$INSTALLDIR
make && make install
cd $builddir
tar xzf libpng-1.6.2.tar.gz
cd libpng-1.6.2
export CFLAGS="-I$INSTALLDIR/include -fPIC"
export LDFLAGS="-L$INSTALLDIR/lib"
./configure --prefix=$INSTALLDIR
patch -p1 < stata-png.patch
make && make install
# also copy over the script
cd $builddir
install -p -m 755 stata-png-fixed.sh $INSTALLDIR/stata-png-fixed.sh
# Now
ln -sf ${INSTALLDIR}/stata-png-fixed.sh ~/local/bin/xstata
ln -sf ${INSTALLDIR}/stata-png-fixed.sh ~/local/bin/xstata-se
ln -sf ${INSTALLDIR}/stata-png-fixed.sh ~/local/bin/xstata-mp
ln -sf ${INSTALLDIR}/stata-png-fixed.sh ~/local/bin/xstata-sm
