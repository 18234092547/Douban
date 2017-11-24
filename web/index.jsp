<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <script src="echarts.min.js"></script>
    <script src="jquery-1.8.3.min.js"></script>
</head>
<body onload="loadData()">

<div id="content" style="margin:40px auto;">
    <div id="myBarDiv" style="height:300px;width:1550px;display:inline-block"></div>
    <div id="myPieDiv" style="height:300px;width:1550px;display:inline-block"></div>
</div>

<script type="text/javascript">
    function loadData(option){

        $.ajax({
            type:"post",   //请求方式
            async:false,            //采用同步传输
            url:'DoubanServlet',   //从刚才的servlet中把数据读取出来
            data:{},
            dataType:'json',

            success:function(result){
                if(result){
                    option.xAxis[0].data=[];
                    for(var i=0;i<result.length;i++){
                        option.xAxis[0].data.push(result[i].country);  //设置横坐标的数据
                    }

                    //初始化series[0]的data
                    option.series[0].data=[];
                    for(var i=0;i<result.length;i++){
                        option.series[0].data.push(result[i].nums);   //设置纵坐标的数据
                    }
                }
            },
            error:function(errorMsg){
                alert("数据加载失败");
            }



        });
    }
    //初始化Echarts
    var myChart=echarts.init(document.getElementById('myBarDiv'));
    var option={
        title:{
            text:'柱状图'
        },
        tooltip:{
            show:true
        },
        legend:{
            data:['数量']
        },
        xAxis:[{

            type:'category',
            axisTick:{
                alignWithLabel: true,//竖线对准文字
                interval:0,   //横坐标的竖线的间隔
            },
            axisLabel:{
                interval:0
            } //横坐标显示全部信息
        }],
        yAxis:[{
            type:'value'
        }],
        series:[{
            name:'数量',
            type:'bar',

        }]

    };
    loadData(option);  //加载数据到option
    myChart.setOption(option);  //设置option（画图）
</script>

<script type="text/javascript">
    var myChart=echarts.init(document.getElementById('myPieDiv'));

    function loadData(option){
        $.ajax({
            type:"post",
            async:false,
            url:'DoubanServlet',
            data:{},
            dataType:'json',
            success:function(result){
                if(result){
                    var country=[];
                    var number=[];

                    for(var i=0;i<result.length;i++){
                        country[i]=result[i].country;
                        var obj =new Object();
                        obj.name=result[i].country;
                        obj.value=result[i].nums;
                        number[i]=obj;

                    }
                    var option={
                        title:{
                            text:'饼状图',
                            x:'center'
                        },
                        tooltip:{
                            show:true,
                            trigger:'item'
                        },
                        legend:{
                            data:country,
                            left:'left',
                            orient:'vertical'
                        },
                        series:[{
                            name:'数量',
                            type:'pie',
                            radius:'60%',
                            data:number

                        }]

                    };
                    option.legend.data=country;
                    myChart.setOption(option,true);
                    myChart.setSeries(seriesdata);
                }
            },
            error:function(errorMsg){
                alert("数据加载失败");
            }


        });
    }
</script>
</body>
</html>