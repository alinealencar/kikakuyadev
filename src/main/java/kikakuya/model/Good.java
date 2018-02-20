package kikakuya.model;

public class Good {
	private int goodId;
	private String goodName;
	private double goodPrice;
	private int vendorEventId;
	
	public Good() {
	
	}
	
	public int getGoodId() {
		return goodId;
	}
	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public double getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(double goodPrice) {
		this.goodPrice = goodPrice;
	}
	public int getVendorEventId() {
		return vendorEventId;
	}
	public void setVendorEventId(int vendorEventId) {
		this.vendorEventId = vendorEventId;
	}

	@Override
	public String toString() {
		return "Good [goodId=" + goodId + ", goodName=" + goodName + ", goodPrice=" + goodPrice + ", vendorEventId="
				+ vendorEventId + "]";
	}
	
	
}
