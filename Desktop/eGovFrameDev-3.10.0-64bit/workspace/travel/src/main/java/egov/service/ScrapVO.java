package egov.service;

public class ScrapVO {
	int unq;
	int punq; // 업체 고유번호 값
	String userid; // 회원 아이디
	String title; // 업체 상호명
	String topmenu; // 업체 대표 메뉴
	String grade; // 업체 평점
	String address; // 주소
	int status; // 업체 상태 0,1 0:스크랩 X, 1:스크랩 O
	String category; // 숙박, 음식점 , 관광지
	int count; // 스크랩 유무 확인 : 없을 시 insert, 있을 시 update
	
	// 총 데이터 개수
	int total2 = 0;	
	// 총 페이지 개수
	int total_page2 = 1;	
	// 출력 페이지 번호
	int page_no2 = 1;	
	// 출력 페이지 시작 행 번호
	int rownum2 = 1;	
	// SQL 범위 시작번호 
	int s_no2 = 1;	
	// SQL 범위 끝번호
	int e_no2 = 10;	
	// 한 화면에 출력할 행 개수
	int page_unit2 = 5;	
	// 한 화면에 출력할 페이지 개수
	int page_size2 = 10;	
	int page_sno2 = 1;
	int page_eno2 = page_sno2 + (page_size2-1);
	
	public int getTotal2() {
		return total2;
	}
	public void setTotal2(int total2) {
		this.total2 = total2;
	}
	public int getTotal_page2() {
		return total_page2;
	}
	public void setTotal_page2(int total_page2) {
		this.total_page2 = total_page2;
	}
	public int getPage_no2() {
		return page_no2;
	}
	public void setPage_no2(int page_no2) {
		this.page_no2 = page_no2;
	}
	public int getRownum2() {
		return rownum2;
	}
	public void setRownum2(int rownum2) {
		this.rownum2 = rownum2;
	}
	public int getS_no2() {
		return s_no2;
	}
	public void setS_no2(int s_no2) {
		this.s_no2 = s_no2;
	}
	public int getE_no2() {
		return e_no2;
	}
	public void setE_no2(int e_no2) {
		this.e_no2 = e_no2;
	}
	public int getPage_unit2() {
		return page_unit2;
	}
	public void setPage_unit2(int page_unit2) {
		this.page_unit2 = page_unit2;
	}
	public int getPage_size2() {
		return page_size2;
	}
	public void setPage_size2(int page_size2) {
		this.page_size2 = page_size2;
	}
	public int getPage_sno2() {
		return page_sno2;
	}
	public void setPage_sno2(int page_sno2) {
		this.page_sno2 = page_sno2;
	}
	public int getPage_eno2() {
		return page_eno2;
	}
	public void setPage_eno2(int page_eno2) {
		this.page_eno2 = page_eno2;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getUnq() {
		return unq;
	}
	public void setUnq(int unq) {
		this.unq = unq;
	}
	public int getPunq() {
		return punq;
	}
	public void setPunq(int punq) {
		this.punq = punq;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTopmenu() {
		return topmenu;
	}
	public void setTopmenu(String topmenu) {
		this.topmenu = topmenu;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
