#!/bin/sh

CURDIR="$(cd "$(dirname $0)"; pwd)"

VERSION=16.0.3.501
MD5SUM=0823b8b26fb027b04ae5493074997e03

curl -o "$CURDIR/odm.tar.gz" -L https://raw.githubusercontent.com/muink/oneplus13t-fix-camera/refs/heads/bin/odm/${VERSION}/odm.tar.gz
echo "Download completed."

if [ "$(md5sum "$CURDIR/odm.tar.gz" | awk '{print $1}')" = "$MD5SUM" ]; then
	echo "MD5 checksum matches."
	tar -xf "$CURDIR/odm.tar.gz" -C "$CURDIR"
	[ "$?" == 0 ] && rm -f "$CURDIR/odm.tar.gz" || exit 1
	echo "Extraction completed."
else
	echo "MD5 checksum does not match. Exiting."
	exit 1
fi
