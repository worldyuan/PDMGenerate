package ${xml["packages"]["model"]};

<#list pdmT.columns as f>
	<#if f.type == "Date">
import java.util.Date;
<#break>
	</#if> 
</#list>
import java.util.Map;

import ${xml["packages"]["coreModel"]}.BaseEntity;

public class ${pdmT.code} extends BaseEntity{
<#list pdmT.columns as f>
	private ${f.type} ${f.code};
</#list>
<#list pdmT.columns as f>

	public void set${f.code ? cap_first}(${f.type} ${f.code}) {
		this.${f.code} = ${f.code};
	}
	
	public ${f.type} get${f.code ? cap_first}() {
		return this.${f.code};
	}
</#list>

	@Override
	public Map<String, Object> toHashMap() {
		Map<String, Object> params = super.toHashMap();
		
		<#list pdmT.columns as f>
		if(get${f.code ? cap_first}() != null){
			params.put("${f.code}", get${f.code ? cap_first}());
		}
		</#list>
		
		return params;
	}
}