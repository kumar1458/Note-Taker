package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helpher.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try 
		{
			response.setContentType("text/html");
			String title=request.getParameter("title");
			System.out.println(title);
			String content=request.getParameter("content");
			System.out.println(content);

			int noteId=Integer.parseInt(request.getParameter("noteId").trim());
			System.out.println(noteId);
			Session session=FactoryProvider.getFactory().openSession();
			Transaction transaction=session.beginTransaction();
			
			
			Note note=(Note)session.get(Note.class,noteId);
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			
			
			transaction.commit();
			session.close();
			response.sendRedirect("all_notes.jsp");
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			
		}
	}

}
