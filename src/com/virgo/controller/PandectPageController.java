package com.virgo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("pandect")
public class PandectPageController {
	@RequestMapping(value="pandectShow",method=RequestMethod.GET)
	public String pandectShow() {
		return "pandect";
	}
}
