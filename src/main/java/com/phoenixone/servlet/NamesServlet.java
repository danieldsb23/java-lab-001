package com.phoenixone.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.phoenixone.bean.NameListManagerBean;

@WebServlet("/names")
public class NamesServlet extends HttpServlet {

	private static final long serialVersionUID = -2608989183474656963L;
	
	private static final String ADD_NAME = "add-name";
	private static final String REMOVE_NAME = "remove-name";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String action = request.getParameter("action");
		final String name = request.getParameter("name");
		
		HttpSession session = request.getSession(true);
		NameListManagerBean nameListManagerBean = (NameListManagerBean) session.getAttribute("namesManager");
		if(nameListManagerBean == null) {
			nameListManagerBean = new NameListManagerBean();
		}
		
		if(ADD_NAME.equals(action)) {
			nameListManagerBean.add(name);
		} else if(REMOVE_NAME.equals(action)) {
			nameListManagerBean.remove(name);
		}
		
		session.setAttribute("namesManager", nameListManagerBean);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/names.jsp");
		dispatcher.forward(request, response);
	}
	
}
