if [[ $UPGRADETYPE = "rel" ]];
    then print "Release upgrade. Got it." 
    export RELEASEPATH=/home/$UPGRADETYPE   # where you put the files
    echo "setting up working directory..."
    rm -rf ${RELEASEPATH}
    mkdir -p ${RELEASEPATH}
    cd ${RELEASEPATH}
    echo "starting download..."
    ftp ftp://mirror.planetunix.org/pub/OpenBSD/5.2/i386/bsd*
    ftp ftp://mirror.planetunix.org/pub/OpenBSD/5.2/i386/*tgz
elif [[ $UPGRADETYPE = "snp" ]];
    then print "Snapshot upgrade. Got it." 
    export RELEASEPATH=/home/$UPGRADETYPE   # where you put the files
    echo "setting up working directory..."
    rm -rf ${RELEASEPATH}
    mkdir -p ${RELEASEPATH}
    cd ${RELEASEPATH}
    echo "starting download..."
    ftp ftp://mirror.planetunix.org/pub/OpenBSD/snapshots/i386/bsd*
    ftp ftp://mirror.planetunix.org/pub/OpenBSD/snapshots/i386/*tgz
else
    print "Must run with: UPGRADETYPE=rel or snp ", $0
    exit 1
fi
echo "starting upgrade..."
rm /obsd ; ln /bsd /obsd && cp bsd /nbsd && mv /nbsd /bsd
cp bsd.rd bsd.mp /
cp /sbin/reboot /sbin/oreboot
echo "starting untar..." 
tar -C / -xzphf xserv52.tgz
tar -C / -xzphf xfont52.tgz
tar -C / -xzphf xshare52.tgz
tar -C / -xzphf xbase52.tgz
tar -C / -xzphf game52.tgz
tar -C / -xzphf comp52.tgz
tar -C / -xzphf man52.tgz
tar -C / -xzphf base52.tgz # Install last!
echo "run /sbin/oreboot"
