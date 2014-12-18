package ${xml["packages"]["daoImpl"]};

import ${xml["packages"]["dao"]}.${pdmT.code?cap_first}Dao;
import ${xml["packages"]["model"]}.${pdmT.code?cap_first};
import org.springframework.stereotype.Repository;

import ${xml["packages"]["coreDaoImpl"]}.BaseDaoImpl;

@Repository
public class ${pdmT.code?cap_first}DaoImpl extends BaseDaoImpl<${pdmT.code?cap_first}> implements ${pdmT.code?cap_first}Dao{
}