package egov.service;

public class TourVO {
	
	String title;
	String zipcode;
	String address;
	double latitude;
	double longitude;
	String heritage;
	String telephone;
	String open;
	String closed;
	String experienceinfo;
	String experiencenumber;
	String accommodatenumber;
	String availabletime;
	String car;
	String babycarriage;
	String pet;
	
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
	public String getRegionDetail() {
		return regionDetail;
	}
	public void setRegionDetail(String regionDetail) {
		this.regionDetail = regionDetail;
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
	public int getPage_no() {
		return page_no;
	}
	public void setPage_no(int page_no) {
		this.page_no = page_no;
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
	public String getHeritage() {
		return heritage;
	}
	public void setHeritage(String heritage) {
		this.heritage = heritage;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getClosed() {
		return closed;
	}
	public void setClosed(String closed) {
		this.closed = closed;
	}
	public String getExperienceinfo() {
		return experienceinfo;
	}
	public void setExperienceinfo(String experienceinfo) {
		this.experienceinfo = experienceinfo;
	}
	public String getExperiencenumber() {
		return experiencenumber;
	}
	public void setExperiencenumber(String experiencenumber) {
		this.experiencenumber = experiencenumber;
	}
	public String getAccommodatenumber() {
		return accommodatenumber;
	}
	public void setAccommodatenumber(String accommodatenumber) {
		this.accommodatenumber = accommodatenumber;
	}
	public String getAvailabletime() {
		return availabletime;
	}
	public void setAvailabletime(String availabletime) {
		this.availabletime = availabletime;
	}
	public String getCar() {
		return car;
	}
	public void setCar(String car) {
		this.car = car;
	}
	public String getBabycarriage() {
		return babycarriage;
	}
	public void setBabycarriage(String babycarriage) {
		this.babycarriage = babycarriage;
	}
	public String getPet() {
		return pet;
	}
	public void setPet(String pet) {
		this.pet = pet;
	}
	
	
}
