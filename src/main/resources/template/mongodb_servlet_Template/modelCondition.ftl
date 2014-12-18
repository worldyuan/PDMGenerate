package ${xml["packages"]["modelCondition"]};

<#list pdmT.columns as f>
	<#if f.type == "Date">
import java.util.Date;
<#break>	
	</#if> 
</#list>
import java.util.Map;

import ${xml["packages"]["model"]}.${pdmT.code ? cap_first};

public class ${pdmT.code ? cap_first}Condition extends ${pdmT.code ? cap_first}{
	
<#list pdmT.columns as f>
	<#if f.type == "Date" || f.type == "Integer">
	private ${f.type} ge${f.code? cap_first};
	private ${f.type} lt${f.code? cap_first};
	<#elseif f.type == "String">
	private ${f.type} andLike${f.code? cap_first};
	private ${f.type} startLike${f.code? cap_first};
	</#if>
</#list>
<#list pdmT.columns as f>
	<#if f.type == "Date" || f.type == "Integer">
	public void setGe${f.code? cap_first}(${f.type} ge${f.code? cap_first}) {
		this.ge${f.code? cap_first} = ge${f.code? cap_first};
	}
	
	public ${f.type? cap_first} getGe${f.code? cap_first}() {
		return ge${f.code? cap_first};
	}
	
	public void setLt${f.code? cap_first}(${f.type} lt${f.code? cap_first}) {
		this.lt${f.code? cap_first} = lt${f.code? cap_first};
	}
	
	public ${f.type? cap_first} getLt${f.code? cap_first}() {
		return lt${f.code? cap_first};
	}
	<#elseif f.type == "String">
	
	public void setAndLike${f.code? cap_first}(${f.type} andLike${f.code? cap_first}) {
		this.andLike${f.code? cap_first} = andLike${f.code? cap_first};
	}
	
	public ${f.type? cap_first} getAndLike${f.code? cap_first}() {
		return andLike${f.code? cap_first};
	}
	
	public void setStartLike${f.code? cap_first}(${f.type} startLike${f.code? cap_first}) {
		this.startLike${f.code? cap_first} = startLike${f.code? cap_first};
	}
	
	public ${f.type? cap_first} getStartLike${f.code? cap_first}() {
		return startLike${f.code? cap_first};
	}
	</#if>
</#list>

	@Override
	public Map<String, Object> toHashMap() {
		Map<String, Object> params = super.toHashMap();
<#list pdmT.columns as f>
	<#if f.type == "Date" || f.type == "Integer">
		if(getGe${f.code? cap_first}() != null){
			params.put("ge${f.code? cap_first}", getGe${f.code? cap_first}());
		}
		if(getLt${f.code? cap_first}() != null){
			params.put("lt${f.code? cap_first}", getLt${f.code? cap_first}());
		}
	<#elseif f.type == "String">
		if(getAndLike${f.code? cap_first}() != null){
			params.put("andLike${f.code? cap_first}", getAndLike${f.code? cap_first}());
		}
		if(getStartLike${f.code? cap_first}() != null){
			params.put("startLike${f.code? cap_first}", getStartLike${f.code? cap_first}());
		}
	</#if>
</#list>
		return params;
	}
}