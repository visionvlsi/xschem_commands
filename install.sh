##Xschem dependencies
sudo apt-get update -y --assume-yes
sudo apt-get install -y libx11-6 --assume-yes
sudo apt-get install -y libxrender1 --assume-yes
sudo apt-get install -y libxcb1 --assume-yes
sudo apt-get install -y libcairo2 --assume-yes
sudo apt-get install -y tcl8.6 --assume-yes
sudo apt-get install -y tk8.6 --assume-yes
sudo apt-get install -y flex --assume-yes
sudo apt-get install -y libxpm4 --assume-yes
sudo apt-get install -y libx11-dev --assume-yes
sudo apt-get install -y libxrender-dev --assume-yes
sudo apt-get install -y libx11-xcb-dev --assume-yes
sudo apt-get install -y libcairo2-dev --assume-yes
sudo apt-get install -y tk8.6-dev --assume-yes
sudo apt-get install -y bison --assume-yes
sudo apt-get install -y libxpm-dev --assume-yes
sudo apt-get install -y gawk --assume-yes

##Magic dependencies
sudo apt-get install m4 --assume-yes
sudo apt-get install tcsh --assume-yes
sudo apt-get install csh --assume-yes
sudo apt-get install libx11-dev --assume-yes
sudo apt-get install tcl-dev tk-dev --assume-yes
sudo apt-get install libcairo2-dev --assume-yes
sudo apt-get install mesa-common-dev libglu1-mesa-dev --assume-yes
sudo apt-get install libncurses-dev --assume-yes

##ngspice dependencies
sudo apt-get install build-essential --assume-yes
sudo apt-get install automake libtool gperf flex bison --assume-yes
sudo apt-get install libxml2 libxml2-dev --assume-yes
sudo apt-get install libxml-libxml-perl --assume-yes
sudo apt-get install libgd-perl --assume-yes
##ngspice dependencies
sudo apt-get install -y libxaw7-dev --assume-yes
sudo apt-get install -y libreadline-dev --assume-yes
sudo apt install vim-gtk3 --assume-yes
sudo apt-get install -y xterm --assume-yes

sudo apt install vim-gtk3 --assume-yes
sudo apt-get install -y xterm --assume-yes

## xschem
git clone https://github.com/StefanSchippers/xschem.git
cd xschem
./configure
sudo make
sudo make install
cd

## skywater-pdk
git clone https://github.com/google/skywater-pdk
cd skywater-pdk/
git submodule init libraries/sky130_fd_io/latest
git submodule init libraries/sky130_fd_pr/latest
git submodule init libraries/sky130_fd_sc_hd/latest
git submodule init libraries/sky130_fd_sc_hvl/latest
git submodule update
sudo make timing
cd

## Magic
git clone https://github.com/RTimothyEdwards/magic.git
cd magic/
./configure 
sudo make
sudo make install
cd

##open-pdk
git clone https://github.com/RTimothyEdwards/open_pdks.git
cd open_pdks/
./configure --enable-sky130-pdk=/home/student/skywater-pdk/libraries
sudo make 
sudo make install
cd

##ADMS required for ngspice
git clone https://github.com/Qucs/ADMS.git
cd ADMS/
sh bootstrap.sh 
./configure 
sudo make install
cd

##ngspice
git clone https://git.code.sf.net/p/ngspice/ngspice 
cd ngspice/
git checkout pre-master
export LD_LIBRARY_PATH=/usr/local/lib
./autogen.sh --adms
mkdir release
cd release
../configure --with-x --enable-xspice --disable-debug --enable-cider --with-readline=yes --enable-openmp
sudo make
sudo make install
cd
