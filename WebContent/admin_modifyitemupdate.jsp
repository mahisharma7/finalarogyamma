<%@page import="com.met.dao.DBConnect"%>
<link href="./CSS/cyber.css" rel="stylesheet">
<%@ page import="java.sql.*"%>
<%
	try {
		String table = request.getParameter("category").trim();
		String item = request.getParameter("name").trim();
		String desc = request.getParameter("description").trim();
		float price = Float.parseFloat(request.getParameter("cost"));
		if (session.getValue("login") == null)
			response.sendRedirect("cyber.jsp?invalid");

		Connection con = DBConnect.getMySqlConnection();
		Statement st = con.createStatement();
		ResultSet rs;

		String updateCatageory = "update product set PRODUCT_DESC='" + desc + "', PROD_PRICE=" + price
				+ " where PRODUCTNAME='" + item + "'";
		System.out.println("--------------" + updateCatageory);
		int result = st.executeUpdate(updateCatageory);
		if (result > 0)
			out.println("<center><h2><h2>The operation was completed successfully</h2>");
		else
			out.println("<center><h2><h2>The operation Failed To Update.No Such Table Exists</h2>");
	} catch (Exception e) {
		out.println("<center><h2>Failed To update Due to The Error <BR>" + e);
	}
%>
<center>
	<h4>
		<a href="javascript:history.back()">Continue</a>
	</h4>