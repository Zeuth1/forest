package com.kh.forest.helpcenter.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

// 문의 등록시 필요한 정보들

@Component
public class Notice implements java.io.Serializable {

	private String NOTICE_NO;
	private String USER_NO;
	private String NOTICE_TITLE;
	private String NOTICE_CONTENT;
	private Date NOTICE_DATE;
	private String NOTICE_PWD;

	// 임시
	private String user_id;
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	
	
	public String getNOTICE_NO() {
		return NOTICE_NO;
	}

	public void setNOTICE_NO(String nOTICE_NO) {
		NOTICE_NO = nOTICE_NO;
	}

	public String getUSER_NO() {
		return USER_NO;
	}

	public void setUSER_NO(String uSER_NO) {
		USER_NO = uSER_NO;
	}

	public String getNOTICE_TITLE() {
		return NOTICE_TITLE;
	}

	public void setNOTICE_TITLE(String nOTICE_TITLE) {
		NOTICE_TITLE = nOTICE_TITLE;
	}

	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}

	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}

	public Date getNOTICE_DATE() {
		return NOTICE_DATE;
	}

	public void setNOTICE_DATE(Date nOTICE_DATE) {
		NOTICE_DATE = nOTICE_DATE;
	}

	public String getNOTICE_PWD() {
		return NOTICE_PWD;
	}

	public void setNOTICE_PWD(String nOTICE_PWD) {
		NOTICE_PWD = nOTICE_PWD;
	}

	@Override
	public String toString() {
		return " [NOTICE_NO=" + NOTICE_NO + ", USER_NO=" + USER_NO + ", NOTICE_TITLE=" + NOTICE_TITLE
				+ ", NOTICE_CONTENT=" + NOTICE_CONTENT + ", NOTICE_DATE=" + NOTICE_DATE + ", NOTICE_PWD=" + NOTICE_PWD
				+ "]";
	}

}
