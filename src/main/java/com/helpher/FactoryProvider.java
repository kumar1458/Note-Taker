package com.helpher;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	public static SessionFactory factory;
	
	public static SessionFactory getFactory()
	{
		
		
		if(factory==null)
		{
			factory=new Configuration().configure("com/helpher/hibernate.cfg.xml").buildSessionFactory();
			System.out.println(factory);
		}
		return factory;
	}

	public void closeFactory()
	{
		if(factory.isOpen())
		{
			factory.close();
		}
	}
}
