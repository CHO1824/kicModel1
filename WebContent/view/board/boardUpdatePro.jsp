<%@page import="service.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String path = application.getRealPath("/")+"/boardupload/";
int size=10*1024*1024; //스타일
MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8"); //*

Board board = new Board();
board.setNum(Integer.parseInt(multi.getParameter("num")));
board.setWriter(multi.getParameter("writer"));
board.setPass(multi.getParameter("pass"));
board.setSubject(multi.getParameter("subject"));
board.setContent(multi.getParameter("content"));
board.setFile1(multi.getFilesystemName("file1"));

BoardDao bd = new BoardDao();

//파일 수정 시 수정이 발생하지 않을 경우
if(board.getFile1()==null || board.getFile1().equals("")){
	board.setFile1(multi.getParameter("file2")); //file2를 찍기
}
Board dbboard = bd.boardOne(board.getNum());

String msg = "비밀번호가 틀렸습니다";
String url = "boardUpdateForm.jsp?num="+board.getNum();

//비밀번호 확인하기
if(board.getPass().equals(dbboard.getPass())){ 
	//수정하기
	if (bd.boardUpdate(board) > 0){ 
		msg ="수정완료";
		url = "boardInfo.jsp?num="+board.getNum();
	}else{
		msg = "수정실패";
	}
}

%>
<script>
alert('<%=msg%>')
location.href='<%=url%>'
</script>
</body>
</html>