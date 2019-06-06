package cn.online.shop.web.controller;

import cn.es.common.ESController;
import cn.es.utils.ESBoolean;
import cn.es.utils.ESDate;
import cn.es.utils.ESIDGenerate;
import cn.es.utils.ESMD5;
import cn.online.shop.web.model.Goods;
import cn.online.shop.web.model.Role;
import cn.online.shop.web.model.User;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;


/**
 * 富叔粮油控制器
 * @author ocean
 */
public class WeChatFuShuController extends ESController{
	
	/**
	 * 分页查询goods
	 */
	public void searchGoods(){
		Page<Goods> page = Goods.dao.search(super.getSearchCondition());
		setPageResultToRequest("goodsList", page);
		renderSuccessJson(page);
	}
	
	/**
	 * 跳转到表单页面
	 */
	public void form(){
		String id = getPara("id");
		if(ESBoolean.isNotEmpty(id)){
			User user = User.dao.findById(id);
			setAttr("user", user);
		}
		List<Role> roleList = Role.dao.searchAll();
		setAttr("roleList", roleList);
		render("user/userForm.jsp");
	}
	
	/**
	 * 跳转到修改密码页面,修改自己的密码
	 */
	public void changePasswordPage(){
		render("user/changePassword.jsp");
	}
	
	/**
	 * 修改密码
	 */
	public void changePassword(){
		User user = User.dao.findById(getPara("id"));
		String oldPassword = ESMD5.codeFor(getPara("oldPassword"));
		if(user.getPassword().equals(oldPassword)){
			String newPassword = ESMD5.codeFor(getPara("newPassword"));
			user.setPassword(newPassword);
			user.update();
			renderSuccessJson();
		}else{
			renderFailJson("原始密码不正确.");
		}
	}
	
	/**
	 * 更新,包含新增
	 */
	public void update(){
		User newUser = getModel(User.class,"user");
		newUser.setUpdateTime(ESDate.getDateTime());
		
		if(ESBoolean.isNotNull(newUser.getId())){
			newUser.update();
			renderSuccessJsonAndClose();
		}else{
			User existsUser = User.dao.searchByloginId(newUser.getLoginId());
			if(existsUser != null){
				renderFailJson("用户名已经被注册.");
			}else{
				String newPassword = ESMD5.codeFor(newUser.getPassword());
				newUser.setPassword(newPassword);
				newUser.setId(ESIDGenerate.getUUID());
				newUser.save();
				renderSuccessJsonAndClose();
			}
		}
		
	}
	
	public void openResetPassword(){
		setAttr("userId", getPara("userId"));
		render("user/resetPassword.jsp");
	}
	
	/**
	 * 重置密码
	 */
	public void resetPassword(){
		User user = User.dao.findById(getPara("id"));
		String newPassword = ESMD5.codeFor(getPara("newPassword"));
		user.setPassword(newPassword);
		user.setUpdateTime(ESDate.getDateTime());
		user.update();
		renderSuccessJson();
	}
	
	/**
	 * 修改状态
	 */
	public void changeStatus(){
		User user = User.dao.findById(getPara("id"));
		if(user.getStatus().equals("0")){
			user.setStatus("1");
		}else{
			user.setStatus("0");
		}
		user.setUpdateTime(ESDate.getDateTime());
		user.update();
		renderSuccessJson();
	}
	
	/**
	 * 删除
	 */
	public void delete(){
		Object[] ids = getParaValues("ids");
		User.dao.batchDelete(ids);
		renderSuccessJson();
	}
	
}
