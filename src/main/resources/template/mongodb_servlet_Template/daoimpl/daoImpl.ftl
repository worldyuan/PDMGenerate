package ${xml["packages"]["daoImpl"]};

import com.mongodb.DB;
import ${xml["packages"]["coreDao"]}.BaseDao;
import ${xml["packages"]["coreDao"]}.BaseDaoImpl;

public class ${pdmT.code?cap_first}DaoImpl extends BaseDaoImpl implements BaseDao{
	private ${pdmT.code?cap_first}DaoImpl(){};
	
	public static ${pdmT.code?cap_first}DaoImpl getInstance() {  
        return MyAppHolder.INSTANCE;  
    }

    private static class MyAppHolder {  
        private static final ${pdmT.code?cap_first}DaoImpl INSTANCE = new ${pdmT.code?cap_first}DaoImpl();  
    }
	@Override
	public DB getDB() {
		return TestDB.getInstance().getDB();
	}
	
	public String getTABLE() {
		return "${pdmT.code?uncap_first}";
	}
}