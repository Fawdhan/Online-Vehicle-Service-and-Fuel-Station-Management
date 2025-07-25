package addreservationpacakage;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/InsertReservationServlet")
public class InsertReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String customerName = request.getParameter("customerName");
        String vehicleNumber = request.getParameter("vehicleNumber");
        String serviceType = request.getParameter("serviceType");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        
        if (customerName == null || customerName.trim().isEmpty() ||
            vehicleNumber == null || vehicleNumber.trim().isEmpty()) {
            request.setAttribute("errorMsg", "Please fill in all required fields.");
            forwardBack(request, response);
            return;
        }

        
        if (!customerName.matches("^[A-Za-z ]+$")) {
            request.setAttribute("errorMsg", "Customer name must contain only letters and spaces.");
            forwardBack(request, response);
            return;
        }

        
        if (!vehicleNumber.matches("^[A-Z0-9]+$")) {
            request.setAttribute("errorMsg", "Vehicle number must use uppercase letters and numbers only.");
            forwardBack(request, response);
            return;
        }

        
        try {
            LocalDate selectedDate = LocalDate.parse(date);
            if (selectedDate.isBefore(LocalDate.now())) {
                request.setAttribute("errorMsg", "Reservation date cannot be in the past.");
                forwardBack(request, response);
                return;
            }
        } catch (Exception e) {
            request.setAttribute("errorMsg", "Invalid date format.");
            forwardBack(request, response);
            return;
        }

        
        try {
            LocalTime selectedTime = LocalTime.parse(time);
            if (selectedTime.isBefore(LocalTime.of(9, 0)) || selectedTime.isAfter(LocalTime.of(21, 0))) {
                request.setAttribute("errorMsg", "Time must be between 09:00 and 21:00.");
                forwardBack(request, response);
                return;
            }
        } catch (Exception e) {
            request.setAttribute("errorMsg", "Invalid time format.");
            forwardBack(request, response);
            return;
        }

        
        try {
            boolean isSuccess = ReservationController.insertData(customerName, vehicleNumber, serviceType, date, time);

            if (isSuccess) {
                request.getSession().setAttribute("message", "Reservation Successful!");
                response.sendRedirect("GetAllReservationsServlet");
            } else {
                request.setAttribute("errorMsg", "Reservation failed. Try again.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("reservationError.jsp");
                dispatcher.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Server Error: " + e.getMessage() + "</h3>");
        }
    }

    private void forwardBack(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("Insert.jsp");
        dispatcher.forward(request, response);
    }
}