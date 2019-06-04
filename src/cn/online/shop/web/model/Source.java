package cn.online.shop.web.model;

import java.util.List;

import cn.online.shop.web.model.base.BaseSource;

public class Source extends BaseSource<Source>{

	private static final long serialVersionUID = 1L;

	public static final Source dao = new Source();
	
	public List<Source> searchAll(){
		return super.find("SELECT * FROM sys_source order by sort asc");
	}
	
	public List<Source> searchByParentId(String parentId){
		return super.find("SELECT * FROM sys_source where parentId = ? order by sort asc",parentId);
	}
	
}
