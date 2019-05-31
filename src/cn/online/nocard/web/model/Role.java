package cn.online.nocard.web.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;

import cn.es.common.ESSearchCondition;
import cn.es.utils.ESSQLHelper;
import cn.online.nocard.web.model.base.BaseRole;

/**
 * 角色
 * @author 钟展峰 
 * by 2015年8月4日
 */
public class Role extends BaseRole<Role>{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 非线程安全,只供查询使用
	 */
	public static Role dao = new Role();
	
	/**
	 * 分页查询
	 * @param sc
	 * @return
	 */
	public Page<Role> search(ESSearchCondition sc){
		int index = sc.page.getIndex();
		int pageSize = sc.page.getSize();
		ESSQLHelper sql = new ESSQLHelper("FROM sys_role WHERE 1 = 1");
		sql.equals("roleName", sc.getString("roleName"));
		sql.orderBy(sc,"updateDatetime","desc");
		return super.paginate(index, pageSize, "select *", sql.toString(),sql.getParams());
	}
	
	/**
	 * 查询所有
	 * @return
	 */
	public List<Role> searchAll(){
		ESSQLHelper sql = new ESSQLHelper("SELECT * FROM sys_role WHERE 1 = 1");
		return super.find(sql.toString(),sql.getParams());
	}
	
	/**
	 * 根据角色名查询
	 * @param name
	 * @return
	 */
	public Role searchByName(String name){
		return super.findFirst("select * from sys_role where roleName = ?", name);
	}
	
	public boolean batchDeleteByIds(Object... ids){
		ESSQLHelper sql = new ESSQLHelper("DELETE FROM sys_role WHERE 1 = 1");
		sql.in("id", ids);
		return Db.update(sql.toString(), sql.getParams()) > 0;
	}
	
}
