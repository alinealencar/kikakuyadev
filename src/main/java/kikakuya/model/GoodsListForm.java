package kikakuya.model;

import java.util.List;

public class GoodsListForm {
	private double totalBudget;
	private List<Good> goodsList;

	public GoodsListForm() {
		super();
	}

	public List<Good> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Good> goodsList) {
		this.goodsList = goodsList;
	}

	public double getTotalBudget() {
		return totalBudget;
	}

	public void setTotalBudget(double totalBudget) {
		this.totalBudget = totalBudget;
	}
	
	

}
