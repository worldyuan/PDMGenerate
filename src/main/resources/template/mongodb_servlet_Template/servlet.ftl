package ${xml["packages"]["servlet"]};

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "${pdmT.code?cap_first}Servlet", urlPatterns = { "/${pdmT.code?uncap_first}" })
public class ${pdmT.code?cap_first}Servlet extends HttpServlet {
	private static Class<?> c${pdmT.code?cap_first}Controller = null;
	static{
		try {
			c${pdmT.code?cap_first}Controller = Class.forName("${xml["packages"]["controller"]}.${pdmT.code?cap_first}Controller");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		try {
			c${pdmT.code?cap_first}Controller.getMethod(
					action,
					new Class[] { HttpServletRequest.class,
							HttpServletResponse.class }).invoke(c${pdmT.code?cap_first}Controller,
					request, response);
		} catch (IllegalAccessException | IllegalArgumentException
				| InvocationTargetException | NoSuchMethodException
				| SecurityException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}