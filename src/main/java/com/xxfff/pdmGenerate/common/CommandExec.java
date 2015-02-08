package com.xxfff.pdmGenerate.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;

import com.xxfff.ddutils.ProjectProperty;
import com.xxfff.pdmGenerate.config.ParseConfig;
import com.xxfff.pdmGenerate.entity.GenerateEntity;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class CommandExec implements Command {
	private Configuration cfg;
	private GenerateEntity generateEntity;

	public CommandExec(String TEMPLATE_PATH, String TEMPLATE) {
		super();

		cfg = new Configuration();
		File file = new File(TEMPLATE_PATH + File.separator + TEMPLATE
				+ File.separator);
		if (file.exists() && file.isDirectory() && file.listFiles().length > 0) {
			try {
				// 加载freemarker模板
				cfg.setDirectoryForTemplateLoading(new File(TEMPLATE_PATH
						+ File.separator + TEMPLATE + File.separator));
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			cfg.setClassForTemplateLoading(this.getClass(),
					TEMPLATE_PATH + "/" + TEMPLATE + "/");
		}
	}

	public Configuration getConfiguration() {
		return cfg;
	}

	/**
	 * 根据模板生成文件
	 */
	public void buildTemplate() {
		String realFileName = generateEntity.getRealSavePath()
				+ generateEntity.getFileName();
		if(new File(realFileName).exists()){
			return;
		}

		File newsDir = new File(generateEntity.getRealSavePath());
		if (!newsDir.exists()) {
			newsDir.mkdirs();
		}
		try {
			Writer out = new OutputStreamWriter(new FileOutputStream(
					realFileName), "UTF-8");
			Template template = getConfiguration().getTemplate(
					generateEntity.getTemplateFile());
			template.process(generateEntity.getParams(), out);
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int exec(GenerateEntity generateEntity) {
		this.generateEntity = generateEntity;
		buildTemplate();
		return 0;
	}
}
