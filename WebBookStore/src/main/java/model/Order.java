package model;

public class Order {
	private int orderID;
	private String date;
	private int userID;
	private String userName;
	private Double total;
	private double totalQuantity;

	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(int orderID, String date, int userID, String userName, Double total, Double totalQuantity) {
		super();
		this.orderID = orderID;
		this.date = date;
		this.userID = userID;
		this.userName = userName;
		this.total = total;
		this.totalQuantity = totalQuantity;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public Double getTotal() {
		return total;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public double getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(double totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	@Override
	public String toString() {
		return "Order [orderID=" + orderID + ", userName=" + userName + ", date=" + date + ", userID=" + userID
				+ ", total=" + total + ", totalQuantity=" + totalQuantity + "]";
	}

}
