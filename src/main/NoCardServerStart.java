package main;

import com.jfinal.core.JFinal;

public class NoCardServerStart {

	public static void main(String[] args) {
		//需要关心 8080是端口,/front是目录
		//运行成功后浏览器输入localhost:8080/nocard
		JFinal.start("WebRoot", 8080, "/nocard", 5);
	}

}
