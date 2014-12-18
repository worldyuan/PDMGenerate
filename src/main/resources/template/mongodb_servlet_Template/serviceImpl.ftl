package ${xml["packages"]["serviceImpl"]};

import javax.servlet.http.HttpServletRequest;

import ${xml["packages"]["coreModel"]}.CommonStatus;
import ${xml["packages"]["coreException"]}.DaoException;
import ${xml["packages"]["coreException"]}.typeConvert.DateTypeConvertException;
import ${xml["packages"]["coreException"]}.typeConvert.IntegerTypeConvertException;
import ${xml["packages"]["coreException"]}.typeConvert.TypeConvertException;
import ${xml["packages"]["db"]}.${pdm.code}DB;
import ${xml["packages"]["modelTypeConvert"]}.${pdmT.code?cap_first}TypeConvert;
import ${xml["packages"]["coreDao"]}.BaseDaoUtils;

public class ${pdmT.code?cap_first}ServiceImpl {
	private static String tableName = "${pdmT.code?cap_first}";
	
	public static CommonStatus fetch(HttpServletRequest request) throws DateTypeConvertException, IntegerTypeConvertException, TypeConvertException {
		return BaseDaoUtils.fetch(${pdm.code}DB.getInstance().getDB(), tableName, request.getParameter("id"));
	}
	
	public static CommonStatus add(HttpServletRequest request) throws DateTypeConvertException, IntegerTypeConvertException, TypeConvertException, DaoException {
		DBObject ${pdmT.code?uncap_first} = new BasicDBObject();
		${pdmT.code?cap_first}TypeConvert.convert(${pdmT.code?uncap_first}, request);
		return BaseDaoUtils.insert(${pdm.code}DB.getInstance().getDB(), tableName, ${pdmT.code?uncap_first});
	}
	
	public static CommonStatus update(HttpServletRequest request) throws DateTypeConvertException, IntegerTypeConvertException, TypeConvertException, DaoException {
		DBObject ${pdmT.code?uncap_first} = new BasicDBObject();
		${pdmT.code?cap_first}TypeConvert.convert(${pdmT.code?uncap_first}, request);
		return BaseDaoUtils.update(TestDB.getInstance().getDB(), tableName, ${pdmT.code?uncap_first});
	}
	
	public static CommonStatus delete(HttpServletRequest request) throws DateTypeConvertException, IntegerTypeConvertException, TypeConvertException, DaoException {
		DBObject ${pdmT.code?uncap_first} = new BasicDBObject();
		${pdmT.code?cap_first}TypeConvert.convert(${pdmT.code?uncap_first}, request);
		return BaseDaoUtils.delete(TestDB.getInstance().getDB(), tableName, ${pdmT.code?uncap_first});
	}
}