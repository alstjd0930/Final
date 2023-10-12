package kh.groupware.stream.attend.model.vo;

import org.springframework.stereotype.Component;

@Component
public class AttendVo {
//	ATDATE     NOT NULL DATE         
//	USERID     NOT NULL VARCHAR2(40) 
//	ATSTATENO  NOT NULL NUMBER(1)    
//	ATINTIME   NOT NULL DATE         
//	ATOUTTIME           DATE         
//	ATWORKHOUR NOT NULL NUMBER 

	private String atdate;
	private String userid;
	private int atstateno;
	private String atintime;
	private String atouttime;
	private int atworkhour;
	
	@Override
	public String toString() {
		return "AttendVo [atdate=" + atdate + ", userid=" + userid + ", atstateno=" + atstateno + ", atintime="
				+ atintime + ", atouttime=" + atouttime + ", atworkhour=" + atworkhour + "]";
	}

	public AttendVo() {
		super();
	}

	public AttendVo(String atdate, String userid, int atstateno, String atintime, String atouttime, int atworkhour) {
		super();
		this.atdate = atdate;
		this.userid = userid;
		this.atstateno = atstateno;
		this.atintime = atintime;
		this.atouttime = atouttime;
		this.atworkhour = atworkhour;
	}

	public String getAtdate() {
		return atdate;
	}

	public void setAtdate(String atdate) {
		this.atdate = atdate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getAtstateno() {
		return atstateno;
	}

	public void setAtstateno(int atstateno) {
		this.atstateno = atstateno;
	}

	public String getAtintime() {
		return atintime;
	}

	public void setAtintime(String atintime) {
		this.atintime = atintime;
	}

	public String getAtouttime() {
		return atouttime;
	}

	public void setAtouttime(String atouttime) {
		this.atouttime = atouttime;
	}

	public int getAtworkhour() {
		return atworkhour;
	}

	public void setAtworkhour(int atworkhour) {
		this.atworkhour = atworkhour;
	}
	
	
}

	

