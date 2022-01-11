package egov.service;

public class LineReviewVO {
	
	int unq;
	int punq;
	String content;
	String name;
	String pass;
	int grade;
	String rdate;
	String udate;
	String userid;
	String category;
	String title;
	
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
	
	// 총 데이터 개수
	int total3 = 0;	
	// 총 페이지 개수
	int total_page3 = 1;	
	// 출력 페이지 번호
	int page_no3 = 1;	
	// 출력 페이지 시작 행 번호
	int rownum3 = 1;	
	// SQL 범위 시작번호 
	int s_no3 = 1;	
	// SQL 범위 끝번호
	int e_no3 = 10;	
	// 한 화면에 출력할 행 개수
	int page_unit3 = 5;	
	// 한 화면에 출력할 페이지 개수
	int page_size3 = 10;	
	int page_sno3 = 1;
	int page_eno3 = page_sno3 + (page_size3-1);
	
	
	public int getTotal3() {
		return total3;
	}
	public void setTotal3(int total3) {
		this.total3 = total3;
	}
	public int getTotal_page3() {
		return total_page3;
	}
	public void setTotal_page3(int total_page3) {
		this.total_page3 = total_page3;
	}
	public int getPage_no3() {
		return page_no3;
	}
	public void setPage_no3(int page_no3) {
		this.page_no3 = page_no3;
	}
	public int getRownum3() {
		return rownum3;
	}
	public void setRownum3(int rownum3) {
		this.rownum3 = rownum3;
	}
	public int getS_no3() {
		return s_no3;
	}
	public void setS_no3(int s_no3) {
		this.s_no3 = s_no3;
	}
	public int getE_no3() {
		return e_no3;
	}
	public void setE_no3(int e_no3) {
		this.e_no3 = e_no3;
	}
	public int getPage_unit3() {
		return page_unit3;
	}
	public void setPage_unit3(int page_unit3) {
		this.page_unit3 = page_unit3;
	}
	public int getPage_size3() {
		return page_size3;
	}
	public void setPage_size3(int page_size3) {
		this.page_size3 = page_size3;
	}
	public int getPage_sno3() {
		return page_sno3;
	}
	public void setPage_sno3(int page_sno3) {
		this.page_sno3 = page_sno3;
	}
	public int getPage_eno3() {
		return page_eno3;
	}
	public void setPage_eno3(int page_eno3) {
		this.page_eno3 = page_eno3;
	}
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content.trim();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getUdate() {
		return udate;
	}
	public void setUdate(String udate) {
		this.udate = udate;
	}
	
	
}
