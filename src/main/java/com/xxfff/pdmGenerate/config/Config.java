/*******************************************************
 * @author LIZHITAO
 * @date 2013-8-22 下午04:06:20
 * @name Config.java
 * @JDK version 1.6
 * @version 0
 ******************************************************/
package com.xxfff.pdmGenerate.config;

import java.util.Map;

import com.xxfff.ddutils.ProjectProperty;
import com.xxfff.pdmGenerate.pdmtest.Test;

/**
 * @author YuanPeng	
 * @action 代码生成配置类
 */
public interface Config {
	String GENERATOR = "generator.xml";
	Map<String, Map<String, String>> xmlSettings = ParseConfig.getConfig(GENERATOR);
	
	String NODE_PACKAGES = "packages";
	String NODE_PATHS = "paths";
	
	String TEMPLATE_PATH = "/template/";
	String DEFAULT_MODEL_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("model");
	String DEFAULT_VOMODEL_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("vomodel");
	String DEFAULT_MODELCONDITION_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("modelCondition");
	String DEFAULT_VOMODELCONDITION_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("vomodelCondition");
	String DEFAULT_MODELTYPECONVERT_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("modelTypeConvert");
	String DEFAULT_VOMODELTYPECONVERT_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("vomodelTypeConvert");
	String DEFAULT_MODELARRAY_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("modelArray");
	String DEFAULT_DAO_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("dao");
	String DEFAULT_DAOIMPL_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("daoImpl");
	String DEFAULT_DB_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("db");
	String DEFAULT_SERVICE_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("service");
	String DEFAULT_VOSERVICE_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("voservice");
	String DEFAULT_SERVICEIMPL_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("serviceImpl");
	String DEFAULT_VOSERVICEIMPL_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("voserviceImpl");
	String DEFAULT_CONTROLLER_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("controller");
	String DEFAULT_VOCONTROLLER_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("vocontroller");
	String DEFAULT_SERVLET_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("servlet");
	String DEFAULT_VOSERVLET_PACKAGE = xmlSettings.get(NODE_PACKAGES).get("voservlet");
	String DAO_PATH = ProjectProperty.SRC_PATH + "/" + DEFAULT_DAO_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String DAOIMPL_PATH = ProjectProperty.SRC_PATH + "/" + DEFAULT_DAOIMPL_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String DB_PATH = DEFAULT_DB_PACKAGE==null ? null : ProjectProperty.SRC_PATH + "/" + DEFAULT_DB_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String SERVICE_PATH = ProjectProperty.SRC_PATH + "/" + DEFAULT_SERVICE_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String VOSERVICE_PATH = DEFAULT_VOSERVICE_PACKAGE == null ? null : ProjectProperty.SRC_PATH + "/" + DEFAULT_VOSERVICE_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String SERVICEIMPL_PATH = ProjectProperty.SRC_PATH + "/" + DEFAULT_SERVICEIMPL_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String VOSERVICEIMPL_PATH = DEFAULT_VOSERVICEIMPL_PACKAGE == null ? null :ProjectProperty.SRC_PATH + "/" + DEFAULT_VOSERVICEIMPL_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String CONTROLLER_PATH = ProjectProperty.SRC_PATH + "/" + DEFAULT_CONTROLLER_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String VOCONTROLLER_PATH = DEFAULT_VOCONTROLLER_PACKAGE == null ? null : ProjectProperty.SRC_PATH + "/" + DEFAULT_VOCONTROLLER_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String SERVLET_PATH = DEFAULT_SERVLET_PACKAGE == null ? null :ProjectProperty.SRC_PATH + "/" + DEFAULT_SERVLET_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String VOSERVLET_PATH = DEFAULT_VOSERVLET_PACKAGE == null ? null :ProjectProperty.SRC_PATH + "/" + DEFAULT_VOSERVLET_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String MODEL_PATH = ProjectProperty.SRC_PATH + "/" + DEFAULT_MODEL_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String VOMODEL_PATH = DEFAULT_VOMODEL_PACKAGE == null ? null :ProjectProperty.SRC_PATH + "/" + DEFAULT_VOMODEL_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String MODELCONDITION_PATH = DEFAULT_MODELCONDITION_PACKAGE == null ? null : ProjectProperty.SRC_PATH + "/" + DEFAULT_MODELCONDITION_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String MODELTYPECONVERT_PATH =DEFAULT_MODELTYPECONVERT_PACKAGE == null ? null: ProjectProperty.SRC_PATH + "/" + DEFAULT_MODELTYPECONVERT_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String VOMODELTYPECONVERT_PATH = DEFAULT_VOMODELTYPECONVERT_PACKAGE == null ? null: ProjectProperty.SRC_PATH + "/" + DEFAULT_VOMODELTYPECONVERT_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String MODELARRAY_PATH = ProjectProperty.SRC_PATH + "/" + DEFAULT_MODELARRAY_PACKAGE.replaceAll("\\.", "\\/") + "/";
	String JS_PATH = ProjectProperty.PROJECT_PATH + "/" + ParseConfig.getConfig().get("jsPath");
	String MANAGE_JSP_PATH = ProjectProperty.PROJECT_PATH + "/" + ParseConfig.getConfig().get("manageJspPath");
	String PORTAL_JSP_PATH = ProjectProperty.PROJECT_PATH + "/" + ParseConfig.getConfig().get("portalJspPath");
	String MAPPER_PATH = ProjectProperty.RESOURCES_PATH + "/" + ParseConfig.getConfig().get("mapperPath");
	String TEMPLATE = xmlSettings.get("template").get("template");
	
