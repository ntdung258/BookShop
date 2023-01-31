<%@page contentType="application/pdf" %>
<%@page trimDirectiveWhitespaces="true" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="net.sf.jasperreports.engine.data.JRBeanCollectionDataSource"%>
<%@page import="net.sf.jasperreports.engine.JRDataSource"%>
<%@page import="net.sf.jasperreports.charts.JRDataRange"%>
<% 
	try{
		List<Map<String ,?>> dataSource = (List<Map<String,?>>)request.getAttribute("listCategory");

		JRDataSource jrDataSource = new JRBeanCollectionDataSource(dataSource);
		String jrxmlFile = session.getServletContext().getRealPath("/report/categories.jrxml");
		InputStream input = new FileInputStream(new File(jrxmlFile));
		JasperReport jasperReport = JasperCompileManager.compileReport(input);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,null, jrDataSource);
		JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}catch(Exception e){
		e.printStackTrace();
	}

%>