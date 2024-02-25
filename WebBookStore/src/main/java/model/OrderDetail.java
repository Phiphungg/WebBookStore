package model;

public class OrderDetail {
	private int orderID;
	private int bookID;
	private int quantity;
	private Double price;
	private String bookName;
	private String author;

	public OrderDetail() {
		// TODO Auto-generated constructor stub
	}

	public OrderDetail(int orderID, int bookID, int quantity, Double price, String bookName, String author) {
		super();
		this.orderID = orderID;
		this.bookID = bookID;
		this.quantity = quantity;
		this.price = price;
		this.bookName = bookName;
		this.author = author;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public int getBookID() {
		return bookID;
	}

	public void setBookID(int bookID) {
		this.bookID = bookID;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Override
	public String toString() {
		return "OrderDetail [orderID=" + orderID + ", bookID=" + bookID + ", quantity=" + quantity + ", price=" + price
				+ ", bookName=" + bookName + ", author=" + author + "]";
	}

}
