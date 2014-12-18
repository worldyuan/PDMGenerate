package com.xxfff.pdmGenerate.common;

import java.util.ArrayList;
import java.util.List;

import com.xxfff.pdmGenerate.entity.GenerateEntity;

public class Invoker {
	private Command command = null;

	private List<GenerateEntity> generateEntitys = null;
	
	public Invoker(Command command) {
		super();
		this.command = command;
	}
	
	/**
	 * @return 执行成功的个数
	 */
	public int exec(){
		if(null == command || null == generateEntitys)
			return 0;
		int success = 0;
		for(GenerateEntity ge : generateEntitys) {
			if(0 ==command.exec(ge)){
				++success;
			}
		}
		return success;
	}
	
	public void add(GenerateEntity generateEntity){
		if(null == generateEntitys){
			generateEntitys = new ArrayList<GenerateEntity>();
		}
		generateEntitys.add(generateEntity);
	}
	
	public void clear(){
		generateEntitys.clear();
	}
}
