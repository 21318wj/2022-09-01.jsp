<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="layout/db_connect.jsp" %>

<%
String sql="select custno, custname, phone, address, "
		+ " to_char(joindate, 'yyyy-mm-dd') joindate,"
		+ " grade, city from member_tbl_02 "
		+ " where custno = "+request.getParameter("custno");

Statement pstmt = conn.createStatement();
ResultSet rs = pstmt.executeQuery(sql);

rs.next();

int num = rs.getInt(1);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/style.css?1011">
	
	<script type="text/javascript">
		function checkValue() {
			var cv = document.data;
			
			if(!cv.custname.value){
				alert("회원성명을 입력하세요.");
				cv.custname.focus();
				return false;
			} else if(!cv.phone.value){
				alert("전화번호를 입력하세요.");
				cv.phone.focus();
				return false;
			} else if(!cv.address.value){
				alert("주소를 입력하세요.");
				cv.address.focus();
				return false;
			} else if(!cv.joindate.value){
				alert("가입일자를 입력하세요.");
				cv.joindate.focus();
				return false;
			} else if(!cv.grade.value){
				alert("고객등급을 입력하세요.");
				cv.grade.focus();
				return false;
			} else if(!cv.city.value){
				alert("도시코드를 입력하세요.");
				cv.city.focus();
				return false;
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
	
	<main id="section">
		<h2 class="title">홈쇼핑 회원 정보 수정</h2>		
		<form name="data" action="update_p.jsp" method="post" onsubmit="return checkValue()">
		<table class="table_line">
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name = "custno" size="10" readonly value="<%= num %>"></td>
			</tr>
			
			<tr>
				<th>회원성명</th>
				<td><input type="text" name = "custname" size="10" value="<%= rs.getString("custname") %>"></td>
			</tr>
			
			<tr>
				<th>회원전화</th>
				<td><input type="text" name = "phone" size="12" value="<%= rs.getString("phone") %>"></td>
			</tr>
			
			<tr>
				<th>회원주소</th>
				<td><input type="text" name = "address" size="20" value="<%= rs.getString("address") %>"></td>
			</tr>
			
			<tr>
				<th>가입일자</th>
				<td><input type="text" name = "joindate" size="10" value="<%= rs.getString("joindate") %>"></td>
			</tr>
			
			<tr>
				<th>고객등급[A:VIP,B:일반,C:직원]</th>
				<td><input type="text" name = "grade" size="10" value="<%= rs.getString("grade") %>"></td>
			</tr>
			
			<tr>
				<th>도시코드</th>
				<td><input type="text" name = "city" size="10" value="<%= rs.getString("city") %>"></td>
			</tr>
			
			<tr align="center">
				<td colspan="2"><input type="submit" name = "join" value="수정">
				<input type="button"  value = "조회" onclick="location.href='member_list.jsp'">
				<input type = "button" value = "삭제" 
				onclick="document.location.href='delete.jsp?custno=<%= rs.getString("custno")%>'">
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