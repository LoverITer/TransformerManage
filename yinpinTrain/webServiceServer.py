# -*- coding: utf-8 -*-
"""
Created on Tue May 15 22:39:48 2018
Python Web service 服务实现
@author: ChenWen
"""
from spyne import Application, rpc, ServiceBase,String,Integer
from spyne.protocol.soap import Soap11
from spyne.server.wsgi import WsgiApplication

import forecastFJava as forecastMethord

class ForeCastSound(ServiceBase):
    @rpc(String,_returns=Integer)
    def forecast(self,filePath):
        print("文件路径：",filePath)
        lable = forecastMethord.main(filePath)
        print("预测值：",lable)
        return  lable
application = Application([ForeCastSound], 'com.virgo.tensorflow',
                          in_protocol=Soap11(validator='lxml'),
                          out_protocol=Soap11())
wsgi_application = WsgiApplication(application)
from wsgiref.simple_server import make_server
server = make_server('127.0.0.1',10001, wsgi_application)
server.serve_forever()