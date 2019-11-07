# -*- coding: utf-8 -*-
"""
Created on Tue May 15 19:54:28 2018
提供给WebService程序调用模型使用代码
@author: ChenWen
"""
import soundProcessing as sp
import tensorflowTrain as tft
import pandas as pd

def main(fileName):
    feature = sp.loadData(fileName)
    lables = tft.recoverModel(feature)#获取文件中每个采样点的分类信息
    lables_pd = pd.Series(lables)#将Array通过Pandas进行序列化
    lable = lables_pd.mode()#求取分类众数
    lable = lable[0]
    return lable

main("C:\\Users\\ChenWen\\Desktop\\yinpinTrain\\UrbanSound8K\\17592.wav")