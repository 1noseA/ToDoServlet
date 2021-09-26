package com.sample;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ToDoServlet
 */
@WebServlet("/ToDo")
public class ToDoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToDoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<ToDo> list = (List<ToDo>) session.getAttribute("list");

		// 初回は空なので
		if (list == null) {
			list = new ArrayList<>();
		}

		// idがかぶらないように改造
		// Integerとするとnullを許容できる
		Integer id = (Integer)session.getAttribute("id");
		if(id == null) {
			id = 0;
		}

		String task = request.getParameter("task");
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		Date deadline = null;
		try {
			deadline = format.parse(request.getParameter("deadline"));
		} catch (ParseException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		String member = request.getParameter("member");
		String finished = "0";
		ToDo todo = new ToDo(id + 1, task, deadline, member, finished);

		list.add(todo);
		session.setAttribute("list", list);
		session.setAttribute("id", id + 1);

		RequestDispatcher rd = request.getRequestDispatcher("/todo.jsp");
		rd.forward(request, response);
		return;

	}

}
