package com.xxfff.pdmGenerate.pdmtest;

import java.util.HashMap;
import java.util.Map;

import com.xxfff.pdmGenerate.common.CommandExec;
import com.xxfff.pdmGenerate.common.Invoker;
import com.xxfff.pdmGenerate.config.Config;
import com.xxfff.pdmGenerate.entity.GenerateEntity;
import com.xxfff.utils.PDM.PDM;
import com.xxfff.utils.PDM.PDMReference;
import com.xxfff.utils.PDM.PDMTable;
import com.xxfff.utils.PDM.Parser;

public class Test {
	private static String tableName = null;
	
	public static void doPDMTable(Invoker invoker, PDMTable pdmT,Map<String, Object> oldParams) {
		/*生成实体*/
		Map<String, Object> params = new HashMap<String, Object>();
		params.putAll(oldParams);
		params.put("pdmT", pdmT);
		GenerateEntity generateEntity = new GenerateEntity(Config.MODEL_TEMPLATEFILE_PATH, params, Config.MODEL_PATH, pdmT.getCode()+".java");
		invoker.add(generateEntity);
		
		/*生成实体数组*/
		params = new HashMap<String, Object>();
		params.putAll(oldParams);
		params.put("pdmT", pdmT);
		generateEntity = new GenerateEntity(Config.MODELARRAY_TEMPLATEFILE_PATH, params, Config.MODELARRAY_PATH, pdmT.getCode()+"Array.java");
		invoker.add(generateEntity);
		
		/*生成查询条件实体*/
		if (null != Config.MODELCONDITION_PATH){
			params = new HashMap<String, Object>();
			params.putAll(oldParams);
			params.put("pdmT", pdmT);
			generateEntity = new GenerateEntity(Config.MODELCONDITION_TEMPLATEFILE_PATH, params, Config.MODELCONDITION_PATH, pdmT.getCode()+"Condition.java");
			invoker.add(generateEntity);
		}
		
		/*生成实体类型转换*/
		if (null != Config.MODELTYPECONVERT_PATH){
			params = new HashMap<String, Object>();
			params.putAll(oldParams);
			params.put("pdmT", pdmT);
			generateEntity = new GenerateEntity(Config.MODELTYPECONVERT_TEMPLATEFILE_PATH, params, Config.MODELTYPECONVERT_PATH, pdmT.getCode()+"TypeConvert.java");
			invoker.add(generateEntity);
		}
		
		/*生成dao*/
		if(null != Config.DAO_PATH){
			params = new HashMap<String, Object>();
			params.putAll(oldParams);
			params.put("pdmT", pdmT);
			generateEntity = new GenerateEntity(Config.DAO_TEMPLATEFILE_PATH, params, Config.DAO_PATH, pdmT.getCode()+"Dao.java");
			invoker.add(generateEntity);
		}
		
		/*生成daoImpl*/
		params = new HashMap<String, Object>();
		params.putAll(oldParams);
		params.put("pdmT", pdmT);
		generateEntity = new GenerateEntity(Config.DAOIMPL_TEMPLATEFILE_PATH, params, Config.DAOIMPL_PATH, pdmT.getCode()+"DaoImpl.java");
		invoker.add(generateEntity);
		
		/*生成service*/
		if(null != Config.SERVICE_PATH){
			params = new HashMap<String, Object>();
			params.putAll(oldParams);
			params.put("pdmT", pdmT);
			generateEntity = new GenerateEntity(Config.SERVICE_TEMPLATEFILE_PATH, params, Config.SERVICE_PATH, pdmT.getCode()+"Service.java");
			invoker.add(generateEntity);
		}
		
		/*生成serviceImpl*/
		params = new HashMap<String, Object>();
		params.putAll(oldParams);
		params.put("pdmT", pdmT);
		generateEntity = new GenerateEntity(Config.SERVICEIMPL_TEMPLATEFILE_PATH, params, Config.SERVICEIMPL_PATH, pdmT.getCode()+"ServiceImpl.java");
		invoker.add(generateEntity);
		
		/*生成controller*/
		params = new HashMap<String, Object>();
		params.putAll(oldParams);
		params.put("pdmT", pdmT);
		generateEntity = new GenerateEntity(Config.CONTROLLER_TEMPLATEFILE_PATH, params, Config.CONTROLLER_PATH, pdmT.getCode()+"Controller.java");
		invoker.add(generateEntity);
		
		/*生成servlet*/
		if(null != Config.SERVLET_PATH){
			params = new HashMap<String, Object>();
			params.putAll(oldParams);
			params.put("pdmT", pdmT);
			generateEntity = new GenerateEntity(Config.SERVLET_TEMPLATEFILE_PATH, params, Config.SERVLET_PATH, pdmT.getCode()+"Servlet.java");
			invoker.add(generateEntity);
		}
		
		/*生成mapper*/
		if(null != Config.MAPPER_PATH){
			params = new HashMap<String, Object>();
			params.putAll(oldParams);
			params.put("pdmT", pdmT);
			generateEntity = new GenerateEntity(Config.MAPPER_TEMPLATEFILE_PATH, params, Config.MAPPER_PATH, pdmT.getCode()+"Mapper.xml");
			invoker.add(generateEntity);
		}
		
		String code = com.xxfff.core.util.StringUtils.toFirstLowerCase(pdmT.getCode());
		
		/*生成js*/
		if(null != Config.JS_PATH){
			params = new HashMap<String, Object>();
			params.putAll(oldParams);
			params.put("pdmT", pdmT);
			generateEntity = new GenerateEntity(Config.JS_TEMPLATEFILE_PATH, params, Config.JS_PATH, code+".js");
			invoker.add(generateEntity);
		}
		
		//生成jsp页面
		if(null != Config.MANAGE_JSP_PATH){
			//增加
			params = new HashMap<String, Object>();
			params.putAll(oldParams);
			params.put("pdmT", pdmT);
			generateEntity = new GenerateEntity(Config.JSP_ADD_TEMPLATEFILE_PATH, params, Config.MANAGE_JSP_PATH + "/" +code + "/","add.jsp");
			invoker.add(generateEntity);
			
			//修改
			params = new HashMap<String, Object>();
			params.putAll(oldParams);
			params.put("pdmT", pdmT);
			generateEntity = new GenerateEntity(Config.JSP_EDIT_TEMPLATEFILE_PATH, params, Config.MANAGE_JSP_PATH + "/" +code + "/","edit.jsp");
			invoker.add(generateEntity);
			
			//管理
			params = new HashMap<String, Object>();
			params.putAll(oldParams);
			params.put("pdmT", pdmT);
			generateEntity = new GenerateEntity(Config.JSP_MANAGER_TEMPLATEFILE_PATH, params, Config.MANAGE_JSP_PATH + "/" +code + "/","manage.jsp");
			invoker.add(generateEntity);
			
			//管理子界面
			params = new HashMap<String, Object>();
			params.putAll(oldParams);
			params.put("pdmT", pdmT);
			generateEntity = new GenerateEntity(Config.JSP_QUERY_TEMPLATEFILE_PATH, params, Config.MANAGE_JSP_PATH + "/" +code + "/","query.jsp");
			invoker.add(generateEntity);
		}
	}
	
