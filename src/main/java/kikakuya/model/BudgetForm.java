package kikakuya.model;

import java.util.List;

public class BudgetForm {
	private double totalBudget;
	private List<Good> goodsList;
	private int goodId;
	private int vendorId;
	private int vendorEventId;

	public BudgetForm() {
		super();
	}

	public int getGoodId() {
		return goodId;
	}

	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}

	public int getVendorId() {
		return vendorId;
	}

	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}

	public int getVendorEventId() {
		return vendorEventId;
	}

	public void setVendorEventId(int vendorEventId) {
		this.vendorEventId = vendorEventId;
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
