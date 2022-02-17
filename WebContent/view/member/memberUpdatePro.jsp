<%@page import="model.Member"%>
<%@page import="service.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int num = 0;
String msg = "비밀번호가 틀립니다. 확인 후 다시 입력해주세요";
String url = request.getContextPath() + "/view/member/memberUpdate.jsp";

String login = (String) session.getAttribute("memberId");
//login이 불가능 하다면 
if(login == null || login.trim().equals("")){
%>
<script>
alert("로그인이 필요합니다.")
location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp";
</script>

<% } else {

String email = request.getParameter("email");
String tel = request.getParameter("tel");
String pass = request.getParameter("pass");
String picture = request.getParameter("picture");

MemberDao md = new MemberDao();
//MemberDao에서 selectOne는 맴버의 자료를 가져온다.
Member mem = md.selectOne(login);

//member에 email, tel을 저장한다.
mem.setEmail(email);
mem.setTel(tel);
mem.setPicture(picture);

System.out.println(mem); //수정된 이미지 이름을 저장한다.


if(mem.getPass().equals(pass)){ //맞지 않으면 끝내야한다.
	
	num = md.memberUpdate(mem); //MemberDao에 있는 mem
	msg = "회원정보가 수정 되었습니다"; 
	url = request.getContextPath() + "/view/main.jsp";
}
}
%> 
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>

</body>
</html>