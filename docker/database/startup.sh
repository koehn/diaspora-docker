IMAGE_FILE=${IMAGE_FILE:-/var/cache/postgres/databaseimage.img}
MOUNTPOINT=${MOUNTPOINT:-/var/lib/postgresql}
SIZE=${SIZE:-1000M}

echo IMAGE_FILE: $IMAGE_FILE
echo MOUNTPOINT: $MOUNTPOINT
echo SIZE: $SIZE

# Create a disk image of the given size at the given location and mount
# it at the given mountpoint

mkdir -p /var/cache/postgres

if [ ! -f $IMAGE_FILE ]; then \
    fallocate -l $SIZE $IMAGE_FILE && \
    mkfs -t ext4 $IMAGE_FILE ; fi

mkdir -p $MOUNTPOINT && mount -t auto -o loop $IMAGE_FILE $MOUNTPOINT
