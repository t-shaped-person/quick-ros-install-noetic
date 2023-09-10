mkdir -p ~/ros_ws/src
cd ~/ros_ws
catkin_make
echo -e "\033[31m"Catkin workspace is created"\033[0m"

echo "source ~/ros_ws/devel/setup.bash" >> ~/.bashrc
echo "alias sai='sudo apt install'" >> ~/.bashrc
echo "alias cw='cd ~/ros_ws'" >> ~/.bashrc
echo "alias cs='cd ~/ros_ws/src'" >> ~/.bashrc
echo "alias cm='cd ~/ros_ws && catkin_make'" >> ~/.bashrc
echo "alias eb='nano ~/.bashrc'" >> ~/.bashrc
echo "alias sb='source ~/.bashrc'" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc
echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc
echo -e "\033[31m"bashrc modification is done. shotcut etc."\033[0m"

sudo apt install -y ros-noetic-tf ros-noetic-joy \
 ros-noetic-teleop-twist-joy \
 ros-noetic-teleop-twist-keyboard \
 ros-noetic-laser-proc ros-noetic-rgbd-launch \
 ros-noetic-depthimage-to-laserscan \
 ros-noetic-rosserial-arduino ros-noetic-rosserial-python \
 ros-noetic-rosserial-server ros-noetic-rosserial-client \
 ros-noetic-rosserial-msgs ros-noetic-amcl \
 ros-noetic-map-server ros-noetic-move-base \
 ros-noetic-urdf ros-noetic-xacro ros-noetic-usb-cam \
 ros-noetic-compressed-image-transport \
 ros-noetic-rqt-image-view ros-noetic-gmapping \
 ros-noetic-navigation ros-noetic-interactive-markers \
 ros-noetic-ar-track-alvar ros-noetic-ar-track-alvar-msgs \
 openssh-server \
 net-tools
echo -e "\033[31m"extra ros package installation is done"\033[0m"

cd ~/ros_ws/src
git clone https://github.com/omorobot/omo_r1.git
cd ~/ros_ws/src/omo_r1
git checkout dev_r1d2
sleep 5
cd ~/ros_ws/src
git clone https://github.com/omorobot/ydlidar_ros.git
cd ~/ros_ws
catkin_make
echo -e "\033[31m"omo_r1, ydlidar_ros package is downloaded and catkin_make is done"\033[0m"

sudo rosdep fix-permissions
rosdep update
echo -e "\033[31m"rosdep permission is changed"\033[0m"
