package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import database.InterfaceDAO;
import database.JDBCUtil;
import model.Book;
import model.Cart;
import model.Item;
import model.User;

public class UserDAO implements InterfaceDAO<User> {
	public ArrayList<User> data = new ArrayList<>();

	@Override
	public ArrayList<User> selectAll() {
		ArrayList<User> ketQua = new ArrayList<User>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM user";
			PreparedStatement st = con.prepareStatement(sql);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer userID = rs.getInt("userID");
				String userName = rs.getString("username");
				Date birthday = rs.getDate("birthday");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String gender = rs.getString("gender");
				boolean receiveNews = rs.getBoolean("receivenews");
				String verifycationCode = rs.getString("verifycationcode");
				Date effectiveTime = rs.getDate("effectivetime");
				boolean authenticationStatus = rs.getBoolean("authenticationstatus");

				User user = new User(userID, userName, birthday, email, password, gender, receiveNews, verifycationCode,
						effectiveTime, authenticationStatus);
				ketQua.add(user);
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public User selectById(User t) {
		User ketQua = null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM user WHERE userID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, t.getUserID());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer userID = rs.getInt("userID");
				String userName = rs.getString("username");
				Date birthday = rs.getDate("birthday");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String gender = rs.getString("gender");
				boolean receiveNews = rs.getBoolean("receivenews");
				String verifycationCode = rs.getString("verifycationcode");
				Date effectiveTime = rs.getDate("effectivetime");
				boolean authenticationStatus = rs.getBoolean("authenticationstatus");

				ketQua = new User(userID, userName, birthday, email, password, gender, receiveNews, verifycationCode,
						effectiveTime, authenticationStatus);
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int insert(User t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO user (userID, username, birthday, email, password, gender, receivenews) "
					+ " VALUES (?,?,?,?,?,?,?)";

			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, t.getUserID());
			st.setString(2, t.getUserName());
			st.setDate(3, t.getBirthday());
			st.setString(4, t.getEmail());
			st.setString(5, t.getPassword());
			st.setString(6, t.getGender());
			st.setBoolean(7, t.isReceiveNews());

			// Bước 3: thực thi câu lệnh SQL
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dong bi thay doi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

//	public int insertUser(String userName, Date birthday, String email, String password, String gender, boolean news) {
//		int ketQua = 0;
//		try {
//			// Bước 1: tạo kết nối đến CSDL
//			Connection con = JDBCUtil.getConnection();
//
//			// Bước 2: tạo ra đối tượng statement
//			String sql = "INSERT INTO `user`(username, birthday, email, PASSWORD, gender, receivenews)\r\n"
//					+ "VALUES(?,?,?,?,?,?)";
//
//			PreparedStatement st = con.prepareStatement(sql);
//			st.setString(1, userName);
//			st.setDate(2, birthday);
//			st.setString(3, email);
//			st.setString(4, password);
//			st.setString(5, gender);
//			st.setBoolean(6, news);
//
//			// Bước 3: thực thi câu lệnh SQL
//			ketQua = st.executeUpdate();
//
//			// Bước 4:
//			System.out.println("Có " + ketQua + " dòng bị thay đổi!");
//
//			// Bước 5:
//			JDBCUtil.closeConnection(con);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return ketQua;
//	}

	public int insertUser(User t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO `user`(username, birthday, email, PASSWORD, gender, receivenews)\r\n"
					+ "VALUES(?,?,?,?,?,?)";

			PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			st.setString(1, t.getUserName());
			st.setDate(2, t.getBirthday());
			st.setString(3, t.getEmail());
			st.setString(4, t.getPassword());
			st.setString(5, t.getGender());
			st.setBoolean(6, t.isReceiveNews());

			// Bước 3: thực thi câu lệnh SQL
			ketQua = st.executeUpdate();

			ResultSet rs = st.getGeneratedKeys();
			int idValue = 0;
			if (rs.next()) {
				idValue = rs.getInt(1);
			}
			System.out.println("ID value: " + idValue);

			// Bước 4:
			System.out.println(sql);
			System.out.println("Có " + ketQua + " dong duoc them!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ketQua;
	}

	@Override
	public int insertAll(ArrayList<User> arr) {
		int dem = 0;
		for (User user : arr) {
			dem += this.insert(user);
		}
		return dem;
	}

	@Override
	public int delete(User t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE from user " + " WHERE userID=?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, t.getUserID());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int deleteAll(ArrayList<User> arr) {
		int dem = 0;
		for (User user : arr) {
			dem += this.delete(user);
		}
		return dem;
	}

	@Override
	public int update(User t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE user " + " SET " + " username=?" + ", birthday=?" + ", email=?" + ", password=?"
					+ ", gender=?" + ", receivenews=?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getUserName());
			st.setDate(2, t.getBirthday());
			st.setString(3, t.getEmail());
			st.setString(4, t.getPassword());
			st.setString(5, t.getGender());
			st.setBoolean(6, t.isReceiveNews());
			st.setInt(7, t.getUserID());

			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dong duoc update!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	public boolean changePassword(User t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE user " + " SET " + " password=? " + " where userID=? ";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getPassword());
			st.setInt(2, t.getUserID());

			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dong duoc thay doi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua > 0;
	}

	public int changeInfo(User t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE user \r\n" + "SET birthday=?, email=?, gender=?, receivenews=?\r\n"
					+ "WHERE userID=?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setDate(1, t.getBirthday());
			st.setString(2, t.getEmail());
			st.setString(3, t.getGender());
			st.setBoolean(4, t.isReceiveNews());
			st.setInt(5, t.getUserID());

			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dong duoc thay doi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	public User checkUserName(String userName) {
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM `user` WHERE username=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, userName);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				return new User(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getBoolean(7));
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public User selectByUsernameAndPassWord(User t) {
		User ketQua = null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM user WHERE username=? and password=?";
			PreparedStatement st = con.prepareStatement(sql);
			System.out.println(t.getUserName() + "/" + t.getPassword());
			st.setString(1, t.getUserName());
			st.setString(2, t.getPassword());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer userID = rs.getInt("userID");
				String userName = rs.getString("username");
				Date birthday = rs.getDate("birthday");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String gender = rs.getString("gender");
				boolean receiveNews = rs.getBoolean("receivenews");
				String verifycationCode = rs.getString("verifycationcode");
				Date effectiveTime = rs.getDate("effectivetime");
				boolean authenticationStatus = rs.getBoolean("authenticationstatus");

				ketQua = new User(userID, userName, birthday, email, password, gender, receiveNews, verifycationCode,
						effectiveTime, authenticationStatus);
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	public List<User> getAllUser() {

		List<User> listUser = new ArrayList<User>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM user";
			PreparedStatement ps = con.prepareStatement(sql);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = ps.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer userID = rs.getInt("userID");
				String userName = rs.getString("username");
				Date birthday = rs.getDate("birthday");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String gender = rs.getString("gender");
				boolean receiveNews = rs.getBoolean("receivenews");

				User user = new User(userID, userName, birthday, email, password, gender, receiveNews);
				listUser.add(user);
			}
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listUser;
	}

	public int updateVetifyInformation(User t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// lay ID cua user vua them vao
			String sql1 = "select userID FROM`user`\r\n" + "order BY userID desc LIMIT 1";
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ResultSet rs = ps1.executeQuery();

			if (rs.next()) {
				int userID = rs.getInt(1);
				// Bước 2: tạo ra đối tượng statement
				String sql = "UPDATE user\r\n" + "SET verifycationcode=?, effectivetime=?, authenticationstatus=? \r\n"
						+ "where userID=?";

				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, t.getVerifycationCode());
				st.setDate(2, t.getEffectiveTime());
				st.setBoolean(3, t.isAuthenticationStatus());
				st.setInt(4, userID);

				// Bước 3: thực thi câu lệnh SQL
				System.out.println(sql);

				User user = new User();
				user.setUserID(userID);
				System.out.println(userID);

				ketQua = st.executeUpdate();

				// Bước 4:
				System.out.println("Bạn đã thực thi: " + sql);
				System.out.println("Có " + ketQua + " dong duoc thay doi!");

				// Bước 5:
				JDBCUtil.closeConnection(con);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	public User selectByUserName(User t) {
		User ketQua = null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM user WHERE username=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getUserName());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				Integer userID = rs.getInt("userID");
				String userName = rs.getString("username");
				Date birthday = rs.getDate("birthday");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String gender = rs.getString("gender");
				boolean receiveNews = rs.getBoolean("receivenews");
				String verifycationCode = rs.getString("verifycationcode");
				Date effectiveTime = rs.getDate("effectivetime");
				boolean authenticationStatus = rs.getBoolean("authenticationstatus");

				ketQua = new User(userID, userName, birthday, email, password, gender, receiveNews, verifycationCode,
						effectiveTime, authenticationStatus);
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	public User selectUserID() {
		User ketQua = null;
		try {
			Connection con = JDBCUtil.getConnection();

			// Lay ra ID cua Order vua them
			String sql1 = "select userID FROM`user` \r\n" + "order BY userID desc LIMIT 1";
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ResultSet rs = ps1.executeQuery();

			// add vao bang OrderLine
			if (rs.next()) {
				int userId = rs.getInt(1);

				String sql = "SELECT * FROM user WHERE userID=?";
				PreparedStatement st = con.prepareStatement(sql);
				st.setInt(1, userId);

				// Bước 3: thực thi câu lệnh SQL
				System.out.println(sql);
				rs = st.executeQuery();

				// Bước 4:
				while (rs.next()) {
					Integer userID = rs.getInt("userID");
					String userName = rs.getString("username");
					Date birthday = rs.getDate("birthday");
					String email = rs.getString("email");
					String password = rs.getString("password");
					String gender = rs.getString("gender");
					boolean receiveNews = rs.getBoolean("receivenews");
					String verifycationCode = rs.getString("verifycationcode");
					Date effectiveTime = rs.getDate("effectivetime");
					boolean authenticationStatus = rs.getBoolean("authenticationstatus");

					ketQua = new User(userID, userName, birthday, email, password, gender, receiveNews,
							verifycationCode, effectiveTime, authenticationStatus);
					System.out.println(ketQua);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ketQua;
	}

//	public User selectUserID() {
//		User ketQua = null;
//		try {
//			Connection con = JDBCUtil.getConnection();
//
//			// Lay ra ID cua Order vua them
//			String sql1 = "select orderID FROM `order`\r\n" + "order BY orderID desc\r\n" + "LIMIT 1";
//			PreparedStatement ps1 = con.prepareStatement(sql1);
//			ResultSet rs = ps1.executeQuery();
//
//			// add vao bang OrderLine
//			if (rs.next()) {
//				int userId = rs.getInt(1);
//
//				String sql = "SELECT * FROM user WHERE userID=?";
//				PreparedStatement st = con.prepareStatement(sql);
//				st.setInt(1, userId);
//
//				// Bước 3: thực thi câu lệnh SQL
//				System.out.println(sql);
//				rs = st.executeQuery();
//
//				// Bước 4:
//				while (rs.next()) {
//					Integer userID = rs.getInt("userID");
//					String userName = rs.getString("username");
//					Date birthday = rs.getDate("birthday");
//					String email = rs.getString("email");
//					String password = rs.getString("password");
//					String gender = rs.getString("gender");
//					boolean receiveNews = rs.getBoolean("receivenews");
//					String verifycationCode = rs.getString("verifycationcode");
//					Date effectiveTime = rs.getDate("effectivetime");
//					boolean authenticationStatus = rs.getBoolean("authenticationstatus");
//
//					ketQua = new User(userID, userName, birthday, email, password, gender, receiveNews,
//							verifycationCode, effectiveTime, authenticationStatus);
//				}
//			}
//			JDBCUtil.closeConnection(con);
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		return ketQua;
//	}

	public static void main(String[] args) {
		UserDAO userDAO = new UserDAO();
		ArrayList<User> kq = userDAO.selectAll();
		for (User user : kq) {
			System.out.println(user.toString());
		}

//		User tl = userDAO.selectById(new User("1", "", null, "", "", "", "", true));
//		System.out.println(tl);
//		User tg_new = new User();
//		userDAO.insert(tg_new);

//		TheLoai tg_new = new TheLoai("TG3", "Tieu thuyet");
//		theLoaiDAO.delete(tg_new);

//	  User tl = userDAO.selectById(new User());
//	  System.out.println(tl);
//	  tl.setTenTheLoai("Truyen tranh");
//	  theLoaiDAO.update(tl);

	}
//
}
