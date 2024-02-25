package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HomeDAO;
import dao.UserDAO;
import model.Book;
import model.Category;
import model.Status;
import model.User;
import until.encrypt;
import until.randomNumber;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/home-controller")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equals("register-servlet")) {
			Register(request, response);
		} else if (action.equals("logout-servlet")) {
			Logout(request, response);
		} else if (action.equals("login-servlet")) {
			Login(request, response);
		} else if (action.equals("change-password")) {
			changePassword(request, response);
		} else if (action.equals("change-info")) {
			changeInfo(request, response);
		} else if (action.equals("detail-servlet")) {
			detail(request, response);
		} else if (action.equals("cate-servlet")) {
			category(request, response);
		} else if (action.equals("search-servlet")) {
			search(request, response);
		} else if (action.equals("verification-servlet")) {
			verification(request, response);
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

	private void Register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("username");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String passwordRt = request.getParameter("passwordrt");
		String gender = request.getParameter("gender");
		String news = request.getParameter("news");

		request.setAttribute("userName", userName);
		request.setAttribute("birthday", birthday);
		request.setAttribute("email", email);
		request.setAttribute("gender", gender);
		request.setAttribute("news", news);

		if (!password.equals(passwordRt)) {
			request.setAttribute("msgError", "Your password did not match .<br/>");
//			request.getRequestDispatcher("register.jsp").forward(request, response);
			response.sendRedirect("homePage/register.jsp");
		} else {
			password = encrypt.toSHA1(password);
			UserDAO userDAO = new UserDAO();
			User sUser = userDAO.checkUserName(userName);

			if (sUser != null) {
				request.setAttribute("msgError", "Username already exists, please choose another username.<br/>");
				request.getRequestDispatcher("homePage/register.jsp").forward(request, response);

			} else {
//				User user = new User(0, userName, Date.valueOf(birthday), email, passwordRt, gender, news != null);
//				userDAO.insertUser(userName, Date.valueOf(birthday), email, password, gender, news != null);
//				User user = new User(userName, Date.valueOf(birthday), email, password, gender, news != null);
				User user = new User(userName, Date.valueOf(birthday), email, password, gender, news != null);

				if (userDAO.insertUser(user) > 0) {

					String ranNumber = randomNumber.getRandomNumber();

					// Quy dinh thoi gian hieu luc
					Date todayDate = new Date(new java.util.Date().getTime());
					Calendar c = Calendar.getInstance();
					c.setTime(todayDate);
					c.add(Calendar.DATE, 1);
					Date effectiveTime = new Date(c.getTimeInMillis());

					// trang thai xac thuc = false
					boolean authStatus = false;

					user.setVerifycationCode(ranNumber);
					user.setEffectiveTime(effectiveTime);
					user.setAuthenticationStatus(authStatus);

					if (userDAO.updateVetifyInformation(user) > 0) {
						User us = userDAO.selectUserID();

						System.out.println(us);

						until.email.sendEmail(us.getEmail(), getContent(us), "xác thực tài khoản tại OP");

					}
					request.setAttribute("msgOk", "Logged in successfully<br/>");
				}

				request.getRequestDispatcher("homePage/register.jsp").forward(request, response);
			}
		}
	}

	public static String getContent(User us) {
		String link = "http://localhost:8080/BookShop/home-controller?action=verification-servlet&userID="
				+ us.getUserID() + "&code=" + us.getVerifycationCode();
		String content = "<p>Hello, I'm OP here,</p>\r\n" + "<p>Thank you for registering an account at OP</p>\r\n"
				+ "<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" data-placeholder=\"Bản dịch\" data-ved=\"2ahUKEwit9c7ep6aEAxVQs1YBHXzIBnIQ3ewLegQIBRAU\"><span class=\"Y2IQFc\" lang=\"en\">Please verify your account by entering code <strong>"
				+ us.getVerifycationCode() + "</strong> or clicking the link below:<br /><a title=\"Test\" href=\""
				+ link + "\">Click here!</a><br /></span></pre>\r\n" + "<p>&nbsp;</p>";
		return content;
	}

	private void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		password = encrypt.toSHA1(password);

		request.setAttribute("userName", userName);

		User us = new User();
		us.setUserName(userName);
		us.setPassword(password);

		UserDAO userDAO = new UserDAO();
		User user = userDAO.selectByUsernameAndPassWord(us);

		if (user != null && user.isAuthenticationStatus()) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);

			request.getRequestDispatcher("home-servlet").forward(request, response);
		} else {
			request.setAttribute("msgError", "UserName or password was wrong!");
			request.getRequestDispatcher("homePage/login.jsp").forward(request, response);
		}
	}

	private void Logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		response.sendRedirect("home-servlet");
	}

	private void changePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String currentPw = request.getParameter("currentpw");
		String newPw = request.getParameter("newpw");
		String confirmPw = request.getParameter("confirmpw");

		String CurrentPassword_SHA = encrypt.toSHA1(currentPw);

		HttpSession session = request.getSession();
		Object object = session.getAttribute("user");
		User user = null;

		if (object != null) {
			user = (User) object;
		}

		if (user == null) {
			response.sendRedirect("homePage/login.jsp");
		} else {
			if (!CurrentPassword_SHA.equals(user.getPassword())) {
				request.setAttribute("msgError", "Your password was wrong!");
				request.getRequestDispatcher("homePage/changePassword.jsp").forward(request, response);
			} else {
				if (!newPw.equals(confirmPw)) {
					request.setAttribute("msgError", "Your password do not match!");
					request.getRequestDispatcher("homePage/changePassword.jsp").forward(request, response);
				} else {
					String newPassword_SHA = encrypt.toSHA1(newPw);
					user.setPassword(newPassword_SHA);
					UserDAO userDAO = new UserDAO();
					userDAO.changePassword(user);
					request.setAttribute("msgOk", "Password changed successfully");
					request.getRequestDispatcher("homePage/changePassword.jsp").forward(request, response);
				}
			}

		}
	}

	private void changeInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("username");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
