FROM debian:jessie

RUN IMAGE_FILE=${IMAGE_FILE-/var/cache/databaseimage.img}
RUN MOUNTPOINT=${MOUNTPOINT-/var/lib/postgresql}
RUN SIZE=${SIZE-1000M}

# Create a disk image of the given size at the given location and mount
# it at the given mountpoint
RUN if [ ! -f $IMAGE_FILE ]; then \
    fallocate -l $SIZE $IMAGE_FILE && \
    mkfs -t ext4 $IMAGE_FILE ; fi

RUN mount -t auto -o loop $IMAGE_FILE $MOUNTPOINT
