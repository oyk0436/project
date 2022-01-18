package travel.service;

import java.util.Date;

public class OrderVO {
	String unq;
	String itemname;
	int price;
	String userid;
	Date odate;
	public String getUnq() {
		return unq;
	}
	public void setUnq(String unq) {
		this.unq = unq;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
}
