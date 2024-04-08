<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
  <%@include file="all_js_css.jsp" %>

</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Please fill your note details</h1>
		<br>

		<!--This is add notes page  -->
		<form action="Save" method="post">
			<div class="form-group">
				<label for="title">Note title</label> 
				<input
					type="text"
					name="title" 
					class="form-control" 
					id="title"
					required
					aria-describedby="emailHelp" 
					placeholder="Enter here"/>
			</div>
			
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea 
				required="required" 
				name="content"
				id="content" 
				placeholder="ENTER YOUR CONTENT HERE" 
				class="form-control" 
				style="height:300px;"
				></textarea>
				
			</div>
			
			<div class="container text-center">
				
				<button type="submit" class="btn btn-primary">Add</button>
				
			</div>
		</form>
	</div>

</body>
</html>