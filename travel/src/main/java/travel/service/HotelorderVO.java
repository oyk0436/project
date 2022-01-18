package travel.service;

public class HotelorderVO {
	
	int unq;
	String itemname;
	int price;
	String userid;
	String odate;
	
	// 총 데이터 개수
	int total1 = 0;	
	// 총 페이지 개수
	int total_page1 = 1;	
	// 출력 페이지 번호
	int page_no1 = 1;	
	// 출력 페이지 시작 행 번호
	int rownum1 = 1;	
	// SQL 범위 시작번호 
	int s_no1 = 1;	
	// SQL 범위 끝번호
	int e_no1 = 10;	
	// 한 화면에 출력할 행 개수
	int page_unit1 = 5;	
	// 한 화면에 출력할 페이지 개수
	int page_size1 = 10;	
	int page_sno1 = 1;
	int page_eno1 = page_sno1 + (page_size1-1);

	
	public int getTotal1() {
		return total1;
	}
	public void setTotal1(int total1) {
		this.total1 = total1;
	}
	public int getTotal_page1() {
		return total_page1;
	}
	public void setTotal_page1(int total_page1) {
		this.total_page1 = total_page1;
	}
	public int getPage_no1() {
		return page_no1;
	}
	public void setPage_no1(int page_no1) {
		this.page_no1 = page_no1;
	}
	public int getRownum1() {
		return rownum1;
	}
	public void setRownum1(int rownum1) {
		this.rownum1 = rownum1;
	}
	public int getS_no1() {
		return s_no1;
	}
	public void setS_no1(int s_no1) {
		this.s_no1 = s_no1;
	}
	public int getE_no1() {
		return e_no1;
	}
	public void setE_no1(int e_no1) {
		this.e_no1 = e_no1;
	}
	public int getPage_unit1() {
		return page_unit1;
	}
	public void setPage_unit1(int page_unit1) {
		this.page_unit1 = page_unit1;
	}
	public int getPage_size1() {
		return page_size1;
	}
	public void setPage_size1(int page_size1) {
		this.page_size1 = page_size1;
	}
	public int getPage_sno1() {
		return page_sno1;
	}
	public void setPage_sno1(int page_sno1) {
		this.page_sno1 = page_sno1;
	}
	public int getPage_eno1() {
		return page_eno1;
	}
	public void setPage_eno1(int page_eno1) {
		this.page_eno1 = page_eno1;
	}
	public int getUnq() {
		return unq;
	}
	public void setUnq(int unq) {
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
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	
}
