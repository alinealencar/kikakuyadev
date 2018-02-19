package kikakuya.model;

import java.util.ArrayList;
import java.util.List;

public class Vendor {
	
	private String name, address, website, phoneNo, imageURL, category, location;
	private double rating;
	private int vendorId;
	private List<Good> goodsList = new ArrayList<Good>();
	
	public Vendor () {
		
	}

	public Vendor(String name, String address, String website, String phoneNo, String imageURL, String category, double rating) {
		this.name = name;
		this.address = address;
		this.website = website;
		this.phoneNo = phoneNo;
		this.imageURL = imageURL;
		this.category = category;
		this.rating = rating;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getVendorId() {
		return vendorId;
	}

	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}

	public List<Good> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Good> goodsList) {
		this.goodsList = goodsList;
	}

	

}
