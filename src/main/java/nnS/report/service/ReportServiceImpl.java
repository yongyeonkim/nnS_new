package nnS.report.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import nnS.common.util.FileUtils;
import nnS.report.dao.ReportDAO;

@Service("reportService")
public class ReportServiceImpl implements ReportService {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reportDAO")
	private ReportDAO reportDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<Map<String, Object>> selectReportList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reportDAO.selectReportList(map);
	}
	@Override
	public void insertReportBoard(Map<String, Object> map, HttpServletRequest request) throws Exception{
		// TODO Auto-generated method stub
		reportDAO.insertReportBoard(map);
		map.put("IDX", map.get("REPORT_NUM"));
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request); 
		for(int i=0, size=list.size(); i<size; i++){ reportDAO.insertFile(list.get(i));
		} 
	}



	@Override
	public Map<String, Object> selectReportDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		reportDAO.updateReportCount(map);//조회수가 있었나?
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = reportDAO.selectReportDetail(map);
		resultMap.put("map",tempMap);
		
		List<Map<String,Object>> list = reportDAO.selectFileList(map); 
		resultMap.put("list", list);
		
		return resultMap;
	}
	@Override
	public void deleteReport(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		reportDAO.deleteReport(map);
		
	}
	
}