	public void doPDMReference(Invoker invoker, PDMReference pdmR,Map<String, Object> oldParams){
		/*生成实体关系*/
		Map<String, Object> params = new HashMap<String, Object>();
		params.putAll(oldParams);
		params.put("pdmR", pdmR);
		String className = pdmR.getParentTable().getName() + pdmR.getChildTable().getName() + "VO";
		params.put("className", className);
		GenerateEntity generateEntity = new GenerateEntity(Config.MODEL_TEMPLATEFILE_PATH, params, Config.MODEL_PATH, className+".java");
		invoker.add(generateEntity);
	}
	
	public static void main(String [] args){
		try {
			String pdmfile = "/pdm/pdmtest.pdm";
			if(args.length > 0){
				pdmfile = args[0];
			}
			PDM pdm = new Parser().pdmParser(pdmfile);
			Invoker invoker = new Invoker(new CommandExec(Config.TEMPLATE_PATH, Config.TEMPLATE));
			GenerateEntity generateEntity = null;
			Map<String, Object> oldParams = new HashMap<String, Object>();
			oldParams.put("xml", Config.xmlSettings);
			oldParams.put("pdm", pdm);
			Map<String, Object> params = new HashMap<String, Object>();
			params.putAll(oldParams);
			
			/*生成DB*/
			if(Config.DB_PATH != null){
				generateEntity = new GenerateEntity(Config.DB_TEMPLATEFILE_PATH, params, Config.DB_PATH, pdm.getCode()+"DB.java");
				invoker.add(generateEntity);
			}
			
			/*处理表之间的关系*/
			for(PDMReference pdmR:pdm.getReferences()){
				String r = pdmR.getCardinality();
				String comment = pdmR.getComment();
				if("1..1".equals(pdmR.getCardinality())){
					/*if("inner".equals(comment)) {
						//不要生成父表和子表的关联字段
						for(PDMReferenceJoin join: pdmR.getJoins()) {
							join.getParentTable_Col().setGenerate(false);
							join.getChildTable_Col().setGenerate(false);
						}
						//不要生成子表
						pdmR.getChildTable().setGenerate(false);
						//添加子表的字段到父表
						pdmR.getParentTable().addColumns(pdmR.getChildTable().getColumns());
					}*/
				}
				
			}
			
			/*根据表生成所有源码*/
			for(PDMTable pdmT:pdm.getTables()) {
				doPDMTable(invoker, pdmT, oldParams);
			}
			/*生成所有关联的表*/
			for(PDMReference pdmR:pdm.getReferences()){
				if("1..1".equals(pdmR.getCardinality())) {
					pdmR.getParentTable().addOneToOne(pdmR.getChildTable());
				} else if("1..n".equals(pdmR.getCardinality())) {
					pdmR.getParentTable().addOneToMany(pdmR.getChildTable());
				}
			}
			invoker.exec();
			invoker.clear();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
