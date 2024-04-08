<%@page import="com.entities.Note"%>
<%@page import="com.helpher.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <%@include file="all_js_css.jsp" %>

</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Edit Your Note</h1>
		<br>
		<%
		int noteId=Integer.parseInt(request.getParameter("note_id").trim());
		Session s=FactoryProvider.getFactory().openSession();
		Note note=(Note)s.get(Note.class,noteId);
		%>
		<form action="UpdateServlet" method="post">
			<input value="<%=note.getId()%>" name="noteId" type="hidden"/>
			
			<div class="form-group">
				<label for="title">Note title</label> 
				<input
					type="text"
					name="title" 
					class="form-control" 
					id="title"
					required
					aria-describedby="emailHelp" 
					placeholder="Enter here"
					value="<%=note.getTitle()%>"
					/>
			</div>
			
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea 
				required="required" 
				name="content"
				id="content" 
				placeholder="ENTER YOUR CONTENT HERE" 
				class="form-control" 
				style="height:300px;"><%=note.getContent()%>
				</textarea>
				
			</div>
			
			<div class="container text-center">
				
				<button type="submit" class="btn btn-success">Save Your Note</button>
				
			</div>
		</form>
	</div>
</body>
</html>