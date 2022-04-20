package edu.study.vo;

import java.util.List;

public class MemberVO {
	private int midx;
	private String id;
	private String pass;
	private String nick_name;
	private String membername;
	
	private String birthday;
	private String birth1;
	private String birth2;
	private String birth3;
	
	private String phone;
	private String phone1;
	private String phone2;
	private String phone3;
	
	private String gender;
	private String recommender;
	private String mileage;
	private String grade;
	private String joinDate;
	
	private String del_yn;
	private String del_cause;
	private String del_date;
	
	private String black_yn;
	private String black_cause;
	private String black_date;
	
	private String follower_cnt;
	private String profile_origin;
	private String profile_system;
	
	private String post_code;
	private String addr;
	private String addr1;
	private String addr2;
	private String addr3;
	private String addr4;
	
	private String temp_number;
	private List<Community_BoardVO> bvo;
	private String uid;
	
		
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		uid = uid;
	}
	public String getTemp_number() {
		return temp_number;
	}
	public void setTemp_number(String temp_number) {
		this.temp_number = temp_number;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getBirth1() {
		return birth1;
	}
	public void setBirth1(String birth1) {
		this.birth1 = birth1;
	}
	public String getBirth2() {
		return birth2;
	}
	public void setBirth2(String birth2) {
		this.birth2 = birth2;
	}
	public String getBirth3() {
		return birth3;
	}
	public void setBirth3(String birth3) {
		this.birth3 = birth3;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getRecommender() {
		return recommender;
	}
	public void setRecommender(String recommender) {
		this.recommender = recommender;
	}
	public String getMileage() {
		return mileage;
	}
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getDel_cause() {
		return del_cause;
	}
	public void setDel_cause(String del_cause) {
		this.del_cause = del_cause;
	}
	public String getDel_date() {
		return del_date;
	}
	public void setDel_date(String del_date) {
		this.del_date = del_date;
	}
	public String getBlack_yn() {
		return black_yn;
	}
	public void setBlack_yn(String black_yn) {
		this.black_yn = black_yn;
	}
	public String getBlack_cause() {
		return black_cause;
	}
	public void setBlack_cause(String black_cause) {
		this.black_cause = black_cause;
	}
	public String getBlack_date() {
		return black_date;
	}
	public void setBlack_date(String black_date) {
		this.black_date = black_date;
	}
	public String getFollower_cnt() {
		return follower_cnt;
	}
	public void setFollower_cnt(String follower_cnt) {
		this.follower_cnt = follower_cnt;
	}
	public String getProfile_origin() {
		return profile_origin;
	}
	public void setProfile_origin(String profile_origin) {
		this.profile_origin = profile_origin;
	}
	public String getProfile_system() {
		return profile_system;
	}
	public void setProfile_system(String profile_system) {
		this.profile_system = profile_system;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getAddr4() {
		return addr4;
	}
	public void setAddr4(String addr4) {
		this.addr4 = addr4;
	}
	public List<Community_BoardVO> getBvo() {
		return bvo;
	}
	public void setBvo(List<Community_BoardVO> bvo) {
		this.bvo = bvo;
	}
}
