var myChart = echarts.init(document.getElementById("proportion"));
option = {
    /*title : {
        text: '',
        subtext: '',
        x:'center'
    },*/
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient : 'vertical',
        x : 'left',
        data:['用量峰时','用量谷时','正常用量']
    },
   /* toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true, 
                type: ['pie', 'funnel'],
                option: {
                    funnel: {
                        x: '25%',
                        width: '50%',
                        funnelAlign: 'left',
                        max: 1548
                    }
                }
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },*/
    calculable : true,
    series : [
        {
            name:'来源',
            type:'pie',
            radius : '35%',
            center: ['50%', '30%'],
            data:[
                {value:33, name:'用量峰时'},
                {value:10, name:'用量谷时'},
                {value:132, name:'正常用量'},
            ]
        }
    ]
};
myChart.setOption(option);