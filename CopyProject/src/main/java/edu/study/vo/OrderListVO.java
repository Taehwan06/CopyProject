package edu.study.vo;

public class OrderListVO {
	private int olidx;
	private int price;
	private int cnt;
	private int delivery_charge;
	
	private String title;
	private String free_delivery;
	private String img_origin;
	private String img_system;
	
	private String buying_date;
	private String progress;
	private String delivery_status;
	private String review_registration;

	private int spidx;
	private int midx;

	private int ordernumber;
	private int paynumber;
	
	public OrderListVO(int olidx, int price, int cnt, int delivery_charge, String title, String free_delivery,
			String img_origin, String img_system, String buying_date, String progress, String delivery_status,
			String review_registration, int spidx, int midx, int ordernumber, int paynumber) {
		super();
		this.olidx = olidx;
		this.price = price;
		this.cnt = cnt;
		this.delivery_charge = delivery_charge;
		this.title = title;
		this.free_delivery = free_delivery;
		this.img_origin = img_origin;
		this.img_system = img_system;
		this.buying_date = buying_date;
		this.progress = progress;
		this.delivery_status = delivery_status;
		this.review_registration = review_registration;
		this.spidx = spidx;
		this.midx = midx;
		this.ordernumber = ordernumber;
		this.paynumber = paynumber;
	}


	
	public OrderListVO() {
		super();
		// TODO Auto-generated constructor stub
	}



	public int getOlidx() {
		return olidx;
	}


	public void setOlidx(int olidx) {
		this.olidx = olidx;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	public int getDelivery_charge() {
		return delivery_charge;
	}


	public void setDelivery_charge(int delivery_charge) {
		this.delivery_charge = delivery_charge;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
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


	public String getImg_system() {
		return img_system;
	}


	public void setImg_system(String img_system) {
		this.img_system = img_system;
	}


	public String getBuying_date() {
		return buying_date;
	}


	public void setBuying_date(String buying_date) {
		this.buying_date = buying_date;
	}


	public String getProgress() {
		return progress;
	}


	public void setProgress(String progress) {
		this.progress = progress;
	}


	public String getDelivery_status() {
		return delivery_status;
	}


	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}


	public String getReview_registration() {
		return review_registration;
	}


	public void setReview_registration(String review_registration) {
		this.review_registration = review_registration;
	}


	public int getSpidx() {
		return spidx;
	}


	public void setSpidx(int spidx) {
		this.spidx = spidx;
	}


	public int getMidx() {
		return midx;
	}


	public void setMidx(int midx) {
		this.midx = midx;
	}
	
	
	public int getOrdernumber() {
		return ordernumber;
	}



	public void setOrdernumber(int ordernumber) {
		this.ordernumber = ordernumber;
	}



	public int getPaynumber() {
		return paynumber;
	}



	public void setPaynumber(int paynumber) {
		this.paynumber = paynumber;
	}

	
	
	
	
	

}
