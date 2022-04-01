package edu.study.vo;

public class BasketVO {
	
	private String sbidx;
	private int midx;
	private String price;
	private int cnt;
	private String title;
	private int spidx;
	private String free_delivery;
	private int delivery_charge;
	private String img_origin;
	private String img_system;
	private String[] sbidxArray;
	private String brand;
	
	
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String[] getSbidxArray() {
		return sbidxArray;
	}
	public void setSbidxArray(String[] sbidxArray) {
		this.sbidxArray = sbidxArray;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSpidx() {
		return spidx;
	}
	public void setSpidx(int spidx) {
		this.spidx = spidx;
	}
	public String getFree_delivery() {
		return free_delivery;
	}
	public void setFree_delivery(String free_delivery) {
		this.free_delivery = free_delivery;
	}
	public int getDelivery_charge() {
		return delivery_charge;
	}
	public void setDelivery_charge(int delivery_charge) {
		this.delivery_charge = delivery_charge;
	}
	public String getImg_origin() {
		return img_origin;
	}
	public void setImg_origin(String img_origin) {
		this.img_origin = img_origin;
	}
	public String getImg_system() {
		return img_system;
	}
	public void setImg_system(String img_system) {
		this.img_system = img_system;
	}
	public String getSbidx() {
		return sbidx;
	}
	public void setSbidx(String sbidx) {
		this.sbidx = sbidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
}
