package egov.service;

public class TravelVO {
	String title;
	String zipcode;
	String telephone;
	String address;
	double latitude;
	double longitude;
	String summary;
	String roomscale;
	String accommodatenumber;
	String roomnumber;
	String roomtype;
	String car;
	String checkin;
	String checkout;
	String homepage;
	String pickup;
	String restaurant;
	String facilities;
	String refund;
	
	String firstimage;
	int minest;
	String chkin;
	String chkout;
	String place="";
	String cityname;
	int areacode;
	String sigungucode;
	String totalcnt;
	String contentid;
	String contenttypeid;
	String roomimg1;
	String roomimg2;
	String roomimg3;
	String roomimg4;
	String roomimg5;
	String roomimg1alt;
	String roomoffseasonminfee1; /*비수기주중최소가격*/
	String roomoffseasonminfee2; /*비수기주말최소가격*/
	String roompeakseasonminfee1; /*성수기주중최소가격*/
	String roompeakseasonminfee2; /*성수기주말최소가격*/
	String roommaxcount;
	String overview;
	String tel;
	String day;
	String people;
	String roomcount;
	String price;
	double mapx;
	double mapy;
	
	
	public int getAreacode() {
		return areacode;
	}
	public String getSigungucode() {
		return sigungucode;
	}
	public void setSigungucode(String sigungucode) {
		this.sigungucode = sigungucode;
	}
	public String getRoomimg2() {
		return roomimg2;
	}
	public void setRoomimg2(String roomimg2) {
		this.roomimg2 = roomimg2;
	}
	public String getRoomimg3() {
		return roomimg3;
	}
	public void setRoomimg3(String roomimg3) {
		this.roomimg3 = roomimg3;
	}
	public String getRoomimg4() {
		return roomimg4;
	}
	public void setRoomimg4(String roomimg4) {
		this.roomimg4 = roomimg4;
	}
	public String getRoomimg5() {
		return roomimg5;
	}
	public void setRoomimg5(String roomimg5) {
		this.roomimg5 = roomimg5;
	}
	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getRoomcount() {
		return roomcount;
	}
	public void setRoomcount(String roomcount) {
		this.roomcount = roomcount;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public double getMapx() {
		return mapx;
	}
	public void setMapx(double mapx) {
		this.mapx = mapx;
	}
	public double getMapy() {
		return mapy;
	}
	public void setMapy(double mapy) {
		this.mapy = mapy;
	}
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	public int getMinest() {
		return minest;
	}
	public void setMinest(int minest) {
		this.minest = minest;
	}
	public String getChkin() {
		return chkin;
	}
	public void setChkin(String chkin) {
		this.chkin = chkin;
	}
	public String getChkout() {
		return chkout;
	}
	public void setChkout(String chkout) {
		this.chkout = chkout;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	public String getTotalcnt() {
		return totalcnt;
	}
	public void setTotalcnt(String totalcnt) {
		this.totalcnt = totalcnt;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getContenttypeid() {
		return contenttypeid;
	}
	public void setContenttypeid(String contenttypeid) {
		this.contenttypeid = contenttypeid;
	}
	public String getRoomimg1() {
		return roomimg1;
	}
	public void setRoomimg1(String roomimg1) {
		this.roomimg1 = roomimg1;
	}
	public String getRoomimg1alt() {
		return roomimg1alt;
	}
	public void setRoomimg1alt(String roomimg1alt) {
		this.roomimg1alt = roomimg1alt;
	}
	public String getRoomoffseasonminfee1() {
		return roomoffseasonminfee1;
	}
	public void setRoomoffseasonminfee1(String roomoffseasonminfee1) {
		this.roomoffseasonminfee1 = roomoffseasonminfee1;
	}
	public String getRoomoffseasonminfee2() {
		return roomoffseasonminfee2;
	}
	public void setRoomoffseasonminfee2(String roomoffseasonminfee2) {
		this.roomoffseasonminfee2 = roomoffseasonminfee2;
	}
	public String getRoompeakseasonminfee1() {
		return roompeakseasonminfee1;
	}
	public void setRoompeakseasonminfee1(String roompeakseasonminfee1) {
		this.roompeakseasonminfee1 = roompeakseasonminfee1;
	}
	public String getRoompeakseasonminfee2() {
		return roompeakseasonminfee2;
	}
	public void setRoompeakseasonminfee2(String roompeakseasonminfee2) {
		this.roompeakseasonminfee2 = roompeakseasonminfee2;
	}
	public String getRoommaxcount() {
		return roommaxcount;
	}
	public void setRoommaxcount(String roommaxcount) {
		this.roommaxcount = roommaxcount;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
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
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
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
	public String getRoomscale() {
		return roomscale;
	}
	public void setRoomscale(String roomscale) {
		this.roomscale = roomscale;
	}
	public String getAccommodatenumber() {
		return accommodatenumber;
	}
	public void setAccommodatenumber(String accommodatenumber) {
		this.accommodatenumber = accommodatenumber;
	}
	public String getRoomnumber() {
		return roomnumber;
	}
	public void setRoomnumber(String roomnumber) {
		this.roomnumber = roomnumber;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public String getCar() {
		return car;
	}
	public void setCar(String car) {
		this.car = car;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getPickup() {
		return pickup;
	}
	public void setPickup(String pickup) {
		this.pickup = pickup;
	}
	public String getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}
	public String getFacilities() {
		return facilities;
	}
	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	
	
}
