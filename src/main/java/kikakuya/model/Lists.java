package kikakuya.model;

import java.util.ArrayList;
import java.util.List;

public class Lists {
	
	private int listId;
	private String listTitle;
	private List<Lists> listsList = new ArrayList<>();
	
	public Lists() {
		
	}

	public int getListId() {
		return listId;
	}

	public void setListId(int listId) {
		this.listId = listId;
	}

	public String getListTitle() {
		return listTitle;
	}

	public void setListTitle(String listTitle) {
		this.listTitle = listTitle;
	}

	public List<Lists> getListsList() {
		return listsList;
	}

	public void setListsList(List<Lists> listsList) {
		this.listsList = listsList;
	}
	
	
	
	
}
