# -*- coding: utf-8 -*-
"""
Created on Sun May 13 13:33:55 2018
该文件定义实现了对音频数据集的相关处理操作
@author: ChenWen
"""
import librosa
import librosa.display
import os
import glob
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.pyplot import specgram

'''对音频信号进行特征提取'''
def extract_features(file_name):
    X, sample_rate = librosa.load(file_name)
    stft = np.abs(librosa.stft(X))  # 短时傅里叶变换
    mfccs = np.array(librosa.feature.mfcc(y=X, sr=sample_rate, n_mfcc=8).T)  # 梅尔频率倒谱系数
    chroma = np.array(librosa.feature.chroma_stft(S=stft, sr=sample_rate).T)  # 色度图
    mel = np.array(librosa.feature.melspectrogram(X, sr=sample_rate).T)  # 梅尔频谱
    contrast = np.array(librosa.feature.spectral_contrast(S=stft, sr=sample_rate).T)  # 谱对比
    tonnetz = np.array(librosa.feature.tonnetz(y=librosa.effects.harmonic(X), sr=sample_rate).T)  # 音调质心特征
    # y:音频时间序列，
    return mfccs, chroma, mel, contrast, tonnetz
'''自动载入数据文件夹Wav数据'''
def parse_audio_files(parent_dir, sub_dirs, file_ext='*.wav'):
    ignored = 0#错误文件计数器
    #初始化features,lables,name 矩阵变量
    features, labels = np.empty((0, 161)), np.empty(0)
    for label, sub_dir in enumerate(sub_dirs):
        print("当前扫描父级文件路径:"+sub_dir)
        for fn in glob.glob(os.path.join(parent_dir, sub_dir, file_ext)):
            try:
                print('当前特征提取文件路径：'+fn)
                mfccs, chroma, mel, contrast, tonnetz = extract_features(fn)
                ext_features = np.hstack([mfccs, chroma, mel, contrast, tonnetz])
                features = np.vstack([features, ext_features])
                #转换  0：air_conditioner 0  4：drilling 1   5：engine_idling 2  6：gun_shot 3  7：jackhammer 4
                la = fn.split('-')[1]
                if la=='0':
                    l = [0] * (mfccs.shape[0])
                if la=='4':
                    l = [1] * (mfccs.shape[0])
                if la=='5':
                    l = [2] * (mfccs.shape[0])
                if la=='6':
                    l = [3] * (mfccs.shape[0])
                if la=='7':
                    l = [4] * (mfccs.shape[0])
                #l = [fn.split('-')[1]] * (mfccs.shape[0])
                labels = np.append(labels, l)
            except(KeyboardInterrupt, SystemExit):
                print('操作中断，系统退出，请重试！')
                raise
            except:
                print('发现异常文件:'+fn)
                ignored += 1
    print("Ignored files(发现异常数据文件数量): ", ignored)
    return np.array(features), np.array(labels, dtype=np.int)

#处理lables
def one_hot_encode(labels):
    n_labels = len(labels)#获取labels的长度
    n_unique_labels = len(np.unique(labels))#去重复后的lables
    one_hot_encode = np.zeros((n_labels, n_unique_labels))#使用0矩阵初始化one_hot_encode：【173，1】
    one_hot_encode[np.arange(n_labels), labels] = 1
    return one_hot_encode

    
#获取labels,features数据
def save_or_read_file(parent_dir,sub_dirs):
    try:
        labels = np.load('source/labels.npy')
        features = np.load('source/features.npy')
        print("Features and labels found!(查找特征数据文件与分类数据文件---成功)")
    except:
        print("Extracting features and labels...(正在创建特征数据与分类数据---请等待)")
        features, labels = parse_audio_files(parent_dir, sub_dirs)
    with open('source/features.npy', 'wb') as f1:
        np.save(f1, features)
    with open('source/labels.npy', 'wb') as f2:
        np.save(f2, labels)
    return features,labels
'''创建单文件特征'''
def loadData(file_name):
    mfccs, chroma, mel, contrast, tonnetz = extract_features(file_name)
    feature = np.empty((0, 161))
    ext_feature = np.hstack([mfccs, chroma, mel, contrast, tonnetz])
    feature = np.vstack([feature, ext_feature])
    return feature
    
    
    
def deteleFile():
    parent_dir='C:\\Users\\ChenWen\\Desktop\\yinpinTrain\\UrbanSound8K\\audio3'
    sub_dirs = ['fold1','fold2','fold3','fold4','fold5','fold6','fold7','fold8','fold9','fold10']
    file_ext = '*.wav'
    for label, sub_dir in enumerate(sub_dirs):
        print("当前扫描父级文件路径:"+sub_dir)
        for fn in glob.glob(os.path.join(parent_dir, sub_dir, file_ext)):
            lable = fn.split('-')[1]
            if lable == '1' or lable == '2' or lable == '3' or lable == '8' or lable == '9':
                os.remove(fn)

def load_sound_files(file_paths):
    raw_sounds = []
    for fp in file_paths:
        X,sr = librosa.load(fp)
        raw_sounds.append(X)
    return raw_sounds
def plot_waves(sound_names,raw_sounds):
    i = 1
    plt.figure(figsize=(25,60))
    for n,f in zip(sound_names,raw_sounds):
        plt.subplot(10,1,i)
        librosa.display.waveplot(np.array(f),sr=22050)
        plt.title(n.title())
        i += 1
    
    plt.rcParams['font.sans-serif']=['SimHei'] #用来正常显示中文标签
    plt.rcParams['axes.unicode_minus']=False #用来正常显示负号
    plt.suptitle(u"Figure 1: 音频波形图",x=0.5, y=0.915,fontsize=18)
    plt.show()
def plot_specgram(sound_names,raw_sounds):
    i = 1
    plt.figure(figsize=(25,60))
    for n,f in zip(sound_names,raw_sounds):
        plt.subplot(10,1,i)
        specgram(np.array(f), Fs=22050)
        plt.title(n.title())
        i += 1
    
    plt.rcParams['font.sans-serif']=['SimHei'] #用来正常显示中文标签
    plt.rcParams['axes.unicode_minus']=False #用来正常显示负号
    plt.suptitle(u"Figure 2: 音频图谱",x=0.5, y=0.915,fontsize=18)
    plt.show()
    
def plot():
    file_paths = ['C:\\Users\\ChenWen\\Desktop\\yinpinTrain\\UrbanSound8K\\audio3\\fold\\13230-0-0-10.wav','C:\\Users\\ChenWen\\Desktop\\yinpinTrain\\UrbanSound8K\\audio3\\fold\\14113-4-0-0.wav','C:\\Users\\ChenWen\\Desktop\\yinpinTrain\\UrbanSound8K\\audio3\\fold\\15544-5-0-2.wav','C:\\Users\\ChenWen\\Desktop\\yinpinTrain\\UrbanSound8K\\audio3\\fold\\25038-6-0-0.wav','C:\\Users\\ChenWen\\Desktop\\yinpinTrain\\UrbanSound8K\\audio3\\fold\\24728-7-3-0.wav']
    sound_names = ['0','1','2','3','4']
    raw_sounds = load_sound_files(file_paths)
    plot_waves(sound_names,raw_sounds)
    plot_specgram(sound_names,raw_sounds)