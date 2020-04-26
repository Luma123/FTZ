package com.web.entity;



public class Users {
	private Long userId;
	private String password;
	private String phonenumber;
	private String regDate;
	private Integer isVIP;
	private Double money;
	private Double moneyWait;
	private Integer book;
	private Integer photo;
	private Integer sex;
   private Integer age;
   private String name;
   private String occupation;
   private Integer adminFlag;
   private String lastLoginTime;
   private Integer loginNum;
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public Integer getIsVIP() {
		return isVIP;
	}
	public void setIsVIP(Integer isVIP) {
		this.isVIP = isVIP;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public Double getMoneyWait() {
		return moneyWait;
	}
	public void setMoneyWait(Double moneyWait) {
		this.moneyWait = moneyWait;
	}
	public Integer getBook() {
		return book;
	}
	public void setBook(Integer book) {
		this.book = book;
	}
	public Integer getPhoto() {
		return photo;
	}
	public void setPhoto(Integer photo) {
		this.photo = photo;
	}
	public Integer getAdminFlag() {
		return adminFlag;
	}

	public Users(Long userId, String password, String phonenumber, String regDate, Integer isVIP, Double money,
			Double moneyWait, Integer book, Integer photo,Integer sex,String occupation,Integer age,String name,Integer adminFlag) {
		super();
		this.userId = userId;
		this.password = password;
		this.phonenumber = phonenumber;
		this.regDate = regDate;
		this.isVIP = isVIP;
		this.money = money;
		this.moneyWait = moneyWait;
		this.book = book;
		this.photo = photo;
		this.sex = sex;
		this.occupation = occupation;
		this.age = age;
		this.name = name;
		this.adminFlag=adminFlag;
		
	}

	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAdminFlag(Integer adminFlag) {
		this.adminFlag = adminFlag;
	}
	public Users() {
		super();
	}
	
	public String getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public Integer getLoginNum() {
		return loginNum;
	}
	public void setLoginNum(Integer loginNum) {
		this.loginNum = loginNum;
	}
	@Override
	public String toString() {
		return "Users [userId=" + userId + ", password=" + password + ", phonenumber=" + phonenumber + ", regDate="
				+ regDate + ", isVIP=" + isVIP + ", money=" + money + ", moneyWait=" + moneyWait + ", book=" + book
				+ ", photo=" + photo + ", sex=" + sex + ", age=" + age + ", name=" + name + ", occupation=" + occupation
				+ ", adminFlag=" + adminFlag + ", lastLoginTime=" + lastLoginTime + ", loginNum=" + loginNum + "]";
	}
	
	
	

}
