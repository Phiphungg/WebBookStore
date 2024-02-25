package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import database.JDBCUtil;
import model.Book;
import model.Cart;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.User;

public class OrderDAO {
	private Connection conn;

	public void addOrder(User u, Cart cart) {
		LocalDate curDate = java.time.LocalDate.now();
		String date = curDate.toString();
		try {
			conn = JDBCUtil.getConnection();

			String sql = "INSERT INTO `order` (DATE,userID,username,total,totalQuantity)\r\n" + "VALUES(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, date);
			ps.setInt(2, u.getUserID());
			ps.setString(3, u.getUserName());
			ps.setDouble(4, cart.getTotal());
			ps.setDouble(5, cart.getTotalQuantity());
			ps.executeUpdate();

			// Lay ra ID cua Order vua them
			String sql1 = "select orderID FROM `order`\r\n" + "order BY orderID desc\r\n" + "LIMIT 1";
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			ResultSet rs = ps1.executeQuery();

			// add vao bang OrderLine
			if (rs.next()) {
				int orderID = rs.getInt(1);
				for (Item i : cart.getItems()) {
					String sql2 = "insert into `orderdetail` (orderID,bookID,quantity,price,bookname,author) \r\n"
							+ "VALUES (?,?,?,?,?,?)";
					PreparedStatement ps2 = conn.prepareStatement(sql2);
					ps2.setInt(1, orderID);
					ps2.setInt(2, i.getBook().getBookID());
					ps2.setInt(3, i.getQuantity());
					ps2.setDouble(4, i.getPrice());
					ps2.setString(5, i.getBook().getBookName());
					ps2.setString(6, i.getBook().getAuthor());
					ps2.executeUpdate();
				}
			}

			// cap nhat lai so luong san pham
			String sql3 = "update book set quantity=quantity-? where bookID = ?";
			PreparedStatement ps3 = conn.prepareStatement(sql3);
			for (Item i : cart.getItems()) {
				ps3.setInt(1, i.getQuantity());
				ps3.setInt(2, i.getBook().getBookID());
				ps3.executeUpdate();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public List<Order> getAllOrderByID(Integer userId) {
		List<Order> listOrder = new ArrayList<Order>();
		Order o = null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "select * FROM `order`\r\n" + "WHERE userID = ?\r\n" + "";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			// Bước 4:
			while (rs.next()) {
				o = new Order();

				o.setOrderID(rs.getInt(1));
				o.setDate(rs.getString(2));
				o.setUserID(rs.getInt(3));
				o.setUserName(rs.getString(4));
				o.setTotal(rs.getDouble(5));
				o.setTotalQuantity(rs.getDouble(6));
				listOrder.add(o);
			}
			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listOrder;
	}

	public List<OrderDetail> getAllOrderDetailByID(String orderId) {
		List<OrderDetail> listOrderDetail = new ArrayList<OrderDetail>();
		OrderDetail o = null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * \r\n" + "FROM orderdetail\r\n" + "WHERE orderID = ?\r\n" + "";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, orderId);
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			// Bước 4:
			while (rs.next()) {
				o = new OrderDetail();
				o.setOrderID(rs.getInt(1));
				o.setBookID(rs.getInt(2));
				o.setQuantity(rs.getInt(3));
				o.setPrice(rs.getDouble(4));
				o.setBookName(rs.getString(5));
				o.setAuthor(rs.getString(6));
				listOrderDetail.add(o);
			}
			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listOrderDetail;
	}

	public List<Order> getAllOrderByID(String orderId) {
		List<Order> listOrder = new ArrayList<Order>();
		Order o = null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			conn = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "select * FROM `order`\r\n" + "WHERE orderID = ?\r\n" + "";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, orderId);
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			// Bước 4:
			while (rs.next()) {
				o = new Order();
				o.setOrderID(rs.getInt(1));
				o.setDate(rs.getString(2));
				o.setUserID(rs.getInt(3));
				o.setTotal(rs.getDouble(4));
				o.setTotalQuantity(rs.getDouble(5));
				listOrder.add(o);
			}
			// Bước 5:
			JDBCUtil.closeConnection(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listOrder;
	}

	public List<Order> getAllOrder() {
		List<Order> listOrder = new ArrayList<Order>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM `order`";
			PreparedStatement ps = con.prepareStatement(sql);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer orderID = rs.getInt("orderID");
				String date = rs.getString("date");
				Integer userID = rs.getInt("userID");
				String userName = rs.getString("username");
				Double total = rs.getDouble("total");
				Double totalQuantity = rs.getDouble("totalQuantity");

				Order order = new Order(orderID, date, userID, userName, total, totalQuantity);
				listOrder.add(order);
			}
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listOrder;
	}

}
