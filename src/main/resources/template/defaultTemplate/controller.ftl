package ${xml["packages"]["controller"]};

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import ${xml["packages"]["model"]}.${pdmT.code?cap_first};
import ${xml["packages"]["service"]}.${pdmT.code?cap_first}Service;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ${xml["packages"]["coreController"]}.BaseController;
import ${xml["packages"]["coreException"]}.DaoException;
import ${xml["packages"]["coreException"]}.ServiceException;
import ${xml["packages"]["coreException"]}.SystemConstant;
import ${xml["packages"]["coreModel"]}.CommonStatus;
import ${xml["packages"]["coreModel"]}.Pager;

@Controller
@Scope("request")
public class ${pdmT.code?cap_first}Controller extends BaseController {
	public static final String MODULE_PATH = "/manage/${pdmT.code ? uncap_first}/";
	@Resource
	private ${pdmT.code?cap_first}Service ${pdmT.code ? uncap_first}ServiceImpl;

	@RequestMapping(value = "/manage/${pdmT.code ? uncap_first}/manager")
	public String manager() {
		return getTheme() + MODULE_PATH + "manage";
	}
	
	@RequestMapping(value = "/manage/${pdmT.code ? uncap_first}/toManager")
	public String toManager(HttpServletRequest request, ${pdmT.code?cap_first} ${pdmT.code ? uncap_first},
			Integer pageNo, Integer pageSize, String orderBy, String sortBy) {
		Pager<${pdmT.code?cap_first}> pager = ${pdmT.code ? uncap_first}ServiceImpl.query(${pdmT.code ? uncap_first}, pageNo, pageSize, orderBy,
				sortBy);
		request.setAttribute("pager", pager);
		return getTheme() + MODULE_PATH + "manage";
	}
	
	@RequestMapping(value = "/manage/${pdmT.code ? uncap_first}/toQuery")
	public String toQuery(HttpServletRequest request, ${pdmT.code?cap_first} ${pdmT.code ? uncap_first},
			Integer pageNo, Integer pageSize, String orderBy, String sortBy) {
		Pager<${pdmT.code?cap_first}> pager = ${pdmT.code ? uncap_first}ServiceImpl.query(${pdmT.code ? uncap_first}, pageNo, pageSize, orderBy,
				sortBy);
		request.setAttribute("pager", pager);
		return getTheme() + MODULE_PATH + "query";
	}
	
	@RequestMapping(value = "/manage/${pdmT.code ? uncap_first}/query")
	@ResponseBody
	public CommonStatus query(HttpServletRequest request, ${pdmT.code?cap_first} ${pdmT.code ? uncap_first},
			Integer pageNo, Integer pageSize, String orderBy, String sortBy) {
		CommonStatus commonStatus = new CommonStatus(1, "数据查询成功!");
		Pager<${pdmT.code?cap_first}> pager = ${pdmT.code ? uncap_first}ServiceImpl.query(${pdmT.code ? uncap_first}, pageNo, pageSize, orderBy,
				sortBy);
		commonStatus.setObj(pager);
		return commonStatus;
	}
	
	@RequestMapping(value = "/manage/${pdmT.code ? uncap_first}/toAdd")
	public String toAdd(Model model){
		return getTheme() + MODULE_PATH + "/add";
	}
	
	@RequestMapping(value = "/manage/${pdmT.code ? uncap_first}/add")
	@ResponseBody
	public CommonStatus add(HttpServletRequest request, ${pdmT.code?cap_first} ${pdmT.code ? uncap_first}) {
		int n = 0;
		try {
			preEntity(${pdmT.code ? uncap_first});
			n = ${pdmT.code ? uncap_first}ServiceImpl.save(${pdmT.code ? uncap_first});
		} catch (DaoException e) {
			e.printStackTrace();
			int errno = e.getErrno();
			if(errno > 0)
				errno *= -1;
			return new CommonStatus(errno, "数据异常");
		} catch (ServiceException e){
			e.printStackTrace();
			int errno = e.getErrno();
			if(errno > 0)
				errno *= -1;
			return new CommonStatus(errno, "程序异常");
		} catch (Exception e){
			e.printStackTrace();
			return new CommonStatus(SystemConstant.Other, "未知异常");
		}
		return new CommonStatus(n, "数据添加成功!", ${pdmT.code ? uncap_first});
	}
	
	@RequestMapping(value = "/manage/${pdmT.code ? uncap_first}/fetch")
	@ResponseBody
	public CommonStatus fetch(Model model, ${pdmT.code?cap_first} ${pdmT.code?uncap_first}){
		${pdmT.code ? uncap_first} = ${pdmT.code ? uncap_first}ServiceImpl.selectOne(${pdmT.code?uncap_first});
		return new CommonStatus(0, "获取成功", ${pdmT.code ? uncap_first});
	}
	
