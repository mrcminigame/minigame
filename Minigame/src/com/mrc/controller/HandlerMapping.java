package com.mrc.controller;

import java.util.ArrayList;
import java.util.List;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

// XML Parsing
/*
 * XML : 등록 (클래스, 패키지, 오라클 정보)
 * Annotation : (찾기 = 인덱스)
 * 
 * 
 * 
 */
public class HandlerMapping extends DefaultHandler{
    private List<String> list=new ArrayList<String>();

	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		try
		{
			if(qName.equals("context:component-scan"))
			{
				String pack = attributes.getValue("base-package");
				list.add(pack);
			}
		}
		catch(Exception e)
		{
			System.out.println("HandlerMapping : "+e.getMessage());
		}
	}

	public List<String> getList() {
		return list;
	}

}
