package ${xml["packages"]["serviceImpl"]};

import javax.servlet.http.HttpServletRequest;

import ${xml["packages"]["coreModel"]}.CommonStatus;
import ${xml["packages"]["coreException"]}.typeConvert.DateTypeConvertException;
import ${xml["packages"]["coreException"]}.typeConvert.IntegerTypeConvertException;
import ${xml["packages"]["coreException"]}.typeConvert.TypeConvertException;
import ${xml["packages"]["daoImpl"]}.LoginDaoImpl;
import ${xml["packages"]["modelTypeConvert"]}.LoginTypeConvert;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

public class ${pdmT.code?cap_first}ServiceImpl {
	public static CommonStatus add(HttpServletRequest request) throws DateTypeConvertException, IntegerTypeConvertException, TypeConvertException {
		DBObject ${pdmT.code?uncap_first} = new BasicDBObject();
		LoginTypeConvert.convert(${pdmT.code?uncap_first}, request);
		return LoginDaoImpl.getInstance().insert(${pdmT.code?uncap_first});
	}
	
	public static CommonStatus update(HttpServletRequest request) throws DateTypeConvertException, IntegerTypeConvertException, TypeConvertException {
		DBObject ${pdmT.code?uncap_first} = new BasicDBObject();
		LoginTypeConvert.convert(${pdmT.code?uncap_first}, request);
		return LoginDaoImpl.getInstance().update(${pdmT.code?uncap_first});
	}
	
	public static CommonStatus delete(HttpServletRequest request) throws DateTypeConvertException, IntegerTypeConvertException, TypeConvertException {
		DBObject ${pdmT.code?uncap_first} = new BasicDBObject();
		LoginTypeConvert.convert(${pdmT.code?uncap_first}, request);
		return LoginDaoImpl.getInstance().delete(${pdmT.code?uncap_first});
	}
}