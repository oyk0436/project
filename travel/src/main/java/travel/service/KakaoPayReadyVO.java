 package travel.service;

import java.util.Date;

public class KakaoPayReadyVO {
	 private String tid, next_redirect_pc_url;
	    private Date created_at;
	    private String itemname;
	    private String orderid;
	    private String price;
	    private String userid;
	    
	    
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public String getItemname() {
			return itemname;
		}
		public void setItemname(String itemname) {
			this.itemname = itemname;
		}
		public String getOrderid() {
			return orderid;
		}
		public void setOrderid(String orderid) {
			this.orderid = orderid;
		}
		public String getPrice() {
			return price;
		}
		public void setPrice(String price) {
			this.price = price;
		}
		public String getTid() {
			return tid;
		}
		public void setTid(String tid) {
			this.tid = tid;
		}
		public String getNext_redirect_pc_url() {
			return next_redirect_pc_url;
		}
		public void setNext_redirect_pc_url(String next_redirect_pc_url) {
			this.next_redirect_pc_url = next_redirect_pc_url;
		}
		public Date getCreated_at() {
			return created_at;
		}
		public void setCreated_at(Date created_at) {
			this.created_at = created_at;
		}
}
