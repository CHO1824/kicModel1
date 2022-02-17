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
1) upload 폴더를 만든다 (/upload)
<%
String path = application.getRealPath("/")+"upload/";
String filename = null;

MultipartRequest  multi = new MultipartRequest(request, path, 10*1024*1024, "utf-8" );
filename=multi.getFilesystemName("picture"); //upload 폴더에 저장한다.
%>
<script>
const img = opener.document.getElementById("pic") //memberUpdate에 있는 id인 pic
/* 이미지를 보여주는 것 */
img.src="<%=request.getContextPath()%>/upload/<%=filename%>" 
//f의 name의 있는 pricture와 value를 지정
opener.document.f.picture.value="<%=filename%>" 
self.close();

</script>

</body>
</html>