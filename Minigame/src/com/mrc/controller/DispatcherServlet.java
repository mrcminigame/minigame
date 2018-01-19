package com.mrc.controller;

import java.io.*;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private WebApplicationContext wc;
	private List<String> list = new ArrayList<String>();

	public void init(ServletConfig config) throws ServletException {
		String path = config.getInitParameter("contextConfigLocation");
		//System.out.println(path);
		wc = new WebApplicationContext(path);
		list = wc.getList();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String cmd = request.getRequestURI();
			cmd = cmd.substring(request.getContextPath().length() + 1);
			/*
			 * http://localhost:8080 /MVCFinalProject/main.do => URI /MVCFinalProject =>
			 * ContextPath
			 */
			for (String s : list) {
				Class clsName = Class.forName(s);
				// Ŭ���� ���� �б�
				if (clsName.isAnnotationPresent(Controller.class) == false)
					continue;
				// ������̼��� ������ �� ��ü �޸� �Ҵ�
				Object obj = clsName.newInstance();

				// �޼ҵ� ȣ��
				Method[] methods = clsName.getDeclaredMethods();
				// ����Ǿ� �ִ� Ŭ������ ��� �޼ҵ带 �о� �´�
				for (Method m : methods) {
					RequestMapping rm = m.getAnnotation(RequestMapping.class);
					if (rm.value().equals(cmd)) {
						// @RequestMapping("main.do")
						// rm.value() = main.do
						String jsp = (String) m.invoke(obj, request, response);
						// ���� �Ű����� Object... printf("%d%d%d%d%s",Object... )
						RequestDispatcher rd = request.getRequestDispatcher(jsp);
						rd.forward(request, response);
						return;// service�޼ҵ� ����
					}
				}

			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
