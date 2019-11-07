package com.virgo.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用类，定义故障的类别属性
 * 
 * @author ChenWen
 * 
 */
/*
 * 0 = air_conditioner 
 * 1 = car_horn 
 * 2 = children_playing 
 * 3 = dog_bark 
 * 4 = drilling 
 * 5 = engine_idling 
 * 6 = gun_shot 
 * 7 = jackhammer 
 * 8 = siren 
 * 9 = street_music
 */
public class FaultCategory {
	public static Map<String, String> faultCategoryMap = null;
	static {
		faultCategoryMap = new HashMap<String, String>();
		faultCategoryMap.put("0", "air_conditioner");
		faultCategoryMap.put("1", "car_horn");
		faultCategoryMap.put("2", "children_playing");
		faultCategoryMap.put("3", "dog_bark");
		faultCategoryMap.put("4", "drilling");
		faultCategoryMap.put("5", "engine_idling");
		faultCategoryMap.put("6", "gun_shot");
		faultCategoryMap.put("7", "jackhammer");
		faultCategoryMap.put("8", "siren");
		faultCategoryMap.put("9", "street_music");
		
	}
}
