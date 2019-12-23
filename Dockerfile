FROM centos:7

ENV DIAMOND_URL=http://files.latticesemi.com/Diamond/3.6/diamond_3_6-base_x64-83-4-x86_64-linux.rpm DIAMOND_DIR=/usr/local/diamond/3.6_x64
ENV bindir=$DIAMOND_DIR/bin/lin64 \
 QT_GRAPHICSSYSTEM=native \
 DIAMOND_TEMP_FILE=/tmp/diamond.rpm
 # LM_LICENSE_FILE=$HOME/license.dat

RUN yum update -y ; \
 yum install -y freetype libSM libXrender fontconfig libXext libXt \
  tcl tcsh perl libXft xorg-x11-fonts-Type1 net-tools \
  libXScrnSaver-1.2.2 \
  libusb-0.1.4 usbutils \
  make libxslt \
  patch \
  wget curl && \
 wget $DIAMOND_URL -O $DIAMOND_TEMP_FILE && \
 rpm -i $DIAMOND_TEMP_FILE && \
 rm -f $DIAMOND_TEMP_FILE && \
 echo "source $DIAMOND_DIR/bin/lin64/diamond_env" > /etc/profile.d/diamond.sh && \
 curl https://gist.githubusercontent.com/kost/73b29ce7a9011c15f2936bb517eb8e5b/raw/22cb91849013798f99b1b6d07d68bb6da18c69bc/platform_check_v36.diff | patch -d $DIAMOND_DIR/synpbase/bin/config -p0 && \
 echo "[Success]"

ENTRYPOINT ["/bin/bash"]
