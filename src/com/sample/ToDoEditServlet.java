package com.sample;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ToDoEditServlet
 */
@WebServlet("/edit")
public class ToDoEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToDoEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<ToDo> list = (List<ToDo>) session.getAttribute("list");

		// 編集ボタンを押してリクエストされたidを取得する
		int id = Integer.parseInt(request.getParameter("id"));

		// 編集用のインスタンス生成
		ToDo todo = new ToDo(id, null, null, null, false);

		for (ToDo t : list) {
			// セッションのToDoリストと編集リクエストされたidが等しかったら
			if (t.getId() == id) {
				// 編集用インスタンスに編集したいToDoのデータを入れる
				todo = t;
				// セッションにセットする
				session.setAttribute("todo", todo);
			}
		}

		RequestDispatcher rd = request.getRequestDispatcher("/edit.jsp");
		rd.forward(request, response);
		return;

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
