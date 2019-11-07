package com.virgo.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.virgo.service.ForecastService;

@Controller
@RequestMapping("failurePrediction")
public class FailurePredictionPageController {
	@Autowired
	private ForecastService forecastService;

	@RequestMapping(value = "failurePredictionShow", method = RequestMethod.GET)
	public String failurePredictionShow() {
		return "failurePrediction";
	}

	@RequestMapping(value = "failurePredictionResult", method = RequestMethod.GET)
	public String failurePredictionResult(String lable,
			HttpServletRequest request) {
		request.setAttribute("lable", lable);
		return "failurePredictionResult";
	}

	@RequestMapping(value = "saveFile", method = RequestMethod.POST)
	public void saveFile(MultipartFile soundFile, HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws IllegalStateException, IOException {
		int lable = -1;
		// 文件上传与保存
		if (soundFile.getSize() > 0) {
			// 得到项目在服务器的真实根路径
			String path = session.getServletContext().getRealPath("soundFile");
			// 得到文件的原始名称，如：xxx.wav
			String fileName = soundFile.getOriginalFilename();
			File file = new File(path, fileName);
			// 如果文件存在，则删除
			if (file.exists()) {
				file.delete();
			}
			// 保存音频文件
			soundFile.transferTo(file);
			// 调用Python WebService
			lable = forecastService
					.forecastSoundByPython(path + "/" + fileName);
			System.out.println(path + "/" + fileName + " 预测结果为：" + lable);
		}
		response.sendRedirect("failurePredictionResult?lable=" + lable);
	}
}
