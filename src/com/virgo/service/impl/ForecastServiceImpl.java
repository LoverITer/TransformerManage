package com.virgo.service.impl;


import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import org.springframework.stereotype.Service;

import com.virgo.service.ForecastService;
@Service
public class ForecastServiceImpl implements ForecastService {
	public int forecastSoundByPython(String fileName) {
		String webServicePath = "http://localhost:10002/?wsdl";
		String webServiceMethord = "forecast";
		int lable = -1;
		JaxWsDynamicClientFactory clientFactory = JaxWsDynamicClientFactory
				.newInstance();
		Client client = clientFactory.createClient(webServicePath);

		try {
			Object[] result = client.invoke(webServiceMethord, fileName);
			lable = Integer.parseInt(result[0].toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lable;
	}
}
