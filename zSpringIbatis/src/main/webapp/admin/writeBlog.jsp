<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
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

<body style="margin: 10px; font-family: microsoft yahei">

	<div class="easyui-panel" title="编写博客" style="padding:10px;">
		<table  cellspacing="20px">
			<tr>
				<td width="80px">博客标题:</td>
				<td>
					<input type="text" id="title" class="" name="title" style="width:400px"/>
				</td>
			</tr>
			<tr>
				<td>所属类别:</td>
				<td>
					<select id="blogType" name="blogType.id" class="easyui-combobox" style="width:154px" editable="false" panelHeight="auto">
						<option>请选择博客类别...</option>
						<c:forEach  items="${blogTypeList }" var="blogType">
							<option value="${blogType.id }">${blogType.typeName }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td valign="top">博客内容:</td>
				<td><script id="editor" name="content" type="text/plain" style="width:80%;height:500px;"></script></script></td>
			</tr>
			<tr>
				<td>关键字:</td>
				<td>
					<input type="text" id="keywords" style="width:400px"  name="keywords" />&nbsp;&nbsp;多个关键字请用逗号隔开
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'" style="width:90px;">发布博客</a>
				</td>
			</tr>
		</table>
	</div>
	
	
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor("editor");
	</script>
	<script type="text/javascript">
		function submitData(){
			/* 博客标题 */
			var title = $("#title").val();
			/* 博客类型id */
			var blogTypeId = $("#blogType").combobox("getValue");
			/* 博客内容 */
			var content = UE.getEditor("editor").getContent();
			
			/* 博客纯文本 */
			var contentNoTag = UE.getEditor("editor").getContentTxt();
			
			/* 摘要 */
			var summary = contentNoTag.substr(0,155);
			
			/* 关键字 */
			var keywords = $("#keywords").val();
			
			/* 前端基本验证 */
			if( title == null || title == ""){
				$.messager.alert("提示","请输入博客标题");
			}else if(blogTypeId == null || blogTypeId == ""){
				$.messager.alert("提示","请输入博客类型");
			}else if(content == null || content == ""){
				$.messager.alert("提示","请输入博客内容");
			}else{
				/* 基本验证没问题，post提交 */
				$.post(
					"${pageContext.request.contextPath}/admin/blog/save.do",
					{
						"title":title,
						"blogType.id":blogTypeId,
						"content":content,
						"summary":summary,
						"keywords":keywords,
						"contentNoTag":contentNoTag
					},
					function(result){
						if(result.success){
							$.messager.alert("提示","博客发布成功");
							clearValues();
						}
						else{
							$.messager.alert("提示","博客发布失败");
						}
					},
					"json"
				);
			}
			
		}
		
		function clearValues(){
			$("#title").val("");
			$("#blogTypeId").combobox("setValue", "");
			UE.getEditor("editor").setContent("");
			$("#keywords").val("");
		}
	</script>
	
</body>
</html>