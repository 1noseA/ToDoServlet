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
		// 完了にしたタスクのidをリストに入れる
		// StreamAPIでString配列をint配列にする
		int[] finishArrays = Stream.of(ids).mapToInt(Integer::parseInt).toArray();

		// 完了にしたタスクがリストの何番目かを求め、
		// 完了フラグに1をセットしてlistのデータを更新
		for (int i = 0; i < list.size(); i++) {
			for(int j = 0; j < finishArrays.length; j++) {
				if (list.get(i).getId() == finishArrays[j]) {
					// 未完了だったら完了にし、完了だったら未完了に戻す
					// 三項演算子うまくいかなかった
					if (list.get(i).getFinished() == "0") {
						list.get(i).setFinished("1");
					} else {
						list.get(i).setFinished("0");
					}
				}
			}
		}

		session.setAttribute("list", list);

		RequestDispatcher rd = request.getRequestDispatcher("/finished.jsp");
		rd.forward(request, response);
		return;
	}

}
