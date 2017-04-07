package com.blog.utils;

import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class DateJsonValueProcessor implements JsonValueProcessor{

	private String format;
	
	public DateJsonValueProcessor(String format){
		this.format = format;
	}

	@Override
	public Object processArrayValue(Object value, JsonConfig jcg) {
		return null;
	}

	@Override
	public Object processObjectValue(String key, Object value, JsonConfig jcg) {
		if(value == null)
			return null;
		
		if(value instanceof Timestamp){
			String str = new SimpleDateFormat(format).format((Timestamp)value);
			return str;
		}
		
		if(value instanceof Date){
			String str = new SimpleDateFormat(format).format((Date)value);
		}
		
		return value.toString();
	}
}
