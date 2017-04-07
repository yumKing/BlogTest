package com.blog.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * MD5加密工具类
 * @author jinyang
 *
 */
public class CryptographyUtil {
	
	public static String md5(String str,String salt){
		return new Md5Hash(str,salt).toString();
	}
	
	public static void main(String[] args) {
		System.out.println(CryptographyUtil.md5("12345", "java"));
	}

}
