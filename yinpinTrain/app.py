# -*- coding: utf-8 -*-
"""
Created on Sun May 13 15:47:23 2018

@author: ChenWen
"""

import soundProcessing as sp
import tensorflowTrain as tft
def main():
    #获得数据源
    features,labels = sp.save_or_read_file('UrbanSound8K/audio3',['fold']);
    labels = sp.one_hot_encode(labels)
    
    #启动TF
    tft.batchTrain(features,labels)
#开始训练模型 
main()
#ckpt转换为PB,方案一
#tft.ckpt2pb('model/model.ckpt')
#ckpt转换为PB,方案二
tft.ckpt2pb2()
#查PB文件中的节点信息
graph_def = tft.seeVariablePB('model/newPb.pb')
#查看CKPT文件中的节点信息
#var_to_shape_map = tft.seeVariableCKPT('model')
#pbtxt
#tft.convert_pb_to_pbtxt('model/newPb.pb')