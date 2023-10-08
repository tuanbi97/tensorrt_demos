#!/bin/bash

set -e

# yolov7-tiny
wget https://raw.githubusercontent.com/AlexeyAB/darknet/master/cfg/yolov7-tiny.cfg -q --show-progress --no-clobber
wget https://github.com/AlexeyAB/darknet/releases/download/yolov4/yolov7-tiny.weights -q --show-progress --no-clobber

# yolov7
wget https://raw.githubusercontent.com/AlexeyAB/darknet/master/cfg/yolov7.cfg -q --show-progress --no-clobber
wget https://github.com/AlexeyAB/darknet/releases/download/yolov4/yolov7.weights -q --show-progress --no-clobber

# yolov7x
wget https://raw.githubusercontent.com/AlexeyAB/darknet/master/cfg/yolov7x.cfg -q --show-progress --no-clobber
wget https://github.com/AlexeyAB/darknet/releases/download/yolov4/yolov7x.weights -q --show-progress --no-clobber

echo
echo "Creating yolov7-tiny-288.cfg and yolov7-tiny-288.weights"
cat yolov7-tiny.cfg | sed -e '6s/batch=64/batch=1/' | sed -e '8s/width=416/width=288/' | sed -e '9s/height=416/height=288/' > yolov7-tiny-288.cfg
echo >> yolov7-tiny-288.cfg
ln -sf yolov7-tiny.weights yolov7-tiny-288.weights
echo "Creating yolov7-tiny-416.cfg and yolov7-tiny-416.weights"
cat yolov7-tiny.cfg | sed -e '6s/batch=64/batch=1/' > yolov7-tiny-416.cfg
echo >> yolov7-tiny-416.cfg
ln -sf yolov7-tiny.weights yolov7-tiny-416.weights

echo "Creating yolov7-320.cfg and yolov7-320.weights"
cat yolov7.cfg | sed -e '6s/batch=64/batch=1/' | sed -e '8s/width=640/width=320/' | sed -e '9s/height=640/height=320/' > yolov7-320.cfg
ln -sf yolov7.weights yolov7-320.weights
echo "Creating yolov7-640.cfg and yolov7-640.weights"
cat yolov7.cfg | sed -e '6s/batch=64/batch=1/' > yolov7-640.cfg
ln -sf yolov7.weights yolov7-640.weights

echo "Creating yolov7x-320.cfg and yolov7x-320.weights"
cat yolov7x.cfg | sed -e '6s/batch=64/batch=1/' | sed -e '8s/width=640/width=320/' | sed -e '9s/height=640/height=320/' > yolov7x-320.cfg
ln -sf yolov7x.weights yolov7x-320.weights
echo "Creating yolov7x-640.cfg and yolov7x-640.weights"
cat yolov7x.cfg | sed -e '6s/batch=64/batch=1/' > yolov7x-640.cfg
ln -sf yolov7x.weights yolov7x-640.weights

echo
echo "Done."
