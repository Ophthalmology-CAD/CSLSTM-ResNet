#!/bin/bash

TOOLS=../build/tools

export HDF5_DISABLE_VERSION_CHECK=1
export PYTHONPATH=.

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
	do
	sed -i 's/5-6-2caffe_resnet50.*/5-6-2caffe_resnet50_train_'$i'"/g' ./5-6resnet_50_solver.prototxt
        #find -name '5-6resnet_50_solver.prototxt' | xargs perl -pi -e 's|resnet50_train_.|resnet50_train_'$i'|g'
	sed -i 's/pos_mult:.*/pos_mult: '$i'/g' ./5-6resnet_50.prototxt
	GLOG_logtostderr=1 $TOOLS/caffe train --solver=./5-6resnet_50_solver.prototxt -weights ./ResNet-50-model.caffemodel
	echo "Done."
	done