	@RequestMapping(value = "/manage/${pdmT.code ? uncap_first}/toEdit")
	public String toEdit(Model model, ${pdmT.code?cap_first} ${pdmT.code?uncap_first}){
		${pdmT.code ? uncap_first} = ${pdmT.code ? uncap_first}ServiceImpl.selectOne(${pdmT.code?uncap_first});
		model.addAttribute("${pdmT.code ? uncap_first}", ${pdmT.code ? uncap_first});
		return getTheme() + MODULE_PATH + "edit";
	}
	
	@RequestMapping(value = "/manage/${pdmT.code ? uncap_first}/edit")
	@ResponseBody
	public CommonStatus edit(HttpServletRequest request, ${pdmT.code?cap_first} ${pdmT.code ? uncap_first}) {
		int n = 0;
		try {
			preEntity(${pdmT.code ? uncap_first});
			n = ${pdmT.code ? uncap_first}ServiceImpl.update(${pdmT.code ? uncap_first});
		} catch (DaoException e) {
			e.printStackTrace();
			int errno = e.getErrno();
			if(errno > 0)
				errno *= -1;
			return new CommonStatus(errno, "数据异常");
		} catch (ServiceException e){
			e.printStackTrace();
			int errno = e.getErrno();
			if(errno > 0)
				errno *= -1;
			return new CommonStatus(errno, "程序异常");
		} catch (Exception e){
			e.printStackTrace();
			return new CommonStatus(SystemConstant.Other, "未知异常");
		}
		return new CommonStatus(n, "数据修改成功!", ${pdmT.code ? uncap_first});
	}
	
	@RequestMapping(value = "/manage/${pdmT.code ? uncap_first}/delete")
	@ResponseBody
	public CommonStatus delete(HttpServletRequest request, ${pdmT.code?cap_first} ${pdmT.code?uncap_first}) {
		int n = 0;
		try {
			n = ${pdmT.code?uncap_first}ServiceImpl.delete(${pdmT.code?uncap_first});
		} catch (DaoException e) {
			e.printStackTrace();
			int errno = e.getErrno();
			if(errno > 0)
				errno *= -1;
			return new CommonStatus(errno, "数据异常");
		} catch (ServiceException e){
			e.printStackTrace();
			int errno = e.getErrno();
			if(errno > 0)
				errno *= -1;
			return new CommonStatus(errno, "程序异常");
		} catch (Exception e){
			e.printStackTrace();
			return new CommonStatus(SystemConstant.Other, "未知异常");
		}
		return new CommonStatus(n, "数据删除成功!");
	}
	
	@RequestMapping(value = "/manage/${pdmT.code ? uncap_first}/deleteAll")
	@ResponseBody
	public CommonStatus deleteAll(HttpServletRequest request, String[] ids) {
		int n = 0;
		try {
			n = ${pdmT.code?uncap_first}ServiceImpl.delete(ids);
		} catch (DaoException e) {
			e.printStackTrace();
			int errno = e.getErrno();
			if(errno > 0)
				errno *= -1;
			return new CommonStatus(errno, "数据异常");
		} catch (ServiceException e){
			e.printStackTrace();
			int errno = e.getErrno();
			if(errno > 0)
				errno *= -1;
			return new CommonStatus(errno, "程序异常");
		} catch (Exception e){
			e.printStackTrace();
			return new CommonStatus(SystemConstant.Other, "未知异常");
		}
		return new CommonStatus(n, "数据删除成功!");
	}
	
	@RequestMapping(value = "/manage/${pdmT.code ? uncap_first}/processAll")
	@ResponseBody
	public CommonStatus processAll(HttpServletRequest request, List<${pdmT.code ? cap_first}> ${pdmT.code ? uncap_first}s) {
		int n = 0;
		try {
			for(${pdmT.code ? cap_first} e:${pdmT.code ? uncap_first}s){
				preEntity(e);
			}
			n = ${pdmT.code ? uncap_first}ServiceImpl.doAllEntities(${pdmT.code ? uncap_first}s);
		} catch (DaoException e) {
			e.printStackTrace();
			int errno = e.getErrno();
			if(errno > 0)
				errno *= -1;
			return new CommonStatus(errno, "数据异常");
		} catch (ServiceException e){
			e.printStackTrace();
			int errno = e.getErrno();
			if(errno > 0)
				errno *= -1;
			return new CommonStatus(errno, "程序异常");
		} catch (Exception e){
			e.printStackTrace();
			return new CommonStatus(SystemConstant.Other, "未知异常");
		}
		return new CommonStatus(n, "数据修改成功!");
	}
}