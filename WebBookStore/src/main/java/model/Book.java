package model;

public class Book {
	private int bookID;
	private String bookName;
	private String author;
	private Double price;
	private String title;
	private String description;
	private String image;
	private Integer quantity;
	private String cateID;
	private String sttID;

	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(String bookName, String author, Double price, String title, String description, String image,
			Integer quantity, String cateID, String sttID) {
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.title = title;
		this.description = description;
		this.image = image;
		this.quantity = quantity;
		this.cateID = cateID;
		this.sttID = sttID;

	}

	public Book(int bookID, String bookName, String author, Double price, String title, String description,
			String image, Integer quantity, String cateID, String sttID) {
		super();
		this.bookID = bookID;
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.title = title;
		this.description = description;
		this.image = image;
		this.quantity = quantity;
		this.cateID = cateID;
		this.sttID = sttID;
	}

	public int getBookID() {
		return bookID;
	}

	public void setBookID(int bookID) {
		this.bookID = bookID;
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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getCateID() {
		return cateID;
	}

	public void setCateID(String cateID) {
		this.cateID = cateID;
	}

	public String getSttID() {
		return sttID;
	}

	public void setSttID(String sttID) {
		this.sttID = sttID;
	}

	@Override
	public String toString() {
		return "Book [bookID=" + bookID + ", bookName=" + bookName + ", author=" + author + ", price=" + price
				+ ", title=" + title + ", description=" + description + ", image=" + image + ", quantity=" + quantity
				+ ", cateID=" + cateID + ", sttID=" + sttID + "]";
	}

}
