/*******************************************************
 * @author LIZHITAO
 * @date 2013-9-9 上午8:28:01
 * @name ParseConfig.java
 * @JDK version 1.6
 * @version 0
 ******************************************************/
package com.xxfff.pdmGenerate.config;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.xxfff.ddutils.ProjectProperty;

/**
 * @author LIZHITAO
 * 
 */
public class ParseConfig {

	/**
	 * 读取generator的xml配置文件
	 * 
	 * @name readConfigXml
	 * @active
	 * @state
	 * @type void
	 * @time 上午8:51:58
	 * @exception/throws
	 * @see
	 * @since
	 * @return Map
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, String> getConfig() {
		String xml = "/" + "generator.xml";
		Document doc = null;
		try {
			SAXReader saxReader = new SAXReader();
			InputStream is=ParseConfig.class.getResourceAsStream(xml);
			doc = saxReader.read(is);
			Element root = doc.getRootElement();// 查找根节点
			Map<String, String> config = new HashMap<String, String>();

			Iterator<Element> it = root.elementIterator();
			while (it.hasNext()) {
				Element ee = it.next();
				if (ee.getName().equals("template")) {
					config.put(ee.getName(), ee.getText());// 模版配置
				}
				Iterator<Element> it2 = ee.elementIterator();
				while (it2.hasNext()) {
					Element e = it2.next();
					config.put(e.attribute("name").getValue(), e.getText());
				}
			}
			return config;
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 读取generator的xml配置文件
	 * 
	 * @name readConfigXml
	 * @active
	 * @state
	 * @type void
	 * @time 上午8:51:58
	 * @exception/throws
	 * @see
	 * @since
	 * @return Map
	 */
	@SuppressWarnings("unchecked")
	public static Map<String,Map<String, String>> getConfig(String xmlfile) {
		String xml = "/" + xmlfile;
		Document doc = null;
		Map<String,Map<String, String>> ret = new HashMap<String,Map<String, String>>();
		try {
			SAXReader saxReader = new SAXReader();
			File file = new File(ProjectProperty.PROJECT_PATH + ProjectProperty.RESOURCES_PATH + xml);
			if(file.exists()){
				doc = saxReader.read(file);
			}else{
				InputStream is=ParseConfig.class.getResourceAsStream(xml);
				doc = saxReader.read(is);
			}
			Element root = doc.getRootElement();// 查找根节点

			Iterator<Element> it = root.elementIterator();
			while (it.hasNext()) {
				Element ee = it.next();
				Map<String, String> config = new HashMap<String, String>();
				if (ee.getName().equals("template")) {
					config.put(ee.getName(), ee.getText());// 模版配置
					ret.put(ee.getName(), config);
					continue;
				}
				Iterator<Element> it2 = ee.elementIterator();
				while (it2.hasNext()) {
					Element e = it2.next();
					config.put(e.attribute("name").getValue(), e.getText());
				}
				ret.put(ee.getName(), config);
			}
			return ret;
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return null;
	}

}