	String MODEL_TEMPLATEFILE_PATH = "model.ftl";
	String VOMODEL_TEMPLATEFILE_PATH = "vomodel.ftl";
	String MODELCONDITION_TEMPLATEFILE_PATH = "modelCondition.ftl";
	String VOMODELCONDITION_TEMPLATEFILE_PATH = "vomodelCondition.ftl";
	String MODELTYPECONVERT_TEMPLATEFILE_PATH = "modelTypeConvert.ftl";
	String VOMODELTYPECONVERT_TEMPLATEFILE_PATH = "vomodelTypeConvert.ftl";
	String MODELARRAY_TEMPLATEFILE_PATH = "modelArray.ftl";
	String DAO_TEMPLATEFILE_PATH = "dao.ftl";
	String DAOIMPL_TEMPLATEFILE_PATH = "daoImpl.ftl";
	String MAPPER_TEMPLATEFILE_PATH = "mapper.ftl";
	String JS_TEMPLATEFILE_PATH = "js.ftl";
	String JSP_ADD_TEMPLATEFILE_PATH = "jsp_add.ftl";
	String JSP_EDIT_TEMPLATEFILE_PATH = "jsp_edit.ftl";
	String JSP_MANAGER_TEMPLATEFILE_PATH = "jsp_manager.ftl";
	String JSP_QUERY_TEMPLATEFILE_PATH = "jsp_query.ftl";
	String DB_TEMPLATEFILE_PATH = "db.ftl";
	String SERVICE_TEMPLATEFILE_PATH = "service.ftl";
	String VOSERVICE_TEMPLATEFILE_PATH = "voservice.ftl";
	String SERVICEIMPL_TEMPLATEFILE_PATH = "serviceImpl.ftl";
	String VOSERVICEIMPL_TEMPLATEFILE_PATH = "voserviceImpl.ftl";
	String CONTROLLER_TEMPLATEFILE_PATH = "controller.ftl";
	String VOCONTROLLER_TEMPLATEFILE_PATH = "vocontroller.ftl";
	String SERVLET_TEMPLATEFILE_PATH = "servlet.ftl";
	String VOSERVLET_TEMPLATEFILE_PATH = "voservlet.ftl";
}
