<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/themes/icon.css" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/themes/default/easyui.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/static/ueditor1.4.3.3/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/ueditor1.4.3.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/ueditor1.4.3.3/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
	<script id="editor" name="content" type="text/javascript" style="width:100%;heigth:800px"></script>
	
	<div>
		<button onclick="getContent()">获得内容</button>
		<button onclick="setContent()">写入内容</button>
		<button onclick="setContent(true)">追加内容</button>
		<button onclick="getContentTxt()">获得纯文本</button>
		<button onclick="getPlainTxt()">获得带有格式的纯文本</button>
	</div>
	
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor("editor");
		
		function getContent(){
			var arr = [];
			arr.push("使用editor.getContent()可以获得编辑器的内容");
			arr.push("内容为：");
			arr.push(UE.getEditor("editor").getContent());
			alert(arr.join("\n"));
		}
		
		function setContent(isAppendTxt){
			var arr = [];
			arr.push("使用editor.setContent()可以设置编辑器的内容");
			UE.getEditor("editor").setContent("设置编辑器的内容",isAppendTxt);
			alert(arr.join("\n"));
		}
		
		function getContentTxt(){
			var arr = [];
			arr.push("使用editor.getContentTxt()可以获得纯本文");
			arr.push("编辑器的纯文本内容是：");
			arr.push(UE.getEditor("editor").getContentTxt());
			alert(arr.join("\n"));
			
		}
		
		function getPlainTxt(){
			var arr = [];
			arr.push("editor.getPlainTxt()可获得格式化的纯文本");
			arr.push("编辑器的内容：");
			arr.push(UE.getEditor("editor").getPlainTxt());
			alert(arr.join("\n"));
		}
	</script>
</body>
</html>