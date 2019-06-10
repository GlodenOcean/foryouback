package cn.online.shop.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;

import cn.es.common.ESController;
import cn.es.utils.ESBoolean;
import cn.es.utils.ESDate;
import cn.es.utils.ESIDGenerate;
import cn.online.shop.web.model.Role;
import cn.online.shop.web.model.User;

/**
 * 角色控制器
 * @author ocean
 * by 2019年6月6日
 */
public class RoleController extends ESController{


	/**
	 * 查询
	 */
	public void search(){
		Page<Role> page = Role.dao.search(super.getSearchCondition());
		setPageResultToRequest("roleList", page);
		render("role/roleList.jsp");
	}
	
	/**
	 * 跳转到表单页面
	 */
	public void form(){
		String id = getPara("id");
		if(ESBoolean.isNotEmpty(id)){
			Role role = Role.dao.findById(id);
			setAttr("operation", "update");
			setAttr("role", role);
		}else{
			setAttr("operation", "add");
		}
		render("role/roleForm.jsp");
	}
	
	/**
	 * 更新,包含新增
	 */
	public void update(){
		Role role = getModel(Role.class,"role");
		role.setUpdateDateTime(ESDate.getDateTime());
		Role tempRole = Role.dao.searchByName(role.getRoleName());
		
		if(tempRole == null){
				role.update();
				renderSuccessJson();
		}else{
			if(tempRole.getId().equals(role.getId())){
				role.update();
				renderSuccessJson();
			}else{
				renderFailJson("角色名已经被使用.");
			}
		}
		
	}

	public void add(){
		Role role = getModel(Role.class,"role");
		Role tempRole = Role.dao.searchByName(role.getRoleName());
		if(tempRole == null){
			role.setId(ESIDGenerate.getUUID());
			role.setUpdateDateTime(ESDate.getDateTime());
			role.save();
			renderSuccessJson();
		}else{
			renderFailJson("角色名已经被使用.");
		}
	}
	
	public void export() throws Exception{
		List<Role> allRoleList = Role.dao.searchAll();
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("dataList", allRoleList);
		dataMap.put("otherValue", "其他值测试");
		exportExcel("导出角色模板.xlsx", "角色列表.xlsx", dataMap);
	}
	
	/**
	 * 跳转到分配权限资源的页面
	 */
	public void toAllotAccess(){
		String roleId = getPara("id");
		Role role = Role.dao.findById(roleId);
		setAttr("role", role);
		render("role/allotAccess.jsp");
	}
	
	/**
	 * 保存分配的权限资源
	 * @Before(Tx.class)  此方法进入事务管理
	 */
	@Before(Tx.class)
	public void allotAccess(){
		Role role = getModel(Role.class,"role");
		role.update();
		renderSuccessJsonAndClose();
	}
	
	/**
	 * 删除
	 */
	@Before(Tx.class)
	public void delete(){
		Object[] ids = getParaValues("ids");
		Role.dao.batchDeleteByIds(ids);
		User.dao.batchSetNullRoleIdByRoleId(ids);
		renderSuccessJson();
	}
}
