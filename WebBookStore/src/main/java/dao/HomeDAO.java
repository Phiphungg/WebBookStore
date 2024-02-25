package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.JDBCUtil;
import model.Book;
import model.Category;
import model.Status;

public class HomeDAO {
	private Connection conn;

	public HomeDAO() {
		// TODO Auto-generated constructor stub
	}

	public HomeDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public List<Book> getAllBook() {
		List<Book> listBook = new ArrayList<Book>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM book";
			PreparedStatement ps = conn.prepareStatement(sql);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer bookID = rs.getInt("bookID");
				String bookName = rs.getString("bookname");
				String author = rs.getString("author");
				Double price = rs.getDouble("price");
				String title = rs.getString("title");
				String description = rs.getString("description");
				String image = rs.getString("image");
				Integer quantity = rs.getInt("quantity");
				String cateID = rs.getString("cateID");
				String sttID = rs.getString("sttID");

				Book book = new Book(bookID, bookName, author, price, title, description, image, quantity, cateID,
						sttID);
				listBook.add(book);
			}
			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listBook;
	}

	public List<Category> getAllCategory() {
		List<Category> listCate = new ArrayList<Category>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM category";
			PreparedStatement ps = conn.prepareStatement(sql);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer cateID = rs.getInt("cateID");
				String cateName = rs.getString("catename");

				Category cate = new Category(cateID, cateName);
				listCate.add(cate);
			}
			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listCate;
	}

	public List<Status> getAllStatus() {
		List<Status> listStatus = new ArrayList<Status>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM status";
			PreparedStatement ps = conn.prepareStatement(sql);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer sttID = rs.getInt("sttID");
				String sttName = rs.getString("sttname");

				Status status = new Status(sttID, sttName);
				listStatus.add(status);
			}
			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listStatus;
	}

	public List<Book> getBookByCateID(String cateId) {
		List<Book> listBook = new ArrayList<Book>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM book\n" + "WHERE cateID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cateId);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer bookID = rs.getInt("bookID");
				String bookName = rs.getString("bookname");
				String author = rs.getString("author");
				Double price = rs.getDouble("price");
				String title = rs.getString("title");
				String description = rs.getString("description");
				String image = rs.getString("image");
				Integer quantity = rs.getInt("quantity");
				String cateID = rs.getString("cateID");
				String sttID = rs.getString("sttID");

				Book book = new Book(bookID, bookName, author, price, title, description, image, quantity, cateID,
						sttID);
				listBook.add(book);
			}
			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listBook;
	}

	public List<Book> getBookByChoosePage(String choosePage) {
		List<Book> listBook = new ArrayList<Book>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM book\r\n" + "WHERE pagename = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "'" + choosePage + "'");

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer bookID = rs.getInt("bookID");
				String bookName = rs.getString("bookname");
				String author = rs.getString("author");
				Double price = rs.getDouble("price");
				String title = rs.getString("title");
				String description = rs.getString("description");
				String image = rs.getString("image");
				Integer quantity = rs.getInt("quantity");
				String cateID = rs.getString("cateID");
				String sttID = rs.getString("sttID");

				Book book = new Book(bookID, bookName, author, price, title, description, image, quantity, cateID,
						sttID);
				listBook.add(book);
			}
			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listBook;
	}

	public List<Book> searchBookByName(String search) {
		List<Book> listBook = new ArrayList<Book>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM book\r\n" + "WHERE bookname LIKE ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer bookID = rs.getInt("bookID");
				String bookName = rs.getString("bookname");
				String author = rs.getString("author");
				Double price = rs.getDouble("price");
				String title = rs.getString("title");
				String description = rs.getString("description");
				String image = rs.getString("image");
				Integer quantity = rs.getInt("quantity");
				String cateID = rs.getString("cateID");
				String sttID = rs.getString("sttID");
				Book book = new Book(bookID, bookName, author, price, title, description, image, quantity, cateID,
						sttID);
				listBook.add(book);
			}
			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listBook;
	}

	public Book getBookByID(String bookId) {
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM book\n" + "WHERE bookID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, bookId);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer bookID = rs.getInt("bookID");
				String bookName = rs.getString("bookname");
				String author = rs.getString("author");
				Double price = rs.getDouble("price");
				String title = rs.getString("title");
				String description = rs.getString("description");
				String image = rs.getString("image");
				Integer quantity = rs.getInt("quantity");
				String cateID = rs.getString("cateID");
				String sttID = rs.getString("sttID");

				Book book = new Book(bookID, bookName, author, price, title, description, image, quantity, cateID,
						sttID);
				return book;
			}
			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public Book getBookByID(Integer bookId) {
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM book\n" + "WHERE bookID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bookId);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer bookID = rs.getInt("bookID");
				String bookName = rs.getString("bookname");
				String author = rs.getString("author");
				Double price = rs.getDouble("price");
				String title = rs.getString("title");
				String description = rs.getString("description");
				String image = rs.getString("image");
				Integer quantity = rs.getInt("quantity");
				String cateID = rs.getString("cateID");
				String sttID = rs.getString("sttID");

				Book book = new Book(bookID, bookName, author, price, title, description, image, quantity, cateID,
						sttID);
				return book;
			}
			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public void deleteBookByID(String bookId) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE from book " + " WHERE bookID=?";

			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, bookId);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertBook(Book book) {
		int kq = 0;
		try { // Bước 1: tạo kết nối đến CSDL Connection con =
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement String sql =
			String sql = "INSERT INTO book (bookname, author, price, title, description, image, quantity, cateID, sttID) "
					+ " VALUES (?,?,?,?,?,?,?,?,?)";

			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, book.getBookName());
			st.setString(2, book.getAuthor());
			st.setDouble(3, book.getPrice());
			st.setString(4, book.getTitle());
			st.setString(5, book.getDescription());
			st.setString(6, book.getImage());
			st.setDouble(7, book.getQuantity());
			st.setString(8, book.getCateID());
			st.setString(9, book.getSttID());

			// Bước 3: thực thi câu lệnh SQL
			kq = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);

			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return kq;
	}

	public Book checkBookName(String BookName) {
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM book WHERE bookname=?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, BookName);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				return new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9), rs.getString(10));
			}
			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public int updateEditBook(String bookName, String author, Double price, String title, String description,
			String image, Integer quantity, String category, String status, String bookID) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE book  \r\n"
					+ "SET  bookname=?, author=?, price=?, title=?, DESCRIPTION=?, image=?,quantity=?, cateID=?, sttID=?\r\n"
					+ "WHERE bookID=?";

			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, bookName);
			st.setString(2, author);
			st.setDouble(3, price);
			st.setString(4, title);
			st.setString(5, description);
			st.setString(6, image);
			st.setInt(7, quantity);
			st.setString(8, category);
			st.setString(9, status);
			st.setString(10, bookID);

			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ketQua;
	}


	public static void main(String[] args) {
		HomeDAO bookDAO = new HomeDAO();
		List<Book> list = bookDAO.getAllBook();
		for (Book o : list) {
			System.out.println(o);
		}
	}

}
