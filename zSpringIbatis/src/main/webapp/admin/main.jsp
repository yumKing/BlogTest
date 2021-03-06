<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人博客后台主页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/themes/default/easyui.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<style type="text/css">
	body {
		font-family: microsoft yahei;
	}
</style>

<script type="text/javascript">
	function openTab(text,url,iconCls){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);
		}
		else{
			//$.messager.alert("提示",url);
			var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/admin/"+url+"'></iframe>";
			$("#tabs").tabs(
				"add",
				{
					title:text,
					iconCls:iconCls,
					closable:true,
					content:content
				}
			);
		}
	}
	
	function openPasswordModifyDialog(){
		$("#dlg").dialog("open").dialog("setTitle","修改密码");
	}
	
	function closePasswordModifyDialog(){
		$("#password").val("");
		$("#password2").val("");
		$("#dlg").dialog("close");
	}
	
	function modifyPassword(){
		$("#fm").form("submit",{
			url:"${pageContext.request.contextPath}/admin/blogger/modifyPassword.do",
			//进行验证，才允许提交
			onSubmit:function(){
				var newPassword = $("#password").val();
				var newPassword2 = $("#password").val();
				if(!$(this).form("validate")){
					return false;
				}
				if(newPassword != newPassword2){
					$.messager.alert("系统提示","两次密码必须一致");
					return false;
				}
				return true;
			},
			success:function(result){
				var result = eval("("+result+")");//将json格式的result转换成js对象
				if(result.success){
					$.messager.alert("系统提示","密码修改成功，下一次登录有效");
					closePasswordModifyDialog();
				}
				else{
					$.messager.alert("系统提示","密码修改失败");
					return ;
				}
				
			}
		});
	}
	
	function refreshSystemCache(){
		/* post请求 */
		$.post(
			"${pageContext.request.contextPath}/admin/system/refreshSystemCache.do",
			{},
			function(result){
				if(result.success){
					$.messager.alert("系统提示","已成功刷新缓存");
				}
				else{
					$.messager.alert("系统提示","刷新系统缓存失败");
				}
				
			},
			"json"
		);
	}
	
	function logout(){
		$.messager.confirm("系统提示","您确定要退出系统？",function(ry){
			if(ry){
				window.location.href = "${pageContext.request.contextPath}/admin/system/logout.do";
			}
		});
	}
	
</script>

</head>

<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:90px;background:#E0ECFF;padding:10px" >
		<table style="padding: 5px" width="100%">
			<tr>
				<td width="50%"><h2>博客后台系统</h2></td>
				<td valign="bottom" align="right" width="50%">
					<font size="3">&nbsp;&nbsp;<strong>欢迎：</strong>${currentUser.userName} </font>
				</td>
			</tr>
		</table>
	</div>
	
	<div data-options="region:'center'" >
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" data-options="iconCls:'icon-home'">
				<div align="center" style="padding-top: 100px"><font color="red" size="10">欢迎使用</font></div>
			</div>
		</div>
	</div>
	
	<div data-options="region:'west',split:true,title:'导航菜单'" style="width:210px;padding:10px;" >
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<div title="常用操作" data-options="selected:true,iconCls:'icon-item'" style="padding: 10px">
				<a href="javascript:openTab('写博客','writeBlog.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px">写博客</a>
				<a href="javascript:openTab('评论审核','commentReview.jsp','icon-review')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 150px">评论审核</a>
			</div>
			<div title="博客管理"  data-options="iconCls:'icon-bkgl'" style="padding:10px;">
				<a href="javascript:openTab('写博客','writeBlog.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">写博客</a>
				<a href="javascript:openTab('博客信息管理','blogManage.jsp','icon-bkgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bkgl'" style="width: 150px;">博客信息管理</a>
			</div>
			<div title="博客类别管理" data-options="iconCls:'icon-bklb'" style="padding:10px">
				<a href="javascript:openTab('博客类别信息管理','blogTypeManage.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">博客类别信息管理</a>
			</div>
			<div title="评论管理"  data-options="iconCls:'icon-plgl'" style="padding:10px">
				<a href="javascript:openTab('评论审核','commentReview.jsp','icon-review')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 150px">评论审核</a>
				<a href="javascript:openTab('评论信息管理','commentManage.jsp','icon-plgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-plgl'" style="width: 150px;">评论信息管理</a>
			</div>
			<div title="个人信息管理"  data-options="iconCls:'icon-grxx'" style="padding:10px">
				<a href="javascript:openTab('修改个人信息','modifyInfo.jsp','icon-grxxxg')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-grxxxg'" style="width: 150px;">修改个人信息</a>
			</div>
			<div title="系统管理"  data-options="iconCls:'icon-system'" style="padding:10px">
			    <a href="javascript:openTab('友情链接管理','linkManage.jsp','icon-link')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-link'" style="width: 150px">友情链接管理</a>
				<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
				<a href="javascript:refreshSystemCache()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" style="width: 150px;">刷新系统缓存</a>
				<a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
			</div>
		</div>
	</div>
	
	<div data-options="region:'south',border:false" style="height:50px;background:#E0ECFF;padding:10px;" >
		<div align="center">Copyright © 2017 博客系统 版权所有JIN</div>
	</div>
	
	<!-- 修改密码 -->
	<div id="dlg" class="easyui-dialog" style="width:400px; height:200px; padding:10px 20px" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table >
				<tr>
					<td>用户名</td>
					<td>
						<input type="text" id="username" class="" name="username" value="${currentUser.userName }" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>新密码</td>
					<td>
						<input type="password" id="password" class="easyui-validatebox" name="password" required="required"/>
					</td>
				</tr>
				<tr>
					<td>确认密码</td>
					<td>
						<input type="password" id="password2" class="easyui-validatebox" name="password2" required="required"/>
					</td>
				</tr>
			</table>		
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:modifyPassword()" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true">保存</a>
		<a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">取消</a>
	</div>
</body>
</html>