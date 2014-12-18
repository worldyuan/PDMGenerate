package ${xml["packages"]["vomodel"]};

import ${xml["packages"]["model"]};

public class ${className}{
<#list pdmT.columns as f>
	<#if f.type == "Date">
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		<#break>
	</#if>
</#list>
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