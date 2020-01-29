package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DatabaseHandler;
import database.Result;

@WebServlet("/InterviewServlet")
public class InterviewServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private DatabaseHandler handler;
	
	public InterviewServlet() {
		handler = new DatabaseHandler();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse res) {
		ServletContext sct = getServletContext();
		
		HttpSession session = request.getSession();
		
		Result result = handler.exec("QUERY_DATA", new Properties());
		
		if(result.getResult()) {
			Properties prop = result.getProperties();
			
			String customerNumbers = prop.getProperty("customerNumbers");
			String customerNames = prop.getProperty("customerNames");
			String amountsDue = prop.getProperty("amountsDue");
			
			String[] numsArr = customerNumbers.split(":");
			String[] namesArr = customerNames.split(":");
			String[] amountsDueArr = amountsDue.split(":");
			
			ArrayList<Customer> customers = new ArrayList<Customer>();
			
			for(int i = 0; i < numsArr.length; i++) {
				Customer c = new Customer(numsArr[i], namesArr[i], amountsDueArr[i]);
				
				customers.add(c);
			}
			
			request.setAttribute("customers", customers);
			request.setAttribute("customerNames", customerNames);
			request.setAttribute("amountsDue", amountsDue);
		}
		
		sendToScreen(sct, request, res, "/jsp/customerlist.ftl");
	}
	
	private void sendToScreen(ServletContext sct, HttpServletRequest request, HttpServletResponse res, String screen) {
		RequestDispatcher dispatcher = sct.getRequestDispatcher(screen);
		
		try {
			dispatcher.forward(request, res);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
