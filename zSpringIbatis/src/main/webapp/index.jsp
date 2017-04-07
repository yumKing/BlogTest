<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客主页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap3/css/bootstrap.min.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap3/css/bootstrap-themes.min.css" >
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap3/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/blog.css" >


</head>
<body>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="blog"><strong>我的博客站</strong></div>
				</div>
				<div class="col-md-8">
					<iframe  style="float:right" width="420" height="80" scrolling="no" frameborder="0" allowtransparency="yes" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=5"></iframe>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar navbar-default">
						<div class="container-fluid">
							<div class="collapse navbar-collapse">
								<!-- 导航元素列表 -->
								<ul class="nav navbar-nav">
									<li class="active"><a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">博客首页</a></li>
									<li><a class="navbar-brand" href="${pageContext.request.contextPath }/foreground/blogger/bloggerInfo.jsp">关于博主</a></li>
									<li><a class="navbar-brand" href="${pageContext.request.contextPath }/foreground/blogger/myAlbum.jsp">我的相册</a></li>
									<li><a class="navbar-brand" href="${pageContext.request.contextPath }/foreground/blogger/source.jsp">资源小站</a></li>
									<li><a class="navbar-brand" href="http://blog.csdn.net/baidu_32412575">我的CSDN</a></li>
								</ul>
								
								<!-- 导航元素表单 -->
								<form class="navbar-form navbar-right" role="search">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="请输入要查询的关键字" />
									</div>
									
									<button type="submit" class="btn btn-default">查询</button>
								</form>
							</div>
						</div>
					</nav>
				</div>
			</div>
			
			<div class="row">
				<!-- 博客列表 -->
				<div class="col-md-9">
					<div class="blog_list">
						<div class="list_title">
							<span class="glyphicon glyphicon-th-list"> <strong>最新博客</strong></span>
							<hr style="border:none;border-top:1px dotted gray;margin-top:10px" />
						</div>
						
						<div class="blog_datas">
							<ul>
								<c:forEach items="${blogList }" var="blog" >
									<li>
										<!-- 博客标题 -->
										<div class="title">
											<span class="ico ico_type_Original"></span>
											<span class="title_name"><a href="#">${blog.title}</a></span>
										</div>
										
										<!-- 博客摘要 -->
										<div class="summary">${blog.summary }</div>
										
										<!-- 博客其他信息 -->
										<div class="info">
											<font color="#999">${blog.releaseDate }</font>
											<font color="#33a5ba"><a href="#">阅读</a>(${blog.clickHit })</font>
											<font color="#3a5ba"><a href="#">评论</a>(${blog.replyHit })</font>
										</div>
									</li>
									<hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" />
								</c:forEach>
								
								
								<!-- <li>
									博客标题
									<div class="title">
										<span class="ico ico_type_Original"></span>
										<span class="title_name"><a href="#">这是一个测试的博客</a></span>
									</div>
									
									博客摘要
									<div class="summary">这是博客摘要，测试环境没有，全部是手打的字</div>
									
									博客其他信息
									<div class="info">
										<font color="#999">20170101 12:00</font>
										<font color="#33a5ba"><a href="#">阅读</a>(2)</font>
										<font color="#3a5ba"><a href="#">评论</a>(0)</font>
									</div>
								</li>
								<hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" />
								
								<li>
									博客标题
									<div class="title">
										<span class="ico ico_type_Original"></span>
										<span class="title_name"><a href="#">这是一个测试的博客</a></span>
									</div>
									
									博客摘要
									<div class="summary">这是博客摘要，测试环境没有，全部是手打的字</div>
									
									博客其他信息
									<div class="info">
										<font color="#999">20170101 12:00</font>
										<font color="#33a5ba"><a href="#">阅读</a>(2)</font>
										<font color="#3a5ba"><a href="#">评论</a>(0)</font>
									</div>
								</li>
								<hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" />
								
								<li>
									博客标题
									<div class="title">
										<span class="ico ico_type_Original"></span>
										<span class="title_name"><a href="#">这是一个测试的博客</a></span>
									</div>
									
									博客摘要
									<div class="summary">这是博客摘要，测试环境没有，全部是手打的字</div>
									
									博客其他信息
									<div class="info">
										<font color="#999">20170101 12:00</font>
										<font color="#33a5ba"><a href="#">阅读</a>(2)</font>
										<font color="#3a5ba"><a href="#">评论</a>(0)</font>
									</div>
								</li>
								<hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" /> -->
							</ul>
							
						</div>
						
					</div>
				</div>
				
				<!-- 侧边栏 -->
				<div class="col-md-3">
						
					<!-- 博主信息 -->
					<div class="blog_list">
						<span class="glyphicon glyphicon-user"> <strong>博主信息</strong></span>
						<hr style="border:none;border-top:1px dotted gray;margin-top:10px" />
						
						<div style="text-align: center;">
							<div class="blogger_img">
								<img src="${pageContext.request.contextPath }/static/images/blogger_img.png" width="100px" height="120px" />
							</div>
							<div class="nick">
								<span style="color: red;">昵称：JIN</span>
							</div>
							<div class="motto">
								<span style="color: red;">座右铭：活到老，学到老</span>
							</div>
						</div>
						
					</div>
					
					<!-- 文章分类 -->
					<div class="blog_list">
						<span class="glyphicon glyphicon-book"> <strong>文章分类</strong></span>
						<hr style="border:none;border-top:1px dotted gray;margin-top:10px" />
						
						<div class="blog_type">
							<ul>
								<li>
									<span><a href="#">java核心基础</a>(0)</span>
								</li>
								<li>
									<span><a href="#">spring技术</a>(2)</span>
								</li>
								<li>
									<span><a href="#">数据库技术</a>(1)</span>
								</li>
								<li>
									<span><a href="#">linux</a>(0)</span>
								</li>
								<li>
									<span><a href="#">redis</a>(0)</span>
								</li>
								<li>
									<span><a href="#">hadoop</a>(0)</span>
								</li>
							</ul>
						</div>
					</div>
					
					<!-- 友情链接 -->
					<div class="blog_list">
						<span class="glyphicon glyphicon-paperclip"> <strong>友情链接</strong></span>
						<hr style="border:none;border-top:1px dotted gray;margin-top:10px" />
						
						<div class="blog_link">
							<span><a href="https://github.com/yumKing"><img src="${pageContext.request.contextPath }/static/images/github.jpg" width="55px" height="55px"></a></span>&nbsp;&nbsp;
							<span><a href="http://www.sina.com"><img src="${pageContext.request.contextPath }/static/images/sina.png" width="55px" height="55px"></a></span>
						</div>
					</div>
						
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-12">
					<div class="tail" align="center">
						<font>Copyright © 2017 个人博客系统 版权所有</font>
					</div>
				</div>
			</div>
			
		</div>
	</body>
</html>