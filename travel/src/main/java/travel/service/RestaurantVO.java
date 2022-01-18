package travel.service;

public class RestaurantVO {
	
	String title;
	String zipcode;
	String manager;
	String address;
	double latitude = 0;
	double longitude = 0;
	String summary;
	String telephone;
	String parking;
	String child;
	String availiabletime;
	String closed;
	String topmenu;
	String menu;
	String smoking;
	String packaging;
	String information;
	int unq = 0;
	int hits = 0;
	int grade = 0;
	String regionDetail;
	String s_field;
	String s_text;

	// 총 데이터 개수
	int total = 0;
	// 총 페이지 개수
	int total_page = 1;
	// 출력 페이지 번호
	int page_no = 1;
	// 출력 페이지 시작 행 번호
	int rownum = 1;
	// SQL 범위 시작번호 
	int s_no = 1;
	// SQL 범위 끝번호
	int e_no = 10;
	// 한 화면에 출력할 행 개수
	int page_unit = 10;
	// 한 화면에 출력할 페이지 개수
	int page_size = 10;
	int page_sno = 1;
	int page_eno = page_sno + (page_size-1);
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getTotal_page() {
		return total_page;
	}
	public void setTotal_page(int total_page) {
		this.total_page = total_page;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public int getPage_unit() {
		return page_unit;
	}
	public void setPage_unit(int page_unit) {
		this.page_unit = page_unit;
	}
	public int getPage_size() {
		return page_size;
	}
	public void setPage_size(int page_size) {
		this.page_size = page_size;
	}
	public int getPage_sno() {
		return page_sno;
	}
	public void setPage_sno(int page_sno) {
		this.page_sno = page_sno;
	}
	public int getPage_eno() {
		return page_eno;
	}
	public void setPage_eno(int page_eno) {
		this.page_eno = page_eno;
	}
	public String getS_field() {
		return s_field;
	}
	public void setS_field(String s_field) {
		this.s_field = s_field;
	}
	public String getS_text() {
		return s_text;
	}
	public void setS_text(String s_text) {
		this.s_text = s_text;
	}
	public String getRegionDetail() {
		return regionDetail;
	}
	public void setRegionDetail(String regionDetail) {
		this.regionDetail = regionDetail;
	}
	public int getPage_no() {
		return page_no;
	}
	public void setPage_no(int page_no) {
		this.page_no = page_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getChild() {
		return child;
	}
	public void setChild(String child) {
		this.child = child;
	}
	public String getAvailiabletime() {
		return availiabletime;
	}
	public void setAvailiabletime(String availiabletime) {
		this.availiabletime = availiabletime;
	}
	public String getClosed() {
		return closed;
	}
	public void setClosed(String closed) {
		this.closed = closed;
	}
	public String getTopmenu() {
		return topmenu;
	}
	public void setTopmenu(String topmenu) {
		this.topmenu = topmenu;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getSmoking() {
		return smoking;
	}
	public void setSmoking(String smoking) {
		this.smoking = smoking;
	}
	public String getPackaging() {
		return packaging;
	}
	public void setPackaging(String packaging) {
		this.packaging = packaging;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public int getUnq() {
		return unq;
	}
	public void setUnq(int unq) {
		this.unq = unq;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
}
