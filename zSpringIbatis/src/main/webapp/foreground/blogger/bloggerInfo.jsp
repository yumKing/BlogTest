<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博主信息</title>
</head>
<body>
	<div class="data_list">
		<div class="data_list_title">
			<img alt="" src="${pageContext.request.contextPath}/static/images/tou.png" />&nbsp;关于博主 
		</div>
		
		<div class="datas">
			<ul>	
				<li>
					${blogger.profile }
				</li>
				<hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" />																												
			</ul>
		</div>
	</div>

</body>
</html>