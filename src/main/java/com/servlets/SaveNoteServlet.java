package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helpher.FactoryProvider;
import com.entities.*;

public class SaveNoteServlet extends HttpServlet {
       
  
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		try {
			response.setContentType("text/html");
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			Note note=new Note(title,content,new Date());
			//hibernate:save
			Session s=FactoryProvider.getFactory().openSession();
			Transaction transaction=s.beginTransaction();
			
			s.save(note);
			transaction.commit();
			s.close();
			PrintWriter pw=response.getWriter();
			
			pw.println("<h1 style='text-align:center'>Note is added Successfully</h1>");
			pw.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>Viewallnotes</a></h1>");
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}

	}

}
