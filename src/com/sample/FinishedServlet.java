package com.sample;

import java.io.IOException;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FinishedServlet
 */
@WebServlet("/finished")
public class FinishedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinishedServlet() {
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

		String[] ids = request.getParameterValues("finished");

		// もしチェックなしで完了ボタンが押されたら何もしないで戻す
		RequestDispatcher rd;
		if (ids == null || ids.length == 0) {
			rd = request.getRequestDispatcher("/todo.jsp");
			rd.forward(request, response);
			return;
		}

		// 完了にしたタスクのidをリストに入れる
		// StreamAPIでString配列をint配列にする
		int[] finishArrays = Stream.of(ids).mapToInt(Integer::parseInt).toArray();

		// 画面遷移のための完了フラグ
		boolean isDone = false;
		// 完了にしたタスクがリストの何番目かを求め、
		// 完了済みに1をセットしてlistのデータを更新
		for (int i = 0; i < list.size(); i++) {
			for(int j = 0; j < finishArrays.length; j++) {
				if (list.get(i).getId() == finishArrays[j]) {
					// 未完了だったら完了にし、完了だったら未完了に戻す
					// 三項演算子うまくいかなかった
					if (list.get(i).getFinished() == "0") {
						list.get(i).setFinished("1");
						isDone = true;
					} else {
						list.get(i).setFinished("0");
					}
				}
			}
		}

		session.setAttribute("list", list);

		// 未完了→完了だったら完了リストへ遷移（isDoneがtrue）
		if (isDone) {
			rd = request.getRequestDispatcher("/finished.jsp");
		} else {
			// 完了→未完了だったらToDoリストへ遷移
			rd = request.getRequestDispatcher("/todo.jsp");
		}
		rd.forward(request, response);
		return;
	}
}
