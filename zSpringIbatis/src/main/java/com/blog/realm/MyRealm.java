package com.blog.realm;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.blog.entity.Blogger;
import com.blog.service.BloggerService;

/**
 * 自定义realm
 * @author jinyang
 *
 */
public class MyRealm extends AuthorizingRealm{

	@Resource
	private BloggerService bloggerService;
	
	/* 
	 * 为当前登陆的用户授予角色和权限
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		// TODO 这个个人博客项目是不需要进行角色和权限认证的，因为就一个用户
		return null;
	}

	/* 
	 * 对当前登陆的用户进行身份认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		
		String username = (String)token.getPrincipal();//获取用户名
		
		Blogger blogger = bloggerService.getByUsername(username);
		
		if(blogger != null){
			SecurityUtils.getSubject().getSession().setAttribute("currentUser", blogger);//吧当前用户存入session
			AuthenticationInfo info = new SimpleAuthenticationInfo(blogger.getUserName(),blogger.getPassword(),"MyRealm");
			return info;
		}
		else{
			return null;
		}
		
	}

}
