docker build -t alunde/bas_tools:latest .
docker run -ti -p 22:22 alunde/bas_tools:latest

~/.bashrc

PATH="/home/user/bin:$PATH"
export PATH

docker cp 47c07d3ba00a:/usr/bin/vim.basic .

README.md 
// Check the PHP binary file to see if it has any external library dependencies by using chroot.

mkdir /root/rootdir
mkdir -p /root/rootdir/bin
mkdir -p /root/rootdir/lib
mkdir -p /root/rootdir/lib64

cp -v /bin/bash /root/rootdir
cp -v /bin/touch /root/rootdir
cp -v /bin/ls /root/rootdir
cp -v /bin/rm /root/rootdir

sudo chroot rootdir
cd /bin/php/bin
./php -v (should just give version and not error loading any shared libraries.)

If there are shared library issues, exit from bash and run ldd on the php binary.

ldd rootdir/bin/php/bin/php

Copy the missing shared libraries into the likewise proper place in the rooter.

cp /usr/lib64/libpng12.so.0 rootdir/usr/lib64

Check the PHP binary again with chroot.  Repeat above steps as needed to remove shared library issues.

Packing up PHP for buildpack usage:

cp -v {<List dependencies here>} $home/chroot_jail/lib64

cp -v /lib/x86_64-linux-gnu/linux-vdso.so.1 /root/rootdir/lib
cp -v /lib/x86_64-linux-gnu/libtinfo.so.6 /root/rootdir/lib
cp -v /lib/x86_64-linux-gnu/libdl.so.2 /root/rootdir/lib
cp -v /lib/x86_64-linux-gnu/libc.so.6 /root/rootdir/lib
cp -v /lib64/ld-linux-x86-64.so.2 /root/rootdir/lib64

sudo chroot rootdir


