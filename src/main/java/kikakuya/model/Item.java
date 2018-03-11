package kikakuya.model;

public class Item {
	
	private int itemId, listIdFK;
	private Integer itemStatus;
	private String itemName;
	
	public Item() {
		
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public Integer getItemStatus() {
		return itemStatus;
	}
	public void setItemStatus(Integer itemStatus) {
		this.itemStatus = itemStatus;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getListIdFK() {
		return listIdFK;
	}
	public void setListidFK(int listIdFK) {
		this.listIdFK = listIdFK;
	}
	
	
	
	
}
