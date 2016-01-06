#!/bin/bash

RUNDIR="/var/run/zm"
TMPDIR="/tmp/zm"

#needs --privileged=true
umount /dev/shm
mount -t tmpfs -o rw,nosuid,nodev,noexec,relatime,size=2048M tmpfs /dev/shm

mkdir -p "$RUNDIR" && chown www-data:www-data "$RUNDIR"
mkdir -p "$TMPDIR" && chown www-data:www-data "$TMPDIR"

