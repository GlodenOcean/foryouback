package cn.online.nocard.web.controller;

import java.util.ArrayList;
import java.util.List;

import cn.es.common.ESController;
import cn.es.common.ESTreeNode;
import cn.es.utils.ESBoolean;
import cn.es.utils.ESIDGenerate;
import cn.online.nocard.web.model.Source;

/**
 * 系统资源控制器
 * @author 钟展峰
 *
 * 2016年4月8日
 */
public class SourceController extends ESController{

	public void index(){
		render("source/sourceIndex.jsp");
	}
	
	public void form(){
		String id = getPara("id");
		String parentId = getPara("parentId");
		
		Source source = new Source();
		if(ESBoolean.isNotEmpty(id)){
			source = Source.dao.findById(id);
			setAttr("operation", "update");
		}else{
			setAttr("operation", "add");
			source.setParentId(parentId);
		}
		setAttr("vo", source);
		render("source/sourceForm.jsp");
	}
	
	public void update(){
		Source source = getModel(Source.class,"source");
		if(source.getId() != null){
			source.update();
		}else{
			if(source.getParentId() == null){
				source.setParentId("0");
			}
			source.setId(ESIDGenerate.getUUID());
			source.save();
		}
		source.put("iconSkin", "sourceIcon");
		renderSuccessJson(source);
	}
	
	public void findById(){
		Source source = Source.dao.findById(getPara("id"));
		renderJson(source);
	}
	
	public void delete(){
		List<Source> sourceList = Source.dao.searchAll();
		String id = getPara("id");
		Source.dao.deleteById(id);
		appendDelete(sourceList, id);
		renderSuccessJson();
	}
	
	/**
	 * 递归删除
	 * @param sourceList
	 * @param parentId
	 * @return
	 */
	private boolean appendDelete(List<Source> sourceList,String parentId){
		for (Source source : sourceList) {
			String sourcePid = source.getParentId();
			String sourceId = source.getId();
			if(sourcePid.equals(parentId)){
				if(hasChild(sourceList, sourceId)){
					if(appendDelete(sourceList, sourceId)){
						source.delete();					
					}
				}else{
					source.delete();
					return true;
				}
			}
		}
		return false;
	}
	
	/**
	 * 是否有子类
	 * @param sourceList
	 * @param parentId
	 * @return
	 */
	private boolean hasChild(List<Source> sourceList,String parentId){
		for (Source source : sourceList) {
			if(source.getParentId().equals(parentId)){
				return true;
			}
		}
		return false;
	}
	
	public void getTree(){
		List<Source> sourceList = Source.dao.searchAll();
		List<ESTreeNode> nodeList = new ArrayList<ESTreeNode>();
		
		for (Source source : sourceList) {
				ESTreeNode node = new ESTreeNode();
				node.setId(source.getId().toString());
				node.setpId(source.getParentId().toString());
				node.setName(source.getName());
				node.setChecked(false);
				node.setControlId(source.getControlId());
				node.setIconSkin("sourceIcon");
				if(source.getParentId().equals("0")){
					node.setOpen(true);
				}
				nodeList.add(node);
		}
		
		renderJson(nodeList);
		
	}

}
