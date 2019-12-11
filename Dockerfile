FROM nunofernandes/centos7-32bits

ENV DIAMOND_URL=http://files.latticesemi.com/Diamond/3.7/diamond_3_7-base-96-1-i386-linux.rpm DIAMOND_DIR=/usr/local/diamond/3.7
ENV bindir=$DIAMOND_DIR/bin/lin \
 QT_GRAPHICSSYSTEM=native \
 DIAMOND_TEMP_FILE=/tmp/diamond.rpm
 # LM_LICENSE_FILE=$HOME/license.dat

RUN yum update -y ; \
 yum install -y freetype libSM libXrender fontconfig libXext libXt \
  tcl tcsh perl libXft xorg-x11-fonts-Type1 net-tools \
  libXScrnSaver-1.2.2 \
  libusb-0.1.4 usbutils \
  wget && \
 wget $DIAMOND_URL -O $DIAMOND_TEMP_FILE && \
 rpm -i $DIAMOND_TEMP_FILE && \
 rm -f $DIAMOND_TEMP_FILE && \
 echo "source $DIAMOND_DIR/bin/lin/diamond_env" > /etc/profile.d/diamond.sh && \
 echo "[Success]"

ENTRYPOINT ["/bin/bash"]
