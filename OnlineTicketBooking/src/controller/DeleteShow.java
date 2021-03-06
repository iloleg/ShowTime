package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daou.ShowDaou;

@WebServlet("/DeleteShow")
public class DeleteShow extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteShow() {
        super();
    }
    PrintWriter out = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		out = response.getWriter();
		ShowDaou d = new ShowDaou();
		if (d.deleteById(request.getParameter("show_id")) != 0)
			out.print("Deleted");
		else out.print("Error 404");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
