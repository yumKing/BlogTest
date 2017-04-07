<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/themes/icon.css" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/themes/default/easyui.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	
	function deleteBlog(){
		
		//获得要删除的行
		var selectRows = $("#dg").datagrid("getSelections");
		if(selectRows == 0){
			$.messager.alert("提示","请选择要删除的数据");
			return ;
		}
		var rows_args = [];
		for(var i = 0; i < selectRows.length;i++){
			rows_args.push(selectRows[i].id);
		}
		var rows = rows_args.join(",");
		
		$.post(
				"${pageContext.request.contextPath}/admin/blog/delete.do",
				{
					rows:rows
				},
				function(result){
					if(result.success){
						$.messager.alert("提示","数据删除成功");
					}else{
						$.messager.alert("提示","数据删除失败");
					}
				},
				"json"
		);
		
	}
	
	function reload(){
		$("#dg").datagrid("reload");
	}
	
</script>

</head>

<body style="margin: 1px; font-family: microsoft yahei">

<!-- 博客基本框架 -->
	<table id="dg" title="博客管理" class="easyui-datagrid" fitColumn="true" pagination="true" toolbar="#toorbar" 
		url="${pageContext.request.contextPath }/admin/blog/list.do" >
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="title" width="200" align="center">博客标题</th>
				<th field="summary" width="200px" align="center">摘要</th>
				<th field="releaseDate" width="100px" align="center">发布日期</th>
				<th field="clickHit" width="50px" align="center">点击率</th>
				<th field="replyHit" width="50px" align="center">回复率</th>
				<th field="content" width="200px" align="center">文章</th>
				<th field="keywords" width="100px" align="center">关键字</th>
				<th field="blogType.typeName" width="100px" align="center">分类</th>
			</tr>
		</thead>
	</table>
	
	<!-- 工具栏 -->
	<!-- 增删改查系列操作按钮 -->
	<div id="toorbar">
		<div>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteBlog()">删除</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="modifyBlog()">修改</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
		</div>
	</div>
	
</body>
</html>