## Usage Instructions for CSLSTM-ResNet:
* Clone this repository somewhere, let's refer to it as $ROOT
```
git clone https://github.com/Ophthalmology-CAD/CSLSTM-ResNet.git
```
### Train
* Compile the caffe and pycaffe.
```
cd $ROOT
make all 
make test 
make runtest 
make pycaffe
```
* Download the pre-trained model. 

    ResNet-50 model:（https://github.com/KaimingHe/deep-residual-networks#models）, put it in $ROOT/examples/LSTM-ResNet
* Run the 5-6run_lstm_RGB.sh in in the terminal window to train the CSLSTM-ResNet model
```
cd $ROOT/myself
sh 5-6run_lstm_RGB.sh
```
### Test

The test code is in $ROOT/myself/cost-test

* Run 5-6-resnet50_classify_video.py to test: in python terminal. 

