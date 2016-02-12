export IMAGE_FILE=${IMAGE_FILE:-/var/cache/postgres/databaseimage.img}
export MOUNTPOINT=${MOUNTPOINT:-/var/lib/postgresql}
export SIZE=${SIZE:-80M}

echo IMAGE_FILE: $IMAGE_FILE
echo MOUNTPOINT: $MOUNTPOINT
echo SIZE: $SIZE

# Create a disk image of the given size at the given location and mount
# it at the given mountpoint

mkdir -p /var/cache/postgres

if [ ! -f $IMAGE_FILE ]; then \
    dd if=/dev/zero of=$IMAGE_FILE bs=800M seek=100 count=0 && \
    mkfs -t ext4 $IMAGE_FILE ; fi

rm -rf $MOUNTPOINT/*

mkdir -p $MOUNTPOINT && mount -t auto -o loop $IMAGE_FILE $MOUNTPOINT && \
  /docker-entrypoint.sh postgres
