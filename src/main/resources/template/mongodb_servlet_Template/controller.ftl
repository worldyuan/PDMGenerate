package ${xml["packages"]["controller"]};

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ${xml["packages"]["coreModel"]}.CommonStatus;
import ${xml["packages"]["coreException"]}.DaoException;
import ${xml["packages"]["coreException"]}.typeConvert.TypeConvertException;
import ${xml["packages"]["serviceImpl"]}.${pdmT.code?cap_first}ServiceImpl;
import com.xxfff.ddutils.LoggerUtils;

public class ${pdmT.code?cap_first}Controller {
	public static void add(HttpServletRequest request, HttpServletResponse response) {
		CommonStatus status = null;
		try {
			status = ${pdmT.code?cap_first}ServiceImpl.add(request);
			response.setContentType("text/json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(status.toString());
		} catch (TypeConvertException e) {
			LoggerUtils.log("error",
					Thread.currentThread().getStackTrace()[1].getClassName(),
					Thread.currentThread().getStackTrace()[1].getMethodName(),
					e.getMessage());
		} catch (IOException e) {
			LoggerUtils.log("error",
					Thread.currentThread().getStackTrace()[1].getClassName(),
					Thread.currentThread().getStackTrace()[1].getMethodName(),
					status.toString());
		} catch (DaoException e) {
			LoggerUtils.log("error",
					Thread.currentThread().getStackTrace()[1].getClassName(),
					Thread.currentThread().getStackTrace()[1].getMethodName(),
					status.toString());
		}
	}
}
