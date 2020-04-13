<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>selectChar</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Access-Control-Allow-Origin" content="*" />
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
	<div class="demoTable" >
		请输入要查找的文字：
		<div class="layui-inline">
			<input class="layui-input" name="word" id="demoReload" value=""
				autocomplete="off">
		</div>
		<button id="do_search" class="layui-btn" data-type="reload">搜索</button>
	</div>
	<table class="layui-hide" id="test" lay-filter="test"></table>

	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
  </div>
</script>
<!--转换时间格式-->
<!-- 
<script type="text/javascript">
Date.prototype.dateToStr = function () {
	var time = new Date(this);
	var y = time.getFullYear();
	var M = time.getMonth() + 1;
	M = M < 10 ? ("0" + M) : M;
	var d = time.getDate();
	d = d < 10 ? ("0" + d) : d;
	var h = time.getHours();
	h = h < 10 ? ("0" + h) : h;
	var m = time.getMinutes();
	m = m < 10 ? ("0" + m) : m;
	var s = time.getSeconds();
	s = s < 10 ? ("0" + s) : s;
	var str = y + "-" + M + "-" + d + " " + h + ":" + m + ":" + s;
	return str;
	};
</script> -->

	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  		<%--
  		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
 		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
 		--%>
	</script>


	<script src="layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<%-- <%
	JSONArray json = (JSONArray)request.getAttribute("jsArray");
%> --%>
	<script>
	var userId = <%=request.getAttribute("userId")%>;
	layui.use('table', function(){
  	
	var table = layui.table;
  
	table.render({
    elem: '#test'
    ,id: 'testReload'
    ,height: 600
    ,url:'http://localhost:8080/ssmAndDl4j/searchByUserIdAndWord'
    //,data: arr
   	,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据，res为从url中get到的数据
         var result;
         console.log(this);
         console.log(JSON.stringify(res));
         if(this.page.curr){
             result = res.data.slice(this.limit*(this.page.curr-1),this.limit*this.page.curr);
         }
         else{
             result=res.data.slice(0,this.limit);
         }
         return {
             "code": res.code, //解析接口状态
             "msg": res.msg, //解析提示文本
             "count": res.count, //解析数据长度
             "data": result //解析数据列表
         };
     }
    ,page: true
    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
      title: '提示'
      ,layEvent: 'LAYTABLE_TIPS'
      ,icon: 'layui-icon-tips'
    }]
    ,title: '搜索文字'
    ,even: true //开启隔行背景
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'photoWordRecord', title:'photo_word_record',width:180, fixed: 'left', sort: true}
      ,{field:'photoRecord', title:'photo_record',width:160, sort: true}
      ,{field:'dateTime', title:'date_time',width:160,templet:'<div>{{ layui.util.toDateString(d.dateTime, "yyyy-MM-dd") }}</div>'}
      ,{field:'recordUrl', title:'record_url',width:340}
      ,{field:'wordUrl', title:'word_url',width:150,templet:
	  '<div><img src="http://localhost:8080/FTZ/{{userId}}/{{d.wordUrl}}" width="30px" height="30px"/></div>'}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:165}
    ]]
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'getCheckData':
        var data = checkStatus.data;
        layer.alert(JSON.stringify(data));
      break;
      case 'getCheckLength':
        var data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
      break;
      case 'isAll':
        layer.msg(checkStatus.isAll ? '全选': '未全选');
      break;
      
      //自定义头工具栏右侧图标 - 提示
      case 'LAYTABLE_TIPS':
        layer.alert('这是工具栏右侧自定义的一个图标按钮');
      break;
    };
  });
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    //console.log(obj)
    if(obj.event === 'detail'){
    	//var that = this; 
		  //多窗口模式，层叠置顶
		  layer.open({
			type: 2 //此处以iframe举例
			,title: '图片识别详情'
			,area: ['1215px', '700px']
			,shade: 0
			,maxmin: true
			,offset: 'auto' 
			,content: 'http://localhost:8080/ssmAndDl4j/recognizeDetail2?photoSrc=http://localhost:8080/FTZ/'+data.recordUrl
			,btn: ['全部关闭'] //只是为了演示
			,yes: function(){
				layer.closeAll();
			}
			
			
			,zIndex: layer.zIndex //重点1
			,success: function(layero){
			  layer.setTop(layero); //重点2
			}
		  });
    } 
    /* if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.prompt({
        formType: 2
        ,value: data.email
      }, function(value, index){
        obj.update({
          email: value
        });
        layer.close(index);
      });
    } */
  });
  
<%--   <%
  	Long userId = (Long)request.getAttribute("userId");
  %> --%>
  
  var $ = layui.$, active = {
    reload: function(){
      var demoReload = $('#demoReload');
      //执行重载
      table.reload('testReload', {
        page: {
          curr: 1 //重新从第 1 页开始
        }
        ,where: {
        	'word': demoReload.val(),
        	'userId': userId
        }
      },'data');
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});
</script>

</body>
</html>