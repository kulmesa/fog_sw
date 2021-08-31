#!/bin/bash

set -x

build() {
		install=$PWD/usr
    pushd ../../tools/libsurvive
		cmake -DCMAKE_INSTALL_PREFIX:PATH=${install} . && make all install
		popd
}

make_deb() {
	echo "Creating deb package..."
	build_dir=$(mktemp -d)
	mkdir ${build_dir}/DEBIAN
	mkdir -p ${build_dir}/etc/systemd/system
	cp debian/control ${build_dir}/DEBIAN/
	cp debian/postinst ${build_dir}/DEBIAN/
	cp debian/prerm ${build_dir}/DEBIAN/
	mv usr ${build_dir}

	pushd ../../tools/libsurvive
	version=1.0.0$(git log --date=format:%Y%m%d --pretty=~git%cd.%h -n 1)
	echo ${version}
	popd

	sed -i "s/VERSION/${version}/" ${build_dir}/DEBIAN/control
	cat ${build_dir}/DEBIAN/control
	fakeroot dpkg-deb --build ${build_dir} ../libsurvive_${version}_amd64.deb
	rm -rf ${build_dir}
	echo "Done"
}

build
make_deb
