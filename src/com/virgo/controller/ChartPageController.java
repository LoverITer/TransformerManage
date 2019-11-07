package com.virgo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("chart")
public class ChartPageController {
	@RequestMapping(value="chartShow",method=RequestMethod.GET)
	public String chartShow() {
		return "chart";
	}
}
