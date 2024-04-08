<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helpher.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All notes:Note Taker</title>
  <%@include file="all_js_css.jsp" %>

</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes</h1>

		<div class="row">


			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				for (Note note : list) {
				%>
				<div class="card mt-3" >
					<img class="card-img-top m-4 mx-auto" style="max-width:100px" src="img/note.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%>></h5>
						<p class="card-text">
						<%=note.getContent()%>
						</p>
						<p class="text-primary"><br><%=new Date() %><br></p>
						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a> 
							<a href="edit.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Update</a>
						</div>

					</div>
				</div>

				<%
				}

				s.close();
				%>
			</div>
		</div>

	</div>
</body>
</html>