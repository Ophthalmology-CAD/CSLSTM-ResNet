#!/bin/bash

TOOLS=../build/tools

export HDF5_DISABLE_VERSION_CHECK=1
export PYTHONPATH=.


for i in 1 2 3 4 5
	do
	sed -i 's;/5-cross/train.;/5-cross/train'$i';g;' ./5-6new.py 
	sed -i 's;/5-cross/test.;/5-cross/test'$i';g;' ./5-6new.py 
	find -name '5-6resnet_50_solver.prototxt' | xargs perl -pi -e 's|5-6-.|5-6-'$i'|g'
	GLOG_logtostderr=1 $TOOLS/caffe train --solver=./5-6resnet_50_solver.prototxt -weights ./ResNet-50-model.caffemodel 
	#GLOG_logtostderr=1  $TOOLS/caffe train -solver lstm_solver_RGB-2.prototxt
	echo "Done."
	done
