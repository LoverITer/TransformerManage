var myChart = echarts.init(document.getElementById("faultCounts"));
option = {
	title: {
		text: '故障次数统计分析图',
		subtext: '上月数据',
		sublink: ''
	},
	tooltip: {
		trigger: 'axis',
		axisPointer: { // 坐标轴指示器，坐标轴触发有效
			type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
		},
		formatter: function(params) {
			return params[0].name + '<br/>' +
				params[0].seriesName + ' : ' + params[0].value + '<br/>' +
				params[1].seriesName + ' : ' + (params[1].value + params[0].value);
		}
	},
	legend: {
		selectedMode: false,
		data: ['实际故障频次', '预估故障频次']
	},
	toolbox: {
		show: true,
		feature: {
			mark: { show: true },
			dataView: { show: true, readOnly: false },
			restore: { show: true },
			saveAsImage: { show: true }
		}
	},
	calculable: true,
	xAxis: [{
		type: 'category',
		data: ['雁塔区', '新城区', '莲湖区', '灞桥区', '未央区', '长安区']
	}],
	yAxis: [{
		type: 'value',
		boundaryGap: [0, 0.1]
	}],
	series: [{
			name: '实际故障频次',
			type: 'bar',
			stack: 'sum',
			barCategoryGap: '50%',
			itemStyle: {
				normal: {
					color: 'tomato',
					barBorderColor: 'tomato',
					barBorderWidth: 6,
					barBorderRadius: 0,
					label: {
						show: true,
						position: 'insideTop'
					}
				}
			},
			data: [260, 200, 220, 120, 100, 80]
		},
		{
			name: '预估故障频次',
			type: 'bar',
			stack: 'sum',
			itemStyle: {
				normal: {
					color: '#fff',
					barBorderColor: 'tomato',
					barBorderWidth: 6,
					barBorderRadius: 0,
					label: {
						show: true,
						position: 'top',
						formatter: function(params) {
							for(var i = 0, l = option.xAxis[0].data.length; i < l; i++) {
								if(option.xAxis[0].data[i] == params.name) {
									return option.series[0].data[i] + params.value;
								}
							}
						},
						textStyle: {
							color: 'tomato'
						}
					}
				}
			},
			data: [40, 80, 50, 80, 80, 70]
		}
	]
};
myChart.setOption(option);