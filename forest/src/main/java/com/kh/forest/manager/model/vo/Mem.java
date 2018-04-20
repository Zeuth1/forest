package com.kh.forest.manager.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class Mem implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6989874075467533512L;
	
	private int user_no;
	private String user_id;
	private String user_pwd;
	private String gender;
	private String phone;
	private Date birthday;
	private String email;
	private String status;
	private String ulevel;
	private Date enrolldate;
	
	public Mem() {
		// TODO Auto-generated constructor stub
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUlevel() {
		return ulevel;
	}

	public void setUlevel(String ulevel) {
		this.ulevel = ulevel;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Member [user_no=" + user_no + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", gender=" + gender
				+ ", phone=" + phone + ", birthday=" + birthday + ", email=" + email + ", status=" + status
				+ ", ulevel=" + ulevel + ", enrolldate=" + enrolldate + "]";
	}

	
	
	
	
}
