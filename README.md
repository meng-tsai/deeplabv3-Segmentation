
# Pytorch deeplabv3-ResNet-101

 - Pretrained deeplabv3-ResNet-101 image segmentation model using Group Normalization + Weight Standardization
 - Support TPU and GPU using Google Colab
 - Support the following dataset:
	 - CityScapes
	 - Pascal VOC2012
	 - NYU Depth Dataset V2 (wall, floor, and ceiling only)

## Installation

Clone the repository and save to Google Colab/Google Drive

```bash
git clone https://github.com/ashura1234/deeplabv3-Segmentation
```
## Data Preperation

### CityScapes Dataset
```bash
mkdir {CityScapes,CityScapes/data,CityScapes/data/Predictions}
cd CityScapes
```
Register and download leftImg8bit_trainvaltest.zip and gtFine_trainvaltest.zip from:
https://www.cityscapes-dataset.com/downloads/ \
Put the downloaded zip files into CityScapes folder and run the following commands in Terminal
```bash
unzip leftImg8bit_trainvaltest.zip
unzip gtFine_trainvaltest.zip
git clone https://github.com/mcordts/cityscapesScripts.git
mv cityscapesScripts/cityscapesscripts ./
rm -rf cityscapesScripts
python cityscapesscripts/preparation/createTrainIdLabelImgs.py
cd data
wget https://github.com/ashura1234/deeplabv3-Segmentation/blob/main/pascal_seg_colormap.mat
```
Put the CityScapes folder into the Google Drive folder containing cloned repo

### Pascal VOC2012 Dataset

Download -   [Train/Validation Data (1.9 GB)](http://pjreddie.com/media/files/VOCtrainval_11-May-2012.tar)
Run the following commands in Terminal:
```bash
tar -xf VOCtrainval_11-May-2012.tar
cd VOCdevkit/VOC2012/
mkdir {data,data/Predictions}
wget http://cs.jhu.edu/~cxliu/data/SegmentationClassAug.zip
wget http://cs.jhu.edu/~cxliu/data/SegmentationClassAug_Visualization.zip
wget http://cs.jhu.edu/~cxliu/data/list.zip
unzip SegmentationClassAug.zip
unzip SegmentationClassAug_Visualization.zip
unzip list.zip
cd data
wget https://github.com/ashura1234/deeplabv3-Segmentation/blob/main/pascal_seg_colormap.mat
```
Put the VOC2012 folder into the Google Drive folder containing cloned repo


### NYU Depth Dataset V2

Download [Labeled Dataset](https://cs.nyu.edu/~silberman/datasets/nyu_depth_v2.html)
Run the following commands in Terminal:
```bash
mkdir IndoorNYU
cd IndoorNYU
mkdir {images,images/train,images/train/1,images/val,images/val/1,depths,labels,target,target/train,target/train/1,target/val,target/val/1,data,data/Predictions,data/Preditions/test}
wget http://horatio.cs.nyu.edu/mit/silberman/nyu_depth_v2/nyu_depth_v2_labeled.mat
wget https://github.com/ashura1234/deeplabv3-Segmentation/blob/main/get_instance_masks.m
wget https://github.com/ashura1234/deeplabv3-Segmentation/blob/main/output.m
cd data
wget https://github.com/ashura1234/deeplabv3-Segmentation/blob/main/pascal_seg_colormap.mat
```
Run output.m using Matlab\
Put the IndoorNYU folder into the Google Drive folder containing cloned repo

## Segmentation Performance
Trained 50 ephochs with 0.007 learning rate\
Predcted segmentation images are in data/Predictions folder\
Result of applying the trained model to validation dataset:
|      | CityScapes | Pascal VOC 2012| NYU depth v2 |
|---   |---         |---             |---          |
| mIoU | <center>68.02%</center> | <center>76.63%</center> | Wall 73.85%<br>Floor 62.42% |

## Applied on Collected Images
Use model trained by NYU depth dataset v2.
50 epochs, lr = 0.007

|Original image | Prediction|
|---|---|
|<img  src="https://github.com/ashura1234/deeplabv3-Segmentation/blob/main/img/original.png?raw=true"  width=240>|<img  src="https://github.com/ashura1234/deeplabv3-Segmentation/blob/main/img/prediction.png?raw=true"  width=240>|

## License
Credit to # [chenxi116](https://github.com/chenxi116)

BSD 3-Clause License\
Copyright (c) 2018, Chenxi Liu\
All rights reserved.
<!--stackedit_data:
eyJoaXN0b3J5IjpbODA5Nzk3MzM2XX0=
-->