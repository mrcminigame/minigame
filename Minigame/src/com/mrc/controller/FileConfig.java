package com.mrc.controller;

import java.util.*;

import java.io.*;

public class FileConfig {

	public List<String> componentScan(String pack) {
		List<String> list = new ArrayList<String>();
		try {
			String path = "C:\\git\\minigame\\Minigame\\src\\";


			path = path + pack.replace(".", "\\");
			File dir = new File(path);
			File[] files = dir.listFiles();
			// com.sist.model.Class¸í
			for (File f : files) {
				String name = f.getName();
				String ext = name.substring(name.lastIndexOf(".") + 1);
				if (ext.equals("java")) {
					// System.out.println(ext);
					String str = pack + "." + name.substring(0, name.lastIndexOf("."));
					list.add(str);
				}
			} 
		} catch (Exception ex) {
			System.out.println("FileConfig : " + ex.getMessage());
		}
		return list;
	}

}
