package edu.study.vo;

import java.util.List;

public class FollowVO {
	
	private int fidx;
	private String add_date;
	private int fmidx;
	private int midx;
	private String fmidx_nick;
	private String profile_system;
	private List<Community_BoardVO> bvo;
	
	public int getFidx() {
		return fidx;
	}
	public void setFidx(int fidx) {
		this.fidx = fidx;
	}
	public String getAdd_date() {
		return add_date;
	}
	public void setAdd_date(String add_date) {
		this.add_date = add_date;
	}
	public int getFmidx() {
		return fmidx;
	}
	public void setFmidx(int fmidx) {
		this.fmidx = fmidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	
	public String getFmidx_nick() {
		return fmidx_nick;
	}
	public void setFmidx_nick(String fmidx_nick) {
		this.fmidx_nick = fmidx_nick;
	}
	public String getProfile_system() {
		return profile_system;
	}
	public void setProfile_system(String profile_system) {
		this.profile_system = profile_system;
	}
	public List<Community_BoardVO> getBvo() {
		return bvo;
	}
	public void setBvo(List<Community_BoardVO> bvo) {
		this.bvo = bvo;
	}
}
