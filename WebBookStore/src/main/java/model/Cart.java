package model;

import java.util.ArrayList;
import java.util.List;


public class Cart {
	private List<Item> items;

	public Cart() {
		items = new ArrayList<>();
	}

	public Cart(List<Item> items) {
		this.items = items;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public Item getItemByID(int bookID) {
		for (Item i : items) {
			if (i.getBook().getBookID() == bookID) {
				return i;
			}
		}

		return null;
	}

	public int getQuantityByID(int bookID) {
		return getItemByID(bookID).getQuantity();
	}

	public void addItem(Item t) {
		if (getItemByID(t.getBook().getBookID()) != null) {
			Item i = getItemByID(t.getBook().getBookID());
			i.setQuantity(i.getQuantity() + t.getQuantity());
		} else {
			items.add(t);
		}
	}

	public void removeItem(int bookID) {
		if (getItemByID(bookID) != null) {
			items.remove(getItemByID(bookID));
		}
	}

	public double getTotal() {
		double t = 0;
		for (Item i : items) {
			t += (i.getQuantity() * i.getPrice());
		}
		return t;
	}

	public double getTotalQuantity() {
		double t = 0;
		for (Item i : items) {
			t += i.getQuantity();
		}
		return t;
	}
}
