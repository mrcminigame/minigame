package com.mrc.controller;

import java.io.File;
import java.util.*;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

public class WebApplicationContext {
	private List<String> list = new ArrayList<String>();

	/*
	 * public static void main(String[] arg) { String path=
	 * "C:\\webDev\\mvcStudy\\MVCFinalProject\\WebContent\\WEB-INF\\application-context.xml";
	 * WebApplicationContext wc=new WebApplicationContext(path); }
	 */
	public WebApplicationContext(String path) {
		try {
			System.out.println(path);
			SAXParserFactory spf = SAXParserFactory.newInstance();
			// SAX파서기 생성
			// System.out.println("SAX파서기 생성");
			SAXParser sp = spf.newSAXParser();
			HandlerMapping hm = new HandlerMapping();

			sp.parse(new File(path), hm);

			List<String> packList = hm.getList();

			FileConfig fc = new FileConfig();
			for (String pack : packList) {
				List<String> p = fc.componentScan(pack);
				for (String s : p) {
					// System.out.println(s);
					list.add(s);
				}
			}

		} catch (Exception ex) {
			System.out.println("WebApplicationContext : " + ex.getMessage());
		}
	}

	public List<String> getList() {
		return list;
	}

}
