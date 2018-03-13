package kikakuya.model;

import java.util.ArrayList;
import java.util.List;

public class Item {
	
	private int itemId, listIdFK;
	private Integer itemStatus;
	private String itemName;
	private List<Item> itemsList = new ArrayList<>();
	
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
	public void setListIdFK(int listIdFK) {
		this.listIdFK = listIdFK;
	}
	public List<Item> getItemsList() {
		return itemsList;
	}
	public void setItemsList(List<Item> itemsList) {
		this.itemsList = itemsList;
	}
	
	
	
	
	
	
	
}
