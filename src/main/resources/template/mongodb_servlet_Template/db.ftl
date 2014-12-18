package ${xml["packages"]["db"]};

import java.net.UnknownHostException;

import com.mongodb.DB;
import com.mongodb.MongoClient;

public class ${pdm.code}DB {
      
    private TestDB() {
    	try {
			client = new MongoClient("localhost", 27017);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
    }
      
    public static TestDB getInstance() {  
        return MyAppHolder.INSTANCE;
    }
      
    private static class MyAppHolder {
        private static final TestDB INSTANCE = new TestDB();
    }

    String dbName = "${pdm.code}";
    MongoClient client;
    public DB getDB() {
        return client.getDB(dbName);
    }
}