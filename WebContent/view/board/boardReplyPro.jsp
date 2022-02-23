<%@page import="model.Board"%>
<%@page import="service.BoardDao"%>
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
request.setCharacterEncoding("utf-8");
BoardDao bd = new BoardDao();
Board board = new Board();

board.setWriter(request.getParameter("writer"));
board.setPass(request.getParameter("pass"));
board.setSubject(request.getParameter("subject"));
board.setContent(request.getParameter("content"));
board.setFile1("");

board.setIp(request.getLocalAddr());

String boardid = (String) session.getAttribute("boardid");
if(boardid==null) boardid = "1";
board.setBoardid(boardid);

//boardReplyForm.jsp에 있는 num, ref, reflevel, refstep이다.
int num = Integer.parseInt(request.getParameter("num"));
int ref = Integer.parseInt(request.getParameter("ref"));
int reflevel = Integer.parseInt(request.getParameter("reflevel"));
int refstep = Integer.parseInt(request.getParameter("refstep"));

String msg = "답변 등록 시 오류 발생";
String url = "boardReplyForm.jsp?num=" +num;

bd.refStepAdd(ref,refstep); 

board.setNum(bd.nextNum());
board.setRef(ref); //새글 ref

board.setReflevel(reflevel+1); //기준글 reflevel+1
board.setRefstep(refstep+1); //print 순서

if(bd.insertBoard(board)>0){
	msg="답변 등록 완료";
	url = "list.jsp";
};

%>
<script>
alert('<%=msg%>')
location.href='<%=url%>'
</script>
</body>
</html>