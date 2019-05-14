package Module;

public class FoodBean {
	int itemId;
	String itemName;
	String img;
	int price;
	int categoryId;
	int itemCount;
	public FoodBean() {
	}
	public FoodBean(String itemName, String img, int price, int categoryId, int itemCount) {
		this.itemName = itemName;
		this.img = img;
		this.price = price;
		this.categoryId = categoryId;
		this.itemCount = itemCount;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	
}
