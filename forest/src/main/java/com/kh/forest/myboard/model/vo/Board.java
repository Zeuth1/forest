package com.kh.forest.myboard.model.vo;

import java.sql.Date;

public class Board {
	private String Board_No;		//보드번호
	private String User_No;			//보드소유주번호
	private String Board_Type;		//보드타입
	private String Board_Title;		//보드이름
	private String Board_Date;		//보드생성일
	
	public Board(){}
	
	public Board(String board_No, String user_No, String board_Type, String board_Title, String board_Date) {
		super();
		Board_No = board_No;
		User_No = user_No;
		Board_Type = board_Type;
		Board_Title = board_Title;
		Board_Date = board_Date;
	}
	
	public String getBoard_No() {
		return Board_No;
	}
	public void setBoard_No(String board_No) {
		Board_No = board_No;
	}
	public String getUser_No() {
		return User_No;
	}
	public void setUser_No(String user_No) {
		User_No = user_No;
	}
	public String getBoard_Type() {
		return Board_Type;
	}
	public void setBoard_Type(String board_Type) {
		Board_Type = board_Type;
	}
	public String getBoard_Title() {
		return Board_Title;
	}
	public void setBoard_Title(String board_Title) {
		Board_Title = board_Title;
	}
	public String getBoard_Date() {
		return Board_Date;
	}
	public void setBoard_Date(String board_Date) {
		Board_Date = board_Date;
	}
	
	@Override
	public String toString() {
		return "Board [Board_No=" + Board_No + ", User_No=" + User_No + ", Board_Type=" + Board_Type + ", Board_Title="
				+ Board_Title + ", Board_Date=" + Board_Date + "]";
	}
	
	
	
}
