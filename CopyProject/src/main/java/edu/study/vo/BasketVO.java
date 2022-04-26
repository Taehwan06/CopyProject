package edu.study.vo;

public class BasketVO {

	private int sbidx;
	private int midx;
	private int spidx;
	private String title;
	private int cnt;

	private String free_delivery;
	private String img_origin;
	
	private int price;
	private int delivery_charge;

	private String img_system;
	private String[] sbidxArray;
	private String brand;
	private String sbidxStr;
	
	private String ordernumber;
	private String paynumber;
	
	private int sale_price;
	private String view_price;
	
	
	public String getView_price() {
		return view_price;
	}
	public void setView_price(String view_price) {
		this.view_price = view_price;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}
	public String getPaynumber() {
		return paynumber;
	}
	public void setPaynumber(String paynumber) {
		this.paynumber = paynumber;
	}
	public String getSbidxStr() {
		return sbidxStr;
	}
	public void setSbidxStr(String sbidxStr) {
		this.sbidxStr = sbidxStr;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDelivery_charge() {
		return delivery_charge;
	}
	public void setDelivery_charge(int delivery_charge) {
		this.delivery_charge = delivery_charge;
	}
	public String getImg_system() {
		return img_system;
	}
	public void setImg_system(String img_system) {
		this.img_system = img_system;
	}
	public String[] getSbidxArray() {
		return sbidxArray;
	}
	public void setSbidxArray(String[] sbidxArray) {
		this.sbidxArray = sbidxArray;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getSbidx() {
		return sbidx;
	}
	public void setSbidx(int sbidx) {
		this.sbidx = sbidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getSpidx() {
		return spidx;
	}
	public void setSpidx(int spidx) {
		this.spidx = spidx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getFree_delivery() {
		return free_delivery;
	}
	public void setFree_delivery(String free_delivery) {
		this.free_delivery = free_delivery;
	}
	public String getImg_origin() {
		return img_origin;
	}
	public void setImg_origin(String img_origin) {
		this.img_origin = img_origin;
	}
}
