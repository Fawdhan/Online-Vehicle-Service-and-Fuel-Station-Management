package OnlineVehicleServicePackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fuel_id = request.getParameter("fuel_id");

		if (fuel_id == null || fuel_id.isEmpty()) {

			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Fuel ID is missing or invalid.");
			return;
		}

		boolean isTrue;
		isTrue = FuelController.deletedata(fuel_id);

		if (isTrue) {

			String alertMessage = "Data Delete Successful";
			response.getWriter()
					.println("<script>alert('" + alertMessage + "');window.location.href='GetAllServlet';</script>");
		} else {

			List<FuelModel> fueldetails = FuelController.getById(fuel_id);
			request.setAttribute("fueldetails", fueldetails);

			RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
			dispatcher.forward(request, response);
		}
	}

}
