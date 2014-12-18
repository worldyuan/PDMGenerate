package com.xxfff.pdmGenerate.entity;

import java.util.Map;

public class GenerateEntity {
	private String templateFile;
	private Map<String, Object> params;
	private String realSavePath;
	private String fileName;
	public GenerateEntity(String templateFile, Map<String, Object> params,
			String realSavePath, String fileName) {
		super();
		this.templateFile = templateFile;
		this.params = params;
		this.realSavePath = realSavePath;
		this.fileName = fileName;
	}
	public String getTemplateFile() {
		return templateFile;
	}
	public void setTemplateFile(String templateFile) {
		this.templateFile = templateFile;
	}
	public Map<String, Object> getParams() {
		return params;
	}
	public void setParams(Map<String, Object> params) {
		this.params = params;
	}
	public String getRealSavePath() {
		return realSavePath;
	}
	public void setRealSavePath(String realSavePath) {
		this.realSavePath = realSavePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
