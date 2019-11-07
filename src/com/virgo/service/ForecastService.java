package com.virgo.service;


public interface ForecastService {
	/**
	 * 通过执行python web service获取预测分类
	 */
	public int forecastSoundByPython(String fileName);
}
