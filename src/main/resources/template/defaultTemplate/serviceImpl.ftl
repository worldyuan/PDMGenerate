package ${xml["packages"]["serviceImpl"]};

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import ${xml["packages"]["service"]}.${pdmT.code?cap_first}Service;
import ${xml["packages"]["dao"]}.${pdmT.code?cap_first}Dao;
import ${xml["packages"]["model"]}.${pdmT.code?cap_first};

import ${xml["packages"]["coreServiceImpl"]}.BaseServiceImpl;

@Service
public class ${pdmT.code?cap_first}ServiceImpl extends BaseServiceImpl<${pdmT.code?cap_first}, ${pdmT.code?cap_first}Dao> implements ${pdmT.code?cap_first}Service{
	@Resource
	private ${pdmT.code?cap_first}Dao daoImpl;
	
	@Override
	public ${pdmT.code?cap_first}Dao getDaoImpl() {
		return daoImpl;
	}

	@Override
	public void setDaoImpl(${pdmT.code?cap_first}Dao daoImpl) {
		this.daoImpl = daoImpl;
	}
}