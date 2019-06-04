package cn.online.shop.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.es.utils.ESBoolean;
import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;


/**
 * Excel读取类, 使用POI
 *
 * 2015年8月25日
 */
public class HCExcel {
	
	/**
	 * 写密钥回excel表中
	 * @param sourceFile  excel文件
	 * @param row 写入的行
	 * @param col 写入的列
	 * @param value 写入的值
	 */
	public static void writeToExcel(File sourceFile,Integer row,Integer col,String title ,String value){
		
		try {			
			String name = sourceFile.getName();
			if(name.indexOf(".xlsx")!=-1){
				//2007 版
				XSSFWorkbook wb = new XSSFWorkbook(new FileInputStream(sourceFile));
				XSSFSheet sheet = wb.getSheetAt(0);				
				//标题
				sheet.getRow(0).createCell(col).setCellValue(title);
				//值
				XSSFRow ssRow = sheet.getRow(row);				
				XSSFCell cell =  ssRow.createCell(col);				
				cell.setCellValue(value);
			
				FileOutputStream outputStream = new FileOutputStream(sourceFile);
				wb.write(outputStream);
				outputStream.close();
				wb.close();
			}else {
				//2003	
				HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(sourceFile));
				HSSFSheet sheet = wb.getSheetAt(0);
				//标题
				sheet.getRow(0).createCell(col).setCellValue(title);
				//值
				HSSFRow ssRow = sheet.getRow(row);	
				HSSFCell cell =  ssRow.createCell(col);				
				cell.setCellValue(value);
								
				FileOutputStream outputStream = new FileOutputStream(sourceFile);
				wb.write(outputStream);
				outputStream.close();
				wb.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	@SuppressWarnings("static-access")
	public static List<String[]> read(File sourceFile){
		List<String[]> dataList = new ArrayList<String[]>();
		try {			
			String name = sourceFile.getName();
			if(name.indexOf(".xlsx")!=-1){
				//2007 版
				XSSFWorkbook wb = new XSSFWorkbook(sourceFile);
				XSSFSheet sheet = wb.getSheetAt(0);
				
				XSSFRow row;  
				int numberOfRows = sheet.getPhysicalNumberOfRows();
				// 循环输出表格中的内容  
				for (int i = sheet.getFirstRowNum(); i < numberOfRows; i++) {
				    row = sheet.getRow(i);  
				    int numberOfCells = row.getPhysicalNumberOfCells();
				    String[] rowData = new String[numberOfCells];
				    for (int j = row.getFirstCellNum(); j < numberOfCells; j++) {  
				        // 通过 row.getCell(j).toString() 获取单元格内容，  
				    	if(row.getCell(j) == null){
				    		continue;
				    	}
				    	row.getCell(j).setCellType(row.getCell(j).CELL_TYPE_STRING);
				    	if( ESBoolean.isEmpty(row.getCell(j).getStringCellValue())){
				    		continue;
				    	}
				        rowData[j] = row.getCell(j).getStringCellValue();
				    }  
				    if(ESBoolean.isEmpty(rowData[0])){
				    	continue;
				    }
				    dataList.add(rowData);
				}  
				wb.close();
			}else {
				//2003
				HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(sourceFile));
				HSSFSheet sheet = wb.getSheetAt(0);
				
				HSSFRow row;  
				int numberOfRows = sheet.getPhysicalNumberOfRows();				
				// 循环输出表格中的内容  
				for (int i = sheet.getFirstRowNum(); i < numberOfRows; i++) {
				    row = sheet.getRow(i);  
				    int numberOfCells = row.getPhysicalNumberOfCells();				    
				    String[] rowData = new String[numberOfCells];
				    for (int j = row.getFirstCellNum(); j < numberOfCells; j++) {  
				        // 通过 row.getCell(j).toString() 获取单元格内容，  		
				    	if(row.getCell(j) == null){
				    		continue;
				    	}
				    	row.getCell(j).setCellType(row.getCell(j).CELL_TYPE_STRING);
				    	if( ESBoolean.isEmpty(row.getCell(j).getStringCellValue())){
				    		continue;
				    	}
				        rowData[j] = row.getCell(j).getStringCellValue();
				    } 
				    /*
				    if(HCBoolean.isEmpty(rowData[0])){
				    	continue;
				    }//*/
				    dataList.add(rowData);
				}  
				wb.close();
		
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataList;
	}
	
	public static void createExcel(String templatePath, Map<String, Object> beans, String filePath) throws InvalidFormatException{
		XLSTransformer transformer = new XLSTransformer();
		// 模板文件路径
		String sfrom = templatePath;
		// 要生成的文件路径
		String sto = filePath;
		try {
			transformer.transformXLS(sfrom, beans, sto);
		} catch (ParsePropertyException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) throws IOException {
		//*
		List<String> strList = new ArrayList<String>();
		strList.add("前置商户号");
		strList.add("1");
		strList.add("2");
		strList.add("3");
		createExcelFile(strList,"D:\\usr\\本次生成商户号明细.xlsx");
		//List<String[]> dataList = new ArrayList<>();
		//createExcelFile("自助入网商户信息",dataList,"D:\\usr\\自助入网.xlsx");
		//*/
		
	}
	
	/**
	 * 根据指定路径及内容创建excel
	 * @param serialNos
	 * @param filePath
	 * @throws IOException
	 */
	public static void createExcelFile(List<String> serialNos,String filePath) throws IOException{
		System.out.println("serialNos:" + serialNos.size());
		 // 创建Excel的工作书册 Workbook,对应到一个excel文档  
	    XSSFWorkbook wb = new XSSFWorkbook();  
	  
	    // 创建Excel的工作sheet,对应到一个excel文档的tab  
	    XSSFSheet sheet = wb.createSheet("汇云付编号");  
	  
	    // 设置excel每列宽度  
	    sheet.setColumnWidth(0, 4000);  
	    sheet.setColumnWidth(1, 3500);  
	  
	    // 创建字体样式  
	    XSSFFont font = wb.createFont();  
	    font.setFontName("Verdana");  
	    font.setBoldweight((short) 100);  
	    font.setFontHeight((short) 300);  
	    font.setColor(HSSFColor.BLUE.index);  
	  
	    // 创建单元格样式  
	    XSSFCellStyle style = wb.createCellStyle();  
	    style.setAlignment(XSSFCellStyle.ALIGN_CENTER);  
	    style.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);  
	    style.setFillForegroundColor(HSSFColor.LIGHT_TURQUOISE.index);  
	    style.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);  
	  
	    // 设置边框  
	    style.setBottomBorderColor(HSSFColor.RED.index);  
	    style.setBorderBottom(XSSFCellStyle.BORDER_THIN);  
	    style.setBorderLeft(XSSFCellStyle.BORDER_THIN);  
	    style.setBorderRight(XSSFCellStyle.BORDER_THIN);  
	    style.setBorderTop(XSSFCellStyle.BORDER_THIN);  
	  
	    style.setFont(font);// 设置字体  
	  
	    // 创建Excel的sheet的一行  
	    for(int i = 0 ; i < serialNos.size(); i ++){
	    	XSSFRow row = sheet.createRow(i);  
	 	    row.setHeight((short) 500);// 设定行的高度  
	 	    // 创建一个Excel的单元格  
	 	    XSSFCell cell = row.createCell(0);  
	 	  
	 	    // 设置单元格内容格式  
	 	    XSSFCellStyle style1 = wb.createCellStyle();  
	 	    style1.setWrapText(true);// 自动换行  
	 	  
	 	    row = sheet.createRow(i);  
	 	  
	     	cell = row.createCell(0); 
	     	cell.setCellValue(serialNos.get(i));
	    }
	    File readPath = new File(filePath);
	    if(!readPath.getParentFile().exists()){
	    	readPath.getParentFile().mkdirs();
	    }
	    FileOutputStream os = new FileOutputStream(filePath);  
	    wb.write(os);  
	    os.close();  
	    wb.close();
	}
	
	/**
	 * 生成excel表格 文件
	 * 
	 * @param sheetName 表的sheet名称
	 * @param dataList 表格中的数据
	 * @param filePaht 需要保存的文件 (包含路径信息)
	 * @throws IOException 
	 * 
	 */
	public  static void createExcelFile(String sheetName,List<String[]>dataList,String filePath) throws IOException{
		 // 创建Excel的工作书册 Workbook,对应到一个excel文档  
	    XSSFWorkbook wb = new XSSFWorkbook(); 	  
	    // 创建Excel的工作sheet,对应到一个excel文档的tab  
	    XSSFSheet sheet = wb.createSheet(sheetName);  
	    
	    int row=0;
	    for (String[] strings : dataList) {
		    XSSFRow xssfRow = 	sheet.createRow(row);
				for (int i = 0; i < strings.length; i++) {
					//设置值
					xssfRow.createCell(i).setCellValue(strings[i]);
				}
		    row++;	
		}
	    File readPath = new File(filePath);
	    if(!readPath.getParentFile().exists()){
	    	readPath.getParentFile().mkdirs();
	    }
	    FileOutputStream os = new FileOutputStream(filePath);  
	    wb.write(os); 	   
	    os.close();  
	    wb.close();
	}
	
	/**
	 * 根据指定路径及内容创建excel
	 * 
	 * @param serialNos
	 * @param filePath
	 * @throws IOException
	 */
	public static void createExcelFile(String[][] strArrays, String filePath) throws IOException {
		// 创建Excel的工作书册 Workbook,对应到一个excel文档
		XSSFWorkbook wb = new XSSFWorkbook();

		// 创建Excel的工作sheet,对应到一个excel文档的tab
		XSSFSheet sheet = wb.createSheet("汇云付编号");

		// 设置excel每列宽度
		sheet.setColumnWidth(0, 4000);
		sheet.setColumnWidth(1, 3500);

		// 创建字体样式
		XSSFFont font = wb.createFont();
		font.setFontName("Verdana");
		font.setBoldweight((short) 100);
		font.setFontHeight((short) 300);
		font.setColor(HSSFColor.BLUE.index);

		// 创建单元格样式
		XSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		style.setFillForegroundColor(HSSFColor.LIGHT_TURQUOISE.index);
		style.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);

		// 设置边框
		style.setBottomBorderColor(HSSFColor.RED.index);
		style.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		style.setBorderRight(XSSFCellStyle.BORDER_THIN);
		style.setBorderTop(XSSFCellStyle.BORDER_THIN);

		style.setFont(font);// 设置字体

		// 创建Excel的sheet的一行
		for (int i = 0; i < strArrays.length ; i++) {
			XSSFRow row = sheet.createRow(i);//创建行
			for (int j = 0; j < strArrays[i].length ; j++) {
				row.setHeight((short) 500);// 设定行的高度
				// 创建一个Excel的单元格
				XSSFCell cell  = row.createCell(j);
				// 设置单元格内容格式
				XSSFCellStyle style1 = wb.createCellStyle();
				style1.setWrapText(true);// 自动换行
				cell.setCellValue(strArrays[i][j]);
			}
		}
		
		File readPath = new File(filePath);
		if (!readPath.getParentFile().exists()) {
			readPath.getParentFile().mkdirs();
		}
		FileOutputStream os = new FileOutputStream(filePath);
		wb.write(os);
		os.close();
		wb.close();
	}
	
}