package como.servelet;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.types.ObjectId;

import como.servelet.dao.JugueteDAO;
import como.servelet.dao.Util;
import como.servelet.model.Juguete;

/**
 * Servlet implementation class JugueteServlet
 */
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





@WebServlet("/")
public class JugueteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private JugueteDAO jugueteDAO;

    public void init() {
        jugueteDAO = new JugueteDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertJuguete(request, response);
                    break;
                case "/delete":
                    deleteJuguete(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateJuguete(request, response);
                    break;
                case "/RegisterUser":
                	//System.out.println("registra usuario");
                    insertUsuario(request, response);
                    break;
                default:
                    listJuguete(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listJuguete(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List < Juguete > listJuguete = jugueteDAO.selectAllJuguetes();
        request.setAttribute("listJuguete", listJuguete);
        RequestDispatcher dispatcher = request.getRequestDispatcher("juguete-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("juguete-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        String id = request.getParameter("id");
        Juguete existingJuguete = jugueteDAO.selectJuguete(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("juguete-form.jsp");
        request.setAttribute("juguete", existingJuguete);
        dispatcher.forward(request, response);

    }
    private void insertUsuario(HttpServletRequest req, HttpServletResponse resp)
    		throws IOException, ServletException{
    	    	
    	 // Reading post parameters from the request
        String param1 = req.getParameter("login_id"), 
                param2 = req.getParameter("login_pwd");
 
        // Checking for null and empty values
        if(param1 == null || param2 == null || "".equals(param1) || "".equals(param2)) {
            req.setAttribute("error_message", "Please enter login id and password");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        } else {
            boolean isUserFound = Util.insertUserInDb(param1, param2);
            if(isUserFound) {               
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
                req.setAttribute("error_message", "Usuario Registrado Correctamente");
            } else {
                req.setAttribute("error_message", "No se pudo registrar el usuario.");
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
            }   
        }       
   }
    
    private void insertJuguete(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
    	
        String nombre = request.getParameter("nombre");
        ByteBuffer buffer = StandardCharsets.UTF_8.encode(nombre); 
        nombre= StandardCharsets.UTF_8.decode(buffer).toString();
        
        
        String descripcion = request.getParameter("descripcion");
        String piezas = request.getParameter("piezas");
        int precio = Integer.parseInt(request.getParameter("precio"));
       
        System.out.println(nombre);
        
        Juguete newJuguete = new Juguete("",nombre, piezas, descripcion, precio);
        jugueteDAO.insertJuguete(newJuguete);
        response.sendRedirect("list");
    }

    private void updateJuguete(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String piezas = request.getParameter("piezas");
        int precio = Integer.parseInt(request.getParameter("precio"));

        Juguete book = new Juguete(id,nombre, piezas, descripcion, precio);
        jugueteDAO.updateJuguete(book);
        response.sendRedirect("list");
    }

    private void deleteJuguete(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        String id = request.getParameter("id");
        jugueteDAO.deleteJuguete(id);
        response.sendRedirect("list");

    }
}