package ${xml["packages"]["service"]};

import ${xml["packages"]["model"]}.${pdmT.code?cap_first};
import ${xml["packages"]["dao"]}.${pdmT.code?cap_first}Dao;

import ${xml["packages"]["coreService"]}.BaseService;

public interface ${pdmT.code?cap_first}Service extends BaseService<${pdmT.code?cap_first}, ${pdmT.code?cap_first}Dao>{
}