# quick-ros-install

다양한 버전의 우분투 리눅스에서 ROS를 설치하기 위한 스크립트입니다.  
우분투 18.04, ROS-noetic 버전에서 테스트되었습니다. 

Instant install script for ROS on various versions of Ubuntu Linux

이 프로젝트중 ros_install.sh는 다음 라이센스를 따릅니다.
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)  
Copyright (c) 2014 OROCA and ROS Korea Users Group  
Copyright (c) 2018 PickNik Consulting  
Copyright (c) 2021 Kyuhyong You  
OMOROBOT INC 에서 수정됨

우선 nuc 및 jetson nano에 ubuntu 18.04를 설치한다.  
그리고 업데이트를 먼저 수행하고 완료되면 재부팅 후 ros 설치를 시작한다.

## ros 설치하기

ros-noetic 버전을 설치하는 경우 터미널에 다음과 같이 입력합니다.  

```
sudo ./1_ros_install.sh noetic
```
설치가 완료되면 재부팅 하도록 한다.  
참고로 roscore, turtlesim으로 테스트는 아래 catkin_install~하고 하자. 권한 문제로 실행 안된다.


## 추가 패키지 다운로드, 환경 설정 및 catkin_make

ROS 설치 후 아래 명령중 하나를 실행하여 catkin_ws를 생성한다.  
그리고 .bashrc 에 각종 단축키 등을 등록하고 r1 or r1mini 관련  
추가 패키지를 다운로드 및 catkin_make 한다.

설치 중간에 비밀번호 입력하는 부분이 있다.  
잘보고 있다가 비밀번호 넣자. 설치는 그렇게 오래 걸리지 않는다.

r1 패키지 설치 할 경우
```
./2_catkin_install_r1.sh
```
r1d2 패키지 설치 할 경우
```
./2_catkin_install_r1d2.sh
```
r1mini 패키지 설치 할 경우
```
./2_catkin_install_r1mini.sh
```
PC를 재부팅 하도록 한다.

## usb 장치 이름 고정하기 udev rules

jetson nano의 경우 usb 연결 시 별다른 제약사항이 없다.
하지만 nuc의 경우 usb 위치를 고정하였기때문에 usb 연결 시 주의하자.
일반적으로 전면은 mobile robot(usb가 2개일 경우 오른쪽)
후면은 lidar(usb가 2개일 경우 위쪽)으로 연결하면 된다.
r1d2 robot 출하시 라벨이 붙어서 나간다.
참고로 nuc가 뒤집어져서 설치되어 있기때문에 위치 확인 잘하자.

r1mini udev rules 설정(jetson nano)
```
sudo ./3_r1mini_udev_rules.sh
```
r1 udev rules 설정(nuc11tnhi7, nuc11pahi5)
```
sudo ./3_r1_udev_rules.sh
```
r1d2 udev rules 설정(nuc11tnhi7, nuc11pahi5)
```
sudo ./3_r1d2_udev_rules.sh
```
혹시 다른 pc를 사용한다면 아래 명령으로 위치 확인하여 수정하도록 한다.
```
udevadm info -a -n /dev/ttyUSB*
```

## ros-ipset.sh

ros-ipset.sh 스크립트를 실행하면 ifconfig로 검색하여 export MATER_URI와 HOST_NAME IP를 자동으로 설정합니다.  
상기 catkin_install_r1.sh 혹은 catkin_install_r1mini.sh 를 설치하면 localhost 를 기본으로 등록된다.

roscore를 자체 PC에서 구동하는 경우 그냥 ros-ipset.sh 를 실행하면 됩니다.
```
./ros-ipset.sh
```
원격의 MASTER IP로 연결하는 경우 해당 IP 주소를 입력합니다.  
MASTER주소가 192.168.1.1 인 경우
```
./ros-ipset.sh 192.168.1.1
```
---

Maintained by OMOROBOT INC
