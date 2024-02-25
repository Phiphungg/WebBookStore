package controllerUser;

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
import model.Book;
import model.Cart;
import model.Category;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.Status;
import model.User;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/user-controller")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
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
		if (action.equals("add-cart-servlet")) {
			addCart(request, response);
		} else if (action.equals("checkout")) {
			checkout(request, response);
		} else if (action.equals("order-detail")) {
			orderDetail(request, response);
		} else if (action.equals("order-list")) {
			orderList(request, response);
		} else if (action.equals("process")) {
			process(request, response);
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

	private void addCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		Cart cart = null;
		Object object = session.getAttribute("cart");

		// neu co roi
		if (object != null) {
			cart = (Cart) object;
		} else {
			cart = new Cart();
		}

		String bookID = request.getParameter("bookID");
		String numString = request.getParameter("num");
		int id, num;
		try {
			id = Integer.parseInt(bookID);
			num = Integer.parseInt(numString);

			HomeDAO homeDAO = new HomeDAO();
			Book book = homeDAO.getBookByID(id);
			double price = book.getPrice() * 1.2;

			Item item = new Item(book, num, price);
			cart.addItem(item);
		} catch (Exception e) {
			num = 1;
		}

		HomeDAO bookDAO = new HomeDAO();
		List<Book> listB = bookDAO.getAllBook();
		request.setAttribute("listBook", listB);

		List<Category> listC = bookDAO.getAllCategory();
		request.setAttribute("listCate", listC);

		List<Status> listS = bookDAO.getAllStatus();
		request.setAttribute("listStt", listS);

		List<Item> list = cart.getItems();
		session.setAttribute("cart", cart);
		session.setAttribute("size", list.size());
		request.getRequestDispatcher("homePage/home.jsp").forward(request, response);
	}

	private void checkout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		Cart cart = null;
		Object cObject = session.getAttribute("cart");

		if (cObject != null) {
			cart = (Cart) cObject;
		} else {
			cart = new Cart();
		}

		User user = null;
		Object uObject = session.getAttribute("user");
		if (uObject != null) {
			user = (User) uObject;
			OrderDAO orderDAO = new OrderDAO();
			orderDAO.addOrder(user, cart);
			session.removeAttribute("cart");
			session.setAttribute("size", 0);
			response.sendRedirect("home-servlet");
		} else {
			response.sendRedirect("homePage/login.jsp");
		}
	}

	private void orderDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String orderID = request.getParameter("orderID");
		OrderDAO orderDAO = new OrderDAO();

//		List<Order> listP = orderDAO.getAllOrderByID(user.getUserID());
		List<OrderDetail> listO = orderDAO.getAllOrderDetailByID(orderID);
		List<Order> listD = orderDAO.getAllOrderByID(orderID);
		request.setAttribute("listOrderDetail", listO);
		request.setAttribute("listOrder", listD);
//		request.setAttribute("listDetail", listP);

		request.getRequestDispatcher("otherPage/orderDetail.jsp").forward(request, response);
	}

	private void orderList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");

		OrderDAO orderDAO = new OrderDAO();

		List<Order> listD = orderDAO.getAllOrderByID(user.getUserID());
		request.setAttribute("listDetail", listD);

		request.getRequestDispatcher("otherPage/orderList.jsp").forward(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		Cart cart = null;
		Object object = session.getAttribute("cart");

		if (object != null) {
			cart = (Cart) object;
		} else {
			cart = new Cart();
		}

		String tnum = request.getParameter("num").trim();
		String tbookID = request.getParameter("bookID");
		int num, bookID;
		try {
			num = Integer.parseInt(tnum);
			bookID = Integer.parseInt(tbookID);
			HomeDAO homeDAO = new HomeDAO();
			Book book = homeDAO.getBookByID(bookID);
			int quantityStore = book.getQuantity();

			if (num == -1 && (cart.getQuantityByID(bookID) <= 1)) {
				cart.removeItem(bookID);
			} else {
				if (num == 1 && cart.getQuantityByID(bookID) >= quantityStore) {
					num = 0;
				}
				book = homeDAO.getBookByID(bookID);
				double price = book.getPrice();
				Item item = new Item(book, num, price);
				cart.addItem(item);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		List<Item> list = cart.getItems();

		session.setAttribute("cart", cart);
		session.setAttribute("size", list.size());
		request.getRequestDispatcher("otherPage/addToCart.jsp").forward(request, response);
	}
}