//		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String news = request.getParameter("news");

		request.setAttribute("username", userName);
		request.setAttribute("birthday", birthday);
		request.setAttribute("email", email);
		request.setAttribute("gender", gender);
		request.setAttribute("news", news);

		UserDAO userDAO = new UserDAO();

		Object object = request.getSession().getAttribute("user");
		User user = null;

		if (object != null) {
			user = (User) object;
		}

		if (user != null) {
			int userId = user.getUserID();
			User us = new User(userId, "", Date.valueOf(birthday), email, "", gender, news != null);
			userDAO.changeInfo(us);
			User user2 = userDAO.selectById(us);
			request.getSession().setAttribute("user", user2);
			request.setAttribute("msgOk", "changed in successfully<br/>");
			request.getRequestDispatcher("homePage/changeInformation.jsp").forward(request, response);
		}
	}

	private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookID = request.getParameter("bookID");

		HomeDAO homeDAO = new HomeDAO();

		Book book = homeDAO.getBookByID(bookID);
		request.setAttribute("detail", book);

		List<Status> listS = homeDAO.getAllStatus();
		request.setAttribute("listStt", listS);

		List<Category> listC = homeDAO.getAllCategory();
		request.setAttribute("listCate", listC);

		request.getRequestDispatcher("homePage/detail.jsp").forward(request, response);
	}

	private void category(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cateID = request.getParameter("cateID");
		HomeDAO bookDAO = new HomeDAO();
		List<Book> listB = bookDAO.getBookByCateID(cateID);

		List<Category> listC = bookDAO.getAllCategory();
		request.setAttribute("listCate", listC);

		request.setAttribute("listBook", listB);
		request.getRequestDispatcher("homePage/home.jsp").forward(request, response);
	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String txtsearch = request.getParameter("search");
		HomeDAO bookDAO = new HomeDAO();

		List<Book> listSearch = bookDAO.searchBookByName(txtsearch);
		request.setAttribute("listBook", listSearch);
		request.setAttribute("txtS", listSearch);

		List<Category> listC = bookDAO.getAllCategory();
		request.setAttribute("listCate", listC);

		request.getRequestDispatcher("homePage/home.jsp").forward(request, response);
	}

	private void verification(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer userID = Integer.parseInt(request.getParameter("userID"));
		String code = request.getParameter("code");

		UserDAO userDAO = new UserDAO();
		User user = new User();
		user.setUserID(userID);
		User us = userDAO.selectById(user);

		if (us != null) {
			// check code match
			if (us.getVerifycationCode().equals(code)) {
				// if code matched, check effective time
				us.setAuthenticationStatus(true);
				userDAO.updateVetifyInformation(us);
				request.setAttribute("msgOk", "Logged in successfully<br/>");
//				response.sendRedirect("home-servlet");

			} else {
				// false
				request.setAttribute("msgError", "Username already exists, please choose another username.<br/>");
//				request.getRequestDispatcher("register.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("msgError", "User already exists, please choose another username.<br/>");
//			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
//		request.getRequestDispatcher("home.jsp").forward(request, response);
		response.sendRedirect("home-servlet");
	}
}
