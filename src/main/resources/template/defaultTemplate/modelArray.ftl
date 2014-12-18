package ${xml["packages"]["modelArray"]};

import java.util.List;

import ${xml["packages"]["model"]}.${pdmT.code ? cap_first};

public class ${pdmT.code ? cap_first}Array {
	private List<${pdmT.code ? cap_first}> ${pdmT.code ? uncap_first}Array;

	public List<${pdmT.code ? cap_first}> get${pdmT.code ? cap_first}Array() {
		return this.${pdmT.code ? uncap_first}Array;
	}

	public void set${pdmT.code ? cap_first}Array(List<${pdmT.code ? cap_first}> ${pdmT.code ? uncap_first}Array) {
		this.${pdmT.code ? uncap_first}Array = ${pdmT.code ? uncap_first}Array;
	}
}