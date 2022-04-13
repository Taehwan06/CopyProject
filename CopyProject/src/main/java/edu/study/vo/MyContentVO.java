package edu.study.vo;

public class MyContentVO {
	
	private String title;
	private String writer;
	private String write_date;
	private String img_system;
	private String img_origin;
	private String content;
	private String del_yn;
	
	private int reply_cnt;
	private int hit_cnt;
	
	private int cbidx;
	private int midx;
	
	public MyContentVO(String title, String writer, String write_date, String img_system, String img_origin, String content, String del_yn, int reply_cnt,
			int hit_cnt, int cbidx, int midx) {
		super();
		this.title = title;
		this.writer = writer;
		this.write_date = write_date;
		this.img_system = img_system;
		this.img_origin = img_origin;
		this.content = content;
		this.del_yn = del_yn;
		this.reply_cnt = reply_cnt;
		this.hit_cnt = hit_cnt;
		this.cbidx = cbidx;
		this.midx = midx;
		
		
		
		
	}

	public MyContentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	
	

	public int getReply_cnt() {
		return reply_cnt;
	}

	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}

	public int getHit_cnt() {
		return hit_cnt;
	}

	public void setHit_cnt(int hit_cnt) {
		this.hit_cnt = hit_cnt;
	}

	public int getCbidx() {
		return cbidx;
	}

	public void setCbidx(int cbidx) {
		this.cbidx = cbidx;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}
	
	
	
	
	
}
