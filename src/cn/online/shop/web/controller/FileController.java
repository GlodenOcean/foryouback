package cn.online.shop.web.controller;

import java.io.File;

import com.jfinal.upload.UploadFile;

import cn.es.common.ESController;
import cn.es.common.ESResponser;
import cn.es.utils.ESConfig;
import cn.es.utils.ESFile;

public class FileController extends ESController {

	public String getFilePath() {
		return getWebRootPath() + "/upload/";
	}

	public void index() {
		File file = new File(getFilePath() + "/template/");
		String[] list = file.list();
		setAttr("fileList", list);
		setAttr("path", "path");
		render("file/fileList.jsp");
	}

	public void upload() throws Exception {
		UploadFile uf = getFile("uploadFile");
		String path = getPara("path");
		ESFile.copyFile(uf.getFile(), new File(getFilePath() + "/" + path + "/" + "模板-" + uf.getFileName()));
		uf.getFile().delete();
		renderJson(ESResponser.success());
	}

	public void download() {
		String fileName = getPara("fileName");
		String path = getPara("path");
		File file = new File(getFilePath() + "/" + path + "/" + fileName);
		renderFile(file);
	}

	public void downloadLua() {
		String fileName = getPara("fileName");
		File file = new File(ESConfig.get("templateFileDirectory") + fileName);
		renderFile(file);
	}

	public void delete() {
		String fileName = getPara("fileName");
		String path = getPara("path");
		File file = new File(getFilePath() + "/" + path + "/" + fileName);
		file.delete();
		renderSuccessJson();
	}

	/**
	 * 跳转到接口文档下载页面
	 */
	public void interfaceFileList() {
		File file = new File(getFilePath() + "/file/");
		String[] list = file.list();
		setAttr("fileList", list);
		setAttr("path", "file");
		render("file/interfaceFileList.jsp");
	}
	
	
	/**
	 * 普通接口接入指南
	 */
	public void interfaceGuide() {
		render("file/interfaceGuide.jsp");
	}
	
	/**
	 * 公众号接入指南
	 */
	public void WXGuide() {
		render("file/WXGuide.jsp");
	}
}
