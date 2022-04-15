package edu.study.vo;

public class MyQnaVO {
	private String content;
	private String write_date;
	private String del_yn;
	
	private String title;
	private String brand;
	private String img_system;
	private String img_origin;
	
	private int spidx;
	private int midx;
	
	public MyQnaVO() {
		super();
		
	}

	public MyQnaVO(String content, String write_date, String del_yn, String title, String brand, String img_system,
			String img_origin, int spidx, int midx) {
		super();
		this.content = content;
		this.write_date = write_date;
		this.del_yn = del_yn;
		this.title = title;
		this.brand = brand;
		this.img_system = img_system;
		this.img_origin = img_origin;
		this.spidx = spidx;
		this.midx = midx;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getImg_system() {
		return img_system;
	}

	public void setImg_system(String img_system) {
		this.img_system = img_system;
	}

	public String getImg_origin() {
		return img_origin;
	}

	public void setImg_origin(String img_origin) {
		this.img_origin = img_origin;
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
	
	
	
	
	
}
