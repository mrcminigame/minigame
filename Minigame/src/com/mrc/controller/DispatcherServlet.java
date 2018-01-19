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
				// 클래스 정보 읽기
				if (clsName.isAnnotationPresent(Controller.class) == false)
					continue;
				// 어노테이션이 존재할 때 객체 메모리 할당
				Object obj = clsName.newInstance();

				// 메소드 호출
				Method[] methods = clsName.getDeclaredMethods();
				// 선언되어 있는 클래스의 모든 메소드를 읽어 온다
				for (Method m : methods) {
					RequestMapping rm = m.getAnnotation(RequestMapping.class);
					if (rm.value().equals(cmd)) {
						// @RequestMapping("main.do")
						// rm.value() = main.do
						String jsp = (String) m.invoke(obj, request, response);
						// 가변 매개변수 Object... printf("%d%d%d%d%s",Object... )
						RequestDispatcher rd = request.getRequestDispatcher(jsp);
						rd.forward(request, response);
						return;// service메소드 종료
					}
				}

			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
