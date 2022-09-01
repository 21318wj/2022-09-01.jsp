<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="layout/db_connect.jsp" %>

<%
String sql="select a.custno, a.custname, "
		+"decode(a.grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade, "
		+"sum(b.price) price "
		+"from member_tbl_02 a, money_tbl_02 b "
		+"where a.custno = b.custno "
		+"group by a.custno, a.custname, a.grade "
		+"order by sum(b.price) desc";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css?1010">
	
	<script type="text/javascript">
		function checkDel(custno){
			msg="삭제하시겠습니까?";
			if(confirm(msg)!=0){
				location.href="delete.jsp?custno="+custno;
				alert("삭제되었습니다.")
			} else {
				alert("삭제가 취소되었습니다.")
				return;
			}
		}
	</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<main id = "section">
		<h3 class="title">회원매출조회</h3>		
		<table class="table_line">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>			
			</tr>
			<% while(rs.next()) { %>	
			<tr align="center">
				<td><%= rs.getString("custno") %></td>     
				<td><%= rs.getString("custname") %></td>
				<td><%= rs.getString("grade") %></td>
				<td><%= rs.getString("price") %></td>
			<% } %>	     
			</tr>			
		</table>
	</main>		
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>