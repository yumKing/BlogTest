<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/themes/icon.css" />
<script src="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script src="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js" ></script>

<script type="text/javascript">
	
	var url = "";

	function openBlogTypeDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加博客类别");
		url="${pageContext.request.contextPath }/admin/blogType/save.do";//添加默认保存博客类别的控制器
	}
	
	function saveBlogType(){
		$("#fm").form(
			"submit",//类别
			{
				url:url,
				onSubmit:function(){
					return $(this).form("validate");//基本验证
				},
				success:function(result){
					var result = eval("(" + result + ")")//json转js对象
					if(result.success){
						$.messager.alert("提示","博客类别保存成功");
						closeBlogTypeDialog();
						reload();
						
					}else{
						$.messager.alert("提示","博客类别保存失败");
						return ;
					}
					
				}
				
			}//参数列表，1:url;2:提交前验证;3:返回成功结果
			
		);
	}
	
	function clearDialog(){
		$("#typeName").val("");
		$("#orderNum").val("");
		$("#blogCount").val("");
	}
	
	function closeBlogTypeDialog(){
		clearDialog();
		$("#dlg").dialog("close");
	}
	
	function deleteBlogType(){
		//获取表中要删除的行
		var selectRows = $("#dg").datagrid("getSelections");
		if(selectRows == 0){
			$.messager.alert("提示","请选中要删除的数据");
			return ;
		}
		var rows_args = [];
		for(var i = 0;i<selectRows.length;i++){
			rows_args.push(selectRows[i].id);
		}
		var rows = rows_args.join(",");//以逗号分隔后的字符串
		
		//提交
		$.messager.confirm("提示","<font color=red>你确定要删除选中的"+rows_args.length+"条数据？</font>",function(r){
			if(r){
				$.post(
					"${pageContext.request.contextPath}/admin/blogType/delete.do",//url
					{ids:rows},//参数列表
					function(result){//返回结果
						if(result.exist){
							$.messager.alert("提示",result.exist);
						}else if(result.success){
							$.messager.alert("提示","数据删除成功")
						}else{
							$.messager.alert("提示","数据删除失败");
						}
					},
					"json" //json格式
				);
			}
		});
		
		
		
	}
	
	function modifyBlogType(){
		//获取要修改的行
		var selectRows = $("#dg").datagrid("getSelections");
		if(selectRows.length != 1){
			$.messager.alert("提示","请选择一个要修改的数据");
			return ;
		}	
		var row = selectRows[0];
		
		$("#dlg").dialog("open").dialog("setTitle","修改博客类别信息");
		
		$("#fm").form("load",row);//提交,会自动识别name属性，将row中对应的数据，填充到form表单对应的name属性中
		url = "${pageContext.request.contextPath}/admin/blogType/save.do?id="+row.id;
		
	}
	
	function reload(){
		$("#dg").datagrid("reload");
	}
	
	
</script>

</head>
<body  style="margin: 1px; font-family: microsoft yahei">

	<!-- 博客分类基本框架 -->
	<table id="dg" title="博客类别管理" class="easyui-datagrid" url="${pageContext.request.contextPath }/admin/blogType/list.do" fitColumns="true" pagination="true"  toolbar="#toorbar">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="20" align="center	">编号</th>
				<th field="typeName" width="20" align="center">博客分类名称</th>
				<th field="orderNum" width="20" align="center">类别排序</th>
				<th field="blogCount" width="20" align="center">博客数量</th>
			</tr>			
		</thead>
	</table>
	
	<!-- 增删改查系列操作按钮 -->
	<div id="toorbar">
		<div>
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openBlogTypeDialog()">添加</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteBlogType()">删除</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="modifyBlogType()">修改</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
		</div>
	</div>
	
	<!-- 添加博客类别信息 （隐式）-->
	<div id="dlg" class="easyui-dialog" style="width:500px;height:180px;padding:10px 20px" closed="true" buttons="#dlg-button">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>博客类别名称</td>
					<td>
						<input type="text" id="typeName" name="typeName" class="easyui-validatebox" required="true" >
					</td>
				</tr>
				<tr>
					<td>博客类别排序</td>
					<td>
						<input type="text" id="orderNum" name="orderNum" class="easyui-numberbox" required="true" >(博客类别会根据序号从小到大排序)
					</td>
				</tr>
				<tr>
					<td>博客数量</td>
					<td>
						<input type="text" id="blogCount" name="blogCount" class="easyui-numberbox" required="false" value="0" >
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 提交博客类别信息到服务器 -->
	<div id="dlg-button">
		<a href="javascript:saveBlogType()" class="easyui-linkbutton" iconCls="icon-ok" plain="true">保存</a>
		<a href="javascript:closeBlogTypeDialog()" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">关闭</a>
	</div>
	
</body>
</html>