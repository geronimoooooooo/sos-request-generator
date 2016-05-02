package jquery;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class Dropdown
 */
@WebServlet({ "/Dropdown", "/dropdown" })
public class Dropdown extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dropdown() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		String [] stray = request.getParameterValues("sportsName");
		System.out.println(request.getParameterValues("sportsName"));
		String sportsName = request.getParameter("sportsName");
        List<String> list = new ArrayList<String>();
        String json = null;
System.out.println("sportsName"+sportsName);

        if (sportsName.equals("Blaueis")) {
                list.add("Temperatur");
                list.add("Niederschlag");
                list.add("Windgeschwindigkeit");
        } else if (sportsName.equals("Godzilla")) {
                list.add("Size");
                list.add("Atomic Breath");
                list.add("Ghidorah");
                list.add("Mothra");
        } else if (sportsName.equals("Select Sports")) {
                list.add("Select Player");
        }

        json = new Gson().toJson(list);
        response.setContentType("application/json");
        response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
