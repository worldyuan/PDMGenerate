package ${xml["packages"]["modelTypeConvert"]};

<#list pdmT.columns as f>
	<#if f.type == "Date">
import java.text.ParseException;
import java.text.SimpleDateFormat;
<#break>
	</#if> 
</#list>

import javax.servlet.http.HttpServletRequest;

import ${xml["packages"]["coreException"]}.typeConvert.TypeConvertConstant;
import ${xml["packages"]["coreException"]}.typeConvert.TypeConvertException;
import ${xml["packages"]["coreModel"]}.BaseEntityTypeConvert;
import ${xml["packages"]["model"]}.${pdmT.code};
import com.mongodb.DBObject;

public class MyDB {
<#list pdmT.columns as f>
	<#if f.type == "Date">
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	<#break>
	</#if>
</#list>

	/**
	 *数据类型转换
	 */
	public static void convert(${pdmT.code ? cap_first} ${pdmT.code ? uncap_first},HttpServletRequest request) throws TypeConvertException{
		BaseEntityTypeConvert.convert(${pdmT.code ? uncap_first}, request);
		String s = null;
<#list pdmT.columns as f>
		
		s = request.getParameter("${f.code?uncap_first}");
		if(null != s){
		<#if f.type == "Date">
			try {
				${pdmT.code ? uncap_first}.set${f.code?cap_first}(sdf.parse(s));
			} catch (ParseException e1) {
				throw new TypeConvertException(e1,TypeConvertConstant.DATE, TypeConvertConstant.STR_DATE);
			}
		<#elseif f.type == "Integer">
			${pdmT.code ? uncap_first}.set${f.code?cap_first}(Integer.valueOf(s));
		<#elseif f.type == "Long">
			${pdmT.code ? uncap_first}.set${f.code?cap_first}(Long.valueOf(s));
		<#else>
			${pdmT.code ? uncap_first}.set${f.code?cap_first}(s);
		</#if>
		}
	</#list>
	}
	
	/**
	 *数据类型转换
	 */
	public static void convert(DBObject ${pdmT.code ? uncap_first},HttpServletRequest request) throws TypeConvertException{
		BaseEntityTypeConvert.convert(${pdmT.code ? uncap_first}, request);
		String s = null;
<#list pdmT.columns as f>
		
		s = request.getParameter("${f.code?uncap_first}");
		if(null != s){
		<#if f.type == "Date">
			try {
				${pdmT.code ? uncap_first}.put("${f.code?uncap_first}", sdf.parse(s));
			} catch (ParseException e1) {
				throw new TypeConvertException(e1,TypeConvertConstant.DATE, TypeConvertConstant.STR_DATE);
			}
		<#elseif f.type == "Integer">
			${pdmT.code ? uncap_first}.put("${f.code?uncap_first}",Integer.valueOf(s));
		<#elseif f.type == "Long">
			${pdmT.code ? uncap_first}.put("${f.code?uncap_first}",Long.valueOf(s));
		<#else>
			${pdmT.code ? uncap_first}.put("${f.code?uncap_first}",s);
		</#if>
		}
	</#list>
	}
}