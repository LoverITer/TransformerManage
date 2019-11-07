# -*- coding: utf-8 -*-
"""
Created on Sun May 13 15:00:10 2018
TensorFlow数据集训练测试
@author: ChenWen
"""
import os
import numpy as np
import matplotlib.pyplot as plt
import tensorflow as tf
from sklearn.preprocessing import StandardScaler
from sklearn.cross_validation import train_test_split
from sklearn.utils import shuffle
from sklearn.metrics import precision_recall_fscore_support
from tensorflow.python.tools import freeze_graph
from tensorflow.python import pywrap_tensorflow  
from tensorflow.python.platform import gfile  

def data_split(features,labels):
    #数据分割，创建训练集、测试集
    train_x, test_x, train_y, test_y = train_test_split(features, labels, test_size=0.3, random_state=0)
    sc = StandardScaler()       #标准化组件初始化
    sc.fit(train_x)             #对训练集进行fit操作，固化标准差，均值，方差等信息
    with open("source/fit_params.npy", "wb") as f3:
        np.save(f3, train_x)
        f3.close
    #训练集与测试集数据标准化
    train_x = sc.transform(train_x)
    test_x = sc.transform(test_x)
    return train_x,test_x,train_y,test_y
    
def tf_config(features):
    os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'  # 指定Log配置，‘1’-显示所有信息、‘2’-只显示warning和error、‘3’-只显示error
    
    n_dim = features.shape[1]                 # 161 获取fratures的列数
    n_classes = 5                            # 设置分类种类为10  5
    '''配置神经网络层数与神经元个数'''
    n_hidden_units_one = 256
    n_hidden_units_two = 256
    
    sd = 1 / np.sqrt(n_dim)#计算标准差
    learning_rate = 0.01 #设置学习深度（学习率）
    # 初始化创建TensorFlow占位符
    X = tf.placeholder(tf.float32, [None, n_dim],name='inputX')
    Y = tf.placeholder(tf.float32, [None, n_classes],name='inputY')
    
    # 设置第一层神经元的输入
    W_1 = tf.Variable(tf.random_normal([n_dim, n_hidden_units_one], mean=0, stddev=sd),name='W_1')
    b_1 = tf.Variable(tf.random_normal([n_hidden_units_one], mean=0, stddev=sd),name='b_1')
    h_1 = tf.nn.tanh(tf.matmul(X, W_1) + b_1)
    tf.summary.histogram('W_1', W_1)
    tf.summary.histogram('b_1', b_1)
   
    
    # 设置第二层神经元的输入
    W_2 = tf.Variable(tf.random_normal([n_hidden_units_one, n_hidden_units_two], mean=0, stddev=sd),name='W_2')
    b_2 = tf.Variable(tf.random_normal([n_hidden_units_two], mean=0, stddev=sd),name='b_2')
    h_2 = tf.nn.sigmoid(tf.matmul(h_1, W_2) + b_2)
    tf.summary.histogram('W_2', W_2)
    tf.summary.histogram('b_2', b_2)
    
    # 神经网络
    W = tf.Variable(tf.random_normal([n_hidden_units_two, n_classes], mean=0, stddev=sd),name='W')
    b = tf.Variable(tf.random_normal([n_classes], mean=0, stddev=sd),name='b')
    y_ = tf.nn.softmax(tf.matmul(h_2, W) + b)
    
    
    init = tf.global_variables_initializer()
   
    
    train_writer = tf.summary.FileWriter('log/')
    train_writer.add_graph(tf.get_default_graph())     #保存默认的图
   
    # 目标类别和预测类别之间的交叉熵
    cost_function = tf.reduce_mean(-tf.reduce_sum(Y * tf.log(y_), reduction_indices=[1]))  
    # 优化器
    optimizer = tf.train.GradientDescentOptimizer(learning_rate).minimize(cost_function)
    # tf.argmax(y_,1):正确的标签；tf.argmax(y,1):预测的标签；返回的是布尔数组
    correct_prediction = tf.equal(tf.argmax(y_, 1), tf.argmax(Y, 1))
    # 准确率 将布尔值转换为浮点数，求平均值 accuracy = 
    tf.reduce_mean(tf.cast(correct_prediction, tf.float32))
    return init,cost_function,optimizer,X,Y,y_,train_writer
    
