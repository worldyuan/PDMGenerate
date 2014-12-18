package ${xml["packages"]["dao"]};

import ${xml["packages"]["coreDao"]}.BaseDao;
import ${xml["packages"]["model"]}.${pdmT.code?cap_first};

public interface ${pdmT.code?cap_first}Dao extends BaseDao<${pdmT.code?cap_first}>{
}