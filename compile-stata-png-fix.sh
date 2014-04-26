#!/bin/bash
NAME=stata-png-fix
INSTALLDIR=/usr/local/${NAME}
cwd=$(pwd)
builddir=$(mktemp -d)
echo "Building in $builddir"
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
make
echo "Ready to install in $INSTALLDIR (ctrl-c to end)"
read
sudo make install
cd $builddir
tar xzf libpng-1.6.2.tar.gz
cd libpng-1.6.2
export CFLAGS="-I$INSTALLDIR/include -fPIC"
export LDFLAGS="-L$INSTALLDIR/lib"
./configure --prefix=$INSTALLDIR
patch -p1 < stata-png.patch
make
echo "Ready to install in $INSTALLDIR (ctrl-c to end)"
read
sudo make install
# also copy over the script
install -p -m 755 stata-png-fixed.sh $INSTALLDIR/stata-png-fixed.sh
# Now 
echo "Execute the following commands:

sudo ln -s /usr/local/${NAME}/stata-png-fixed.sh /usr/local/bin/xstata
sudo ln -s /usr/local/${NAME}/stata-png-fixed.sh /usr/local/bin/xstata-se
sudo ln -s /usr/local/${NAME}/stata-png-fixed.sh /usr/local/bin/xstata-mp
sudo ln -s /usr/local/${NAME}/stata-png-fixed.sh /usr/local/bin/xstata-sm
"

# make the tar file
(cd $INSTALLDIR; tar cjf ${builddir}/${NAME}.libs.tar.bz2 *)


