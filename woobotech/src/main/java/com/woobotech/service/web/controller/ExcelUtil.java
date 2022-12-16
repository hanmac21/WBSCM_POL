package com.woobotech.service.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

public class ExcelUtil {
	
	public static Workbook getWorkbook(MultipartFile file) throws IOException {
		
		String extension = FilenameUtils.getExtension(file.getOriginalFilename());
		
		//파일이 엑셀 파일인지 판별
		if(!extension.equals("xlsx")&&!extension.equals("xls")) {
			throw new IOException("Only excel file allowed.");
		}
		
		Workbook workbook = null;
		
		//파일 확장자에 따라 초기화
		if(extension.equals("xlsx")) {
			workbook = new XSSFWorkbook(file.getInputStream());
		}else if(extension.equals("xls")) {
			workbook = new HSSFWorkbook(file.getInputStream());
		}
		
		return workbook;
	}
	
	//Cell name을 가져온다.
	public static String getName(Cell cell, int cellIndex) {
		
		int cellNum=0;
		if(cell != null) {
			cellNum = cell.getColumnIndex();
		}else {
			cellNum = cellIndex;
		}
		
		return CellReference.convertNumToColString(cellNum);
	}
	
	@SuppressWarnings("deprecation")
	public static String getValue(Cell cell) {
		
		String value = "";
		
		if(cell==null) {
			value="";
		}else {
			switch(cell.getCellType()) {
				case FORMULA :
					value = cell.getCellFormula();
					break;
				case NUMERIC :
					value = cell.getNumericCellValue() + "";
					break;
				case STRING : 
					value = cell.getStringCellValue();
					break;
				case BOOLEAN :
					value = cell.getBooleanCellValue() + "";
					break;
				case ERROR :
					value = cell.getErrorCellValue() + "";
					break;
				case BLANK : 
					value ="";
					break;
				default : 
					value = cell.getStringCellValue();
			}
		}
		
		return value;
	}
	
	//엑셀 파일 내용 읽기.
	public static List<Map<String, String>> excelRead(MultipartFile file) throws IOException{
		
		Workbook wb = getWorkbook(file);
		
		Sheet sheet = wb.getSheetAt(0);
		
		int numOfRows = sheet.getPhysicalNumberOfRows();
		int numOfCells = 0;
		
		Row row = null;
		Cell cell = null;
		
		String cellName = "";
		
		Map<String, String> map = null;
		
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		
		for(int rowIndex=0;rowIndex<numOfRows;rowIndex++) {
			row = sheet.getRow(rowIndex);
			
			if(row != null) {
				numOfCells = row.getLastCellNum();
				
				map = new HashMap<String, String>();
				
				for(int cellIndex=0;cellIndex<numOfCells;cellIndex++) {
					cell = row.getCell(cellIndex);
					cellName = getName(cell,cellIndex);
				
					map.put(cellName, getValue(cell));
				}
				
				map.put("rowNum", String.valueOf(rowIndex+1));
				
				result.add(map);
				
			}
			
		}
		
		return result;
	}

}
