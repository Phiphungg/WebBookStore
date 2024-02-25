package model;

import java.sql.Date;

public class User {
	private int userID;
	private String userName;
	private Date birthday;
	private String email;
	private String password;
	private String gender;
	private boolean receiveNews;
	private String verifycationCode;
	private Date effectiveTime;
	private boolean authenticationStatus;

	public User() {
		// TODO Auto-generated constructor stub
	}

//	public User(String userName, Date birthday, String email, String password, String gender, boolean receiveNews) {
//		super();
//		this.userName = userName;
//		this.birthday = birthday;
//		this.email = email;
//		this.password = password;
//		this.gender = gender;
//		this.receiveNews = receiveNews;
//	}

	public User(int userID, String userName, Date birthday, String email, String password, String gender,
			boolean receiveNews) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.birthday = birthday;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.receiveNews = receiveNews;
	}

	public User(String userName, Date birthday, String email, String password, String gender, boolean receiveNews) {
		super();
		this.userName = userName;
		this.birthday = birthday;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.receiveNews = receiveNews;
	}

	public User(int userID, String userName, Date birthday, String email, String password, String gender,
			boolean receiveNews, String verifycationCode, Date effectiveTime, boolean authenticationStatus) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.birthday = birthday;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.receiveNews = receiveNews;
		this.verifycationCode = verifycationCode;
		this.effectiveTime = effectiveTime;
		this.authenticationStatus = authenticationStatus;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public boolean isReceiveNews() {
		return receiveNews;
	}

	public void setReceiveNews(boolean receiveNews) {
		this.receiveNews = receiveNews;
	}

	public String getVerifycationCode() {
		return verifycationCode;
	}

	public void setVerifycationCode(String verifycationCode) {
		this.verifycationCode = verifycationCode;
	}

	public Date getEffectiveTime() {
		return effectiveTime;
	}

	public void setEffectiveTime(Date effectiveTime) {
		this.effectiveTime = effectiveTime;
	}

	public boolean isAuthenticationStatus() {
		return authenticationStatus;
	}

	public void setAuthenticationStatus(boolean authenticationStatus) {
		this.authenticationStatus = authenticationStatus;
	}

	/* @Override */
	/*
	 * public String toString() { return "User [userID=" + userID + ", userName=" +
	 * userName + ", birthday=" + birthday + ", email=" + email + ", password=" +
	 * password + ", gender=" + gender + ", receiveNews=" + receiveNews +
	 * ", verifycationCode=" + verifycationCode + ", effectiveTime=" + effectiveTime
	 * + ", authenticationStatus=" + authenticationStatus + "]"; }
	 */

	@Override
	public String toString() {
		return "User [userID=" + userID + ", userName=" + userName + ", birthday=" + birthday + ", email=" + email
				+ ", password=" + password + ", gender=" + gender + ", receiveNews=" + receiveNews + "]";
	}

}
