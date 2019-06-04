package cn.online.shop.web.controller;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;

import cn.es.common.ESController;

/**
 * @Description: 商户控制器
 * @author: ocean
 * @date: 2017年4月24日 下午7:02:28
 * @version: V1.0
 */
public class MerchController extends ESController {


	/**
	 * 更新
	 */
	public void update() {
//		Merch merch = getModel(Merch.class, "merch");
//		merch.setUpdateTime(ESDate.parseDate(ESDate.getDateTime(), "yyyy-MM-dd HH:mm:ss"));
//		merch.update();
		renderSuccessJsonAndClose();
	}

	/**
	 * 新增
	 */
	@Before(Tx.class)  
	public void add() {
//		Merch merch = getModel(Merch.class, "merch");
//		Merch omerch = Merch.dao.findById(merch.getMerchId());
//		if (omerch != null) {
//			renderFailJson("商户已存在");
//		} else {
//			merch.setEncKey(ESIDGenerate.getUUID().toLowerCase());// 设置商户秘钥
//			merch.setAddTime(ESDate.parseDate(ESDate.getDateTime(), "yyyy-MM-dd HH:mm:ss"));
//			merch.setUpdateTime(ESDate.parseDate(ESDate.getDateTime(), "yyyy-MM-dd HH:mm:ss"));
//			merch.setUUID(ESIDGenerate.getUUID());
//			//添加商户账户
//
//			merch.save();
//			renderSuccessJsonAndClose();
//		}
	}

	/**
	 * 删除
	 */
	public void delete() {
		Object[] ids = getParaValues("ids");
//		Merch.dao.batchDelete(ids);
		renderSuccessJson();
	}

	public void view() {
//		String merchId = getPara("merchId");
//		if (ESBoolean.isNotEmpty(merchId)) {
//			Merch merch = Merch.dao.findById(merchId);
//			setAttr("merch", merch);
//		}
//		render("merch/merchDetail.jsp");
	}

	/**
	 * 导出对账数据
	 * 
	 * @throws Exception
	 */
//	public void exportMerch() throws Exception {
//
//		List<Merch> merchList = Merch.dao.searchAll();
////		List<AccountMerch> accountMerchList = AccountMerch.dao.searchAll();
//		String filePath = getWebRootPath() + "upload/temp/代理商列表" + ESDate.getDate() + ".xlsx";
//		// 创建Excel的工作书册 Workbook,对应到一个excel文档
//		XSSFWorkbook wb = new XSSFWorkbook();
//		// 创建Excel的工作sheet,对应到一个excel文档的tab
//		XSSFSheet sheet = wb.createSheet("代理商列表");
//
//		// 创建标题样式对象
//		XSSFCellStyle titleStyle = (XSSFCellStyle) wb.createCellStyle();
//		// 创建字体对象
//		Font titleFont = wb.createFont();
//		titleFont.setBold(true);// 将字体加粗
//		titleFont.setFontHeightInPoints((short) 16); // 将字体大小设置为18px
//		titleFont.setFontName("宋体"); // 将“宋体”字体应用到当前单元格上
//		titleStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);
//		titleStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
//		titleStyle.setFont(titleFont); // 将字体应用到样式上面
//
//		// 创建单元格样式对象
//		XSSFCellStyle ztStyle = (XSSFCellStyle) wb.createCellStyle();
//		// 创建字体对象
//		Font ztFont = wb.createFont();
//		ztFont.setBold(true);// 将字体加粗
//		ztFont.setFontHeightInPoints((short) 12); // 将字体大小设置为18px
//		ztFont.setFontName("Times New Roman"); // 将“宋体”字体应用到当前单元格上
//		ztStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);
//		ztStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
//		ztStyle.setFont(ztFont); // 将字体应用到样式上面
//
//		XSSFRow xssfRow = sheet.createRow(0);
//		xssfRow = sheet.createRow(0);
//		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 12));
//		XSSFCell cellTitle = xssfRow.createCell(0);
//		cellTitle.setCellValue("商户列表");
//		cellTitle.setCellStyle(titleStyle);
//
//		xssfRow = sheet.createRow(1);
//		xssfRow.createCell(0).setCellValue("生成日期：" + ESDate.getDateTime());
//		sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 12));
//
//		xssfRow = sheet.createRow(2);
//		String[] strs = { "商户编号", "商户名称", "商户余额", "行业", "商户状态", "商户地址", "商户联系电话", "联系人姓名", "T0权限控制", "T1出账", "添加时间",
//				"备注" };
//		// 设置值
//		for (int i = 0; i < 12; i++) {
//			XSSFCell cell = xssfRow.createCell(i);
//			cell.setCellValue(strs[i]);
//			cell.setCellStyle(ztStyle);
//		}
//
//		int row = 3;
//		for (Merch merch : merchList) {
//			xssfRow = sheet.createRow(row);
//			// 设置值
//			xssfRow.createCell(0).setCellValue(merch.getMerchId());
//			xssfRow.createCell(1).setCellValue(merch.getMerchName());
////			for (AccountMerch accountMerch : accountMerchList) {
////				if (accountMerch.getAccountNo().equals("AM_" + merch.getMerchId())) {
////					xssfRow.createCell(2).setCellValue(accountMerch.getBalance().toString());
////				}
////			}
//			xssfRow.createCell(3).setCellValue(merch.getBusiness());
//			xssfRow.createCell(4).setCellValue(merch.getMerchStatus() == "0" ? "禁用" : "启用");
//			xssfRow.createCell(5).setCellValue(merch.getMerchAddr());
//			xssfRow.createCell(6).setCellValue(merch.getMerchTel());
//			xssfRow.createCell(7).setCellValue(merch.getLinkName());
//			String isT0 = merch.getT0Contorl();
//			if (isT0 != null && isT0.equals("1")) {
//				xssfRow.createCell(8).setCellValue("T0");
//			} else if (isT0 != null && isT0.equals("1")) {
//				xssfRow.createCell(8).setCellValue("钱包");
//			} else {
//				xssfRow.createCell(8).setCellValue("非T0");
//			}
//			String isT1 = merch.getIsT1YECZ();
//			if (isT1 != null && isT1.equals("1")) {
//				xssfRow.createCell(9).setCellValue("是");
//			} else {
//				xssfRow.createCell(9).setCellValue("否");
//			}
//			xssfRow.createCell(10).setCellValue(merch.getAddTime() == null ? ""
//					: merch.getAddTime().toString().substring(0, merch.getAddTime().toString().length() - 2));
//			xssfRow.createCell(11).setCellValue(merch.getRemark() == null ? "" : merch.getRemark().toString());
//			row++;
//		}
//		File readPath = new File(filePath);
//		if (!readPath.getParentFile().exists()) {
//			readPath.getParentFile().mkdirs();
//		}
//		FileOutputStream os = new FileOutputStream(filePath);
//		wb.write(os);
//		os.close();
//		wb.close();
//		renderFile(readPath);
//	}
}
