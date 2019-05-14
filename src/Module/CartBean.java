package Module;

public class CartBean {
	int custId;
	int itemId;
	String itemName;
	int price;
	String img;
	int quantity;
	public CartBean() {
	}
	
	public CartBean(int custId, int itemId, String itemName, int price, String img, int quantity) {
		this.custId = custId;
		this.itemId = itemId;
		this.itemName = itemName;
		this.price = price;
		this.img = img;
		this.quantity = quantity;
	}

	public int getCustId() {
		return custId;
	}
	public void setCustId(int custId) {
		this.custId = custId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
