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
	/** ${f.name} */
	private ${f.type} ${f.code};
	<#if f.type == "String">
	private ${f.type} andLike${f.code ? cap_first};
	private ${f.type} startLike${f.code ? cap_first};
	</#if>
</#list>
<#list pdmT.columns as f>

	public void set${f.code ? cap_first}(${f.type} ${f.code}) {
		this.${f.code} = ${f.code};
	}
	
	public ${f.type} get${f.code ? cap_first}() {
		return this.${f.code};
	}
	<#if f.type == "String">
	
	public void setAndLike${f.code ? cap_first}(${f.type} andLike${f.code? cap_first}) {
		this.andLike${f.code? cap_first} = andLike${f.code? cap_first};
	}
	
	public ${f.type} getAndLike${f.code ? cap_first}() {
		return this.andLike${f.code? cap_first};
	}
	
	public void setStartLike${f.code ? cap_first}(${f.type} startLike${f.code? cap_first}) {
		this.startLike${f.code? cap_first} = startLike${f.code? cap_first};
	}
	
	public ${f.type} getStartLike${f.code ? cap_first}() {
		return this.startLike${f.code? cap_first};
	}
	</#if>
</#list>

	@Override
	public Map<String, Object> toHashMap() {
		Map<String, Object> params = super.toHashMap();
		
		<#list pdmT.columns as f>
		if(get${f.code ? cap_first}() != null){
			params.put("${f.code}", get${f.code ? cap_first}());
		}
		<#if f.type == "String">
		if(getAndLike${f.code ? cap_first}() != null){
			params.put("andLike${f.code}", getAndLike${f.code ? cap_first}());
		}
		if(getStartLike${f.code ? cap_first}() != null){
			params.put("startLike${f.code}", getStartLike${f.code ? cap_first}());
		}
		</#if>
		</#list>
		
		return params;
	}
}