def batchTrain(features,labels):
    training_epochs = 300   #训练循环次数 -----3000
    batch_size = 500         #批量学习数量   ----300
    patience_cnt = 0         #初始容忍变量
    patience = 16            #容忍逆序增大次数
    min_delta = 0.01         #容忍差阈值
    stopping = 0             #训练终结标志位
    cost_history = np.empty(shape=[1], dtype=float)  #初始化损失函数
    y_true, y_pred = None, None                      #初始化测试集真值，预测值变量
    '''加载数据集'''
    train_x,test_x,train_y,test_y = data_split(features,labels)
    '''加载TF运行配置'''
    init,cost_function,optimizer,X,Y,y_,train_writer = tf_config(features);
    
    with tf.Session() as sess:
        sess.run(init)
        for epoch in range(training_epochs):
            if stopping == 0:
                total_batch = (train_x.shape[0] // batch_size)
                train_x = shuffle(train_x, random_state=42)
                train_y = shuffle(train_y, random_state=42)
                for i in range(total_batch):
                    # 数据batch化
                    batch_x = train_x[i * batch_size:i * batch_size + batch_size]  
                    batch_y = train_y[i * batch_size:i * batch_size + batch_size]
                    _, cost = sess.run([optimizer, cost_function], feed_dict={X: batch_x, Y: batch_y})
                cost_history = np.append(cost_history, cost)
                
                if epoch % 100 == 0:
                    print("Epoch: ", epoch, " cost ", cost)
                if epoch > 0 and abs(cost_history[epoch - 1] - cost_history[epoch]) > min_delta:
                    patience_cnt = 0
                else:
                    patience_cnt += 1
                if patience_cnt > patience:
                    print("Early stopping at epoch ", epoch, ", cost ", cost)
                    stopping = 1
        y_pred = sess.run(tf.argmax(y_, 1), feed_dict={X: test_x})
        y_true = sess.run(tf.argmax(test_y, 1))
        # 模型固化
        saver = tf.train.Saver()
        saver.save(sess, 'model/model.ckpt')
    '''绘制损失曲线'''
    plt.plot(cost_history)
    plt.axis([0,training_epochs,0,np.max(cost_history)])
    plt.show()
        
    print("测试集真值:"+"预测的结果:")
    # print(y_true , y_pred)
    # print(confusion_matrix(y_true,y_pred))
    print('--------------')
    p, r, f, s = precision_recall_fscore_support(y_true, y_pred)
    print("F-Score(F值):", f)
    print("Precision(准确率):", p)
    print("Recall(召回率):", r)
    
def ckpt2pb(ckptpath):
    saver = tf.train.Saver()#创建model加载对象
    with tf.Session() as sess:
        saver.restore(sess, ckptpath)
        #保存图
        tf.train.write_graph(sess.graph_def, 'model', 'pbModel.pb')
        #把图和参数结构一起,11个参数：模型文件、saver解析器、设置模型文件进制/False、检查点数据文件、输出节点名称、‘save/restore_all’、保存整合后的输出、是否清除运算设备True、
        freeze_graph.freeze_graph('model/pbModel.pb', '', False, ckptpath, 'Softmax','save/restore_all', 'save/Const:0', 'model/frozen_pb_model.pb', True,'','')
        sess.close
    print("PB文件转换成功")
'''通过PB恢复模型'''
def recoverModel(feature):
    result = None
    with tf.Session() as sess:
        with open('model/newPb.pb', 'rb') as f: # 这里设置使用的pb名称
            graph_def = tf.GraphDef()
            graph_def.ParseFromString(f.read()) 
            sess.run(tf.initialize_all_variables())
            graph = sess.graph
            X = graph.get_tensor_by_name('inputX:0')
            result = graph.get_tensor_by_name('Softmax:0')
            result = sess.run(result,feed_dict={X:feature})
            result = np.argmax(result,1)
    return result
'''查看ckpt中的变量'''
def seeVariableCKPT(model_dir):
    checkpoint_path = os.path.join(model_dir, "model.ckpt")  
    reader = pywrap_tensorflow.NewCheckpointReader(checkpoint_path)  
    var_to_shape_map = reader.get_variable_to_shape_map()  
    for key in var_to_shape_map:  
        print("tensor_name: ", key)  
        print(reader.get_tensor(key))
    return var_to_shape_map
'''查看PB文件信息'''
def seeVariablePB(pbDir):
    with tf.Session() as sess:
        with open(pbDir, 'rb') as f:
            graph_def = tf.GraphDef()
            graph_def.ParseFromString(f.read()) 
            print (graph_def)
            return graph_def
        sess.close
        
def ckpt2pb2():
    with tf.Session() as sess:
        #初始化变量
        sess.run(tf.global_variables_initializer())
        #获取最新的checkpoint，其实就是解析了checkpoint文件
        latest_ckpt = tf.train.latest_checkpoint("model")
        #加载图
        restore_saver = tf.train.import_meta_graph('model/model.ckpt.meta')
        #恢复图，即将weights等参数加入图对应位置中
        restore_saver.restore(sess, latest_ckpt)
        #将图中的变量转为常量
        output_graph_def = tf.graph_util.convert_variables_to_constants(
            sess, sess.graph_def , ["Softmax"])
        #将新的图保存到"/pretrained/graph.pb"文件中
        tf.train.write_graph(output_graph_def, 'model', "newPb.pb", as_text=False)
#pb2pbtxt
def convert_pb_to_pbtxt(filename):  
    with gfile.FastGFile(filename,'rb') as f:  
        graph_def = tf.GraphDef()  
        graph_def.ParseFromString(f.read())  
        tf.import_graph_def(graph_def, name='')  
        tf.train.write_graph(graph_def, 'model', 'pbTxt.pbtxt', as_text=True)  