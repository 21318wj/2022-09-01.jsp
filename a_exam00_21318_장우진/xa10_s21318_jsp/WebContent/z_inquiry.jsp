<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="layout/db_connect.jsp" %>

<%
String sql="select custno, custname, phone, address, "
		+  " to_char(joindate, 'yyyy-mm-dd') joindate, grade, city "
		+  " from member_tbl_02"
		+  " where custno = "+request.getParameter("custno");
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/style.css?1010">
	
</head>
<body>
	<header>
	<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<main id="section">
		<h2 class="title">회원등록</h2>		
		<form name="data" action="join_p.jsp" method="post" onsubmit="return checkValue()">
		<table class="table_line">
		<%
			if(rs.next()) {
		%>
			<tr>
				<th>회원번호</th>
				<td><%= rs.getString("custno") %></td>
			</tr>

			<tr>
				<th>회원성명</th>
				<td><%= rs.getString("custname") %></td>	
			</tr>
				
			<tr>
				<th>회원전화</th>
				<td><%= rs.getString("phone") %></td>
				
			<tr>
				<th>회원주소</th>
				<td><%= rs.getString("address") %></td>
			</tr>
				
			<tr>
				<th>가입일자</th>
				<td><%= rs.getString("joindate") %></td>
			</tr>
			
			<tr>
				<th>고객등급[A:VIP,B:일반,C:직원]</th>
				<td><%= rs.getString("grade") %></td>
			</tr>
			
			<tr>
				<th>도시코드</th>
				<td><%= rs.getString("city") %></td>
			</tr>
			<%} else {%>
				<tr>
				   <th>회원번호</th>
				   <td><%= request.getParameter("custno") %> 등록된 자료가 없습니다</td>
				</tr>
			<%}  %>
				<tr>
					<td colspan="2" align="center">
						<input type="button" name="serch" value="취소 후 다시 조회"
											 onclick="parent.location.href='z_input.jsp'">
						<input type="button" name="serch" value="회원목록조회/수정"
											 onclick="parent.location.href='member_list.jsp'">	
					</td>
				</tr>	
		</table>
		</form>
	
	</main>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>	
</body>
</html>