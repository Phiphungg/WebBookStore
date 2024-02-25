package controllerAdmin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HomeDAO;
import dao.OrderDAO;
import dao.UserDAO;
import model.Book;
import model.Category;
import model.Order;
import model.Status;
import model.User;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/admin-controller")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action.equals("add-book-servlet-admin")) {
			addBook(request, response);
		} else if (action.equals("delete-ad-servlet")) {
			deleteBook(request, response);
		} else if (action.equals("edit-book-servlet")) {
			editBook(request, response);
		} else if (action.equals("list-order")) {
			orderListBook(request, response);
		} else if (action.equals("list-user")) {
			userListBook(request, response);
		} else if (action.equals("load-product")) {
			loadBook(request, response);
		} else if (action.equals("manage-servlet")) {
			manage(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void addBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bookName = request.getParameter("bookname");
		String author = request.getParameter("author");
		Double price = Double.parseDouble(request.getParameter("price"));
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String image = request.getParameter("image");
		Integer quantity = Integer.parseInt(request.getParameter("quantity"));
		String category = request.getParameter("category");
		String status = request.getParameter("status");

		HomeDAO homeDAO = new HomeDAO();
//		Book book = new Book(bookName, author, price, title, description, image, category, status);

		Book book = homeDAO.checkBookName(bookName);
		HttpSession session = request.getSession();
		if (book != null) {
			session.setAttribute("msgAddError", "The book existed");
//			request.getRequestDispatcher("editAd.jsp").forward(request, response);
			response.sendRedirect("adminPage/NotiAddBook.jsp");
		} else {
			Book newBook = new Book(bookName, author, price, title, description, image, quantity, category, status);
			homeDAO.insertBook(newBook);
			session.setAttribute("msgAddOk", "");
			response.sendRedirect("http://localhost:8080/BookShop/admin-controller?action=manage-servlet");
		}
	}

	private void deleteBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bookId = request.getParameter("bookId");
		HomeDAO homeDAO = new HomeDAO();
		homeDAO.deleteBookByID(bookId);
		response.sendRedirect("http://localhost:8080/BookShop/admin-controller?action=manage-servlet");
	}

	private void editBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bookName = request.getParameter("bookname");
		String author = request.getParameter("author");
		Double price = Double.parseDouble(request.getParameter("price"));
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String image = request.getParameter("image");
		Integer quantity = Integer.parseInt(request.getParameter("quantity"));
		String category = request.getParameter("category");
		String status = request.getParameter("status");
		String bookID = request.getParameter("bookID");

		HomeDAO homeDAO = new HomeDAO();
		homeDAO.updateEditBook(bookName, author, price, title, description, image, quantity, category, status, bookID);
		response.sendRedirect("http://localhost:8080/BookShop/admin-controller?action=manage-servlet");
	}

	private void orderListBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OrderDAO orderDAO = new OrderDAO();
		List<Order> listO = orderDAO.getAllOrder();

		request.setAttribute("listOrder", listO);

		request.getRequestDispatcher("adminPage/listOrder.jsp").forward(request, response);
	}

	private void userListBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		List<User> listU = userDAO.getAllUser();

		request.setAttribute("listUser", listU);

		request.getRequestDispatcher("adminPage/listUser.jsp").forward(request, response);
	}

	private void loadBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bookId = request.getParameter("bookId");

		HomeDAO homeDAO = new HomeDAO();
		Book book = homeDAO.getBookByID(bookId);

		request.setAttribute("detail", book);
		request.getRequestDispatcher("adminPage/editBook.jsp").forward(request, response);
	}

	private void manage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HomeDAO homeDAO = new HomeDAO();
		List<Book> list = homeDAO.getAllBook();
		request.setAttribute("listBook", list);

		HttpSession session = request.getSession();

		List<Category> listC = homeDAO.getAllCategory();
		session.setAttribute("listCate", listC);

		List<Status> listS = homeDAO.getAllStatus();
		session.setAttribute("listStt", listS);

		request.getRequestDispatcher("adminPage/edit.jsp").forward(request, response);
	}

}
