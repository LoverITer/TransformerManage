var myChart = echarts.init(document.getElementById("areaUses"));
option = {
    title : {
        text: '区域用量统计',
        subtext: '上月数据'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['用量峰值','用量谷值']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data :['雁塔区','新城区','莲湖区','灞桥区','未央区','长安区']
        }
    ],
    yAxis : [
        {
            type : 'value',
            axisLabel : {
                formatter: '{value} KW/h'
            }
        }
    ],
    series : [
        {
            name:'用量峰值',
            type:'line',
            data:[112, 115, 125, 163, 102, 153],
            markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name: '平均值'}
                ]
            }
        },
        {
            name:'用量谷值',
            type:'line',
            data:[102,112, 100, 129, 90, 100],
            markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name : '平均值'}
                ]
            }
        }
    ]
};
myChart.setOption(option);        