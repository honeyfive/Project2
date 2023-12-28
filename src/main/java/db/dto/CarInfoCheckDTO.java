package db.dto;

public class CarInfoCheckDTO {

	String car_number;
	String car_name;
	String car_size;
	String car_type;
	int passenger_count;
	int vehicle_rating;
	String company;
	String color;
	int model_year;
	String management_status;
	String option1;
	String option2;
	int accident_history;
	public CarInfoCheckDTO(String car_number, String car_name, String car_size, String car_type, int passenger_count,
			int vehicle_rating, String company, String color, int model_year, String management_status, String option1,
			String option2, int accident_history) {
		super();
		this.car_number = car_number;
		this.car_name = car_name;
		this.car_size = car_size;
		this.car_type = car_type;
		this.passenger_count = passenger_count;
		this.vehicle_rating = vehicle_rating;
		this.company = company;
		this.color = color;
		this.model_year = model_year;
		this.management_status = management_status;
		this.option1 = option1;
		this.option2 = option2;
		this.accident_history = accident_history;
	}
	
	public CarInfoCheckDTO(String car_number) {
		super();
		this.car_number = car_number;
	}
	public String getCar_number() {
		return car_number;
	}
	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public String getCar_size() {
		return car_size;
	}
	public void setCar_size(String car_size) {
		this.car_size = car_size;
	}
	public String getCar_type() {
		return car_type;
	}
	public void setCar_type(String car_type) {
		this.car_type = car_type;
	}
	public int getPassenger_count() {
		return passenger_count;
	}
	public void setPassenger_count(int passenger_count) {
		this.passenger_count = passenger_count;
	}
	public int getVehicle_rating() {
		return vehicle_rating;
	}
	public void setVehicle_rating(int vehicle_rating) {
		this.vehicle_rating = vehicle_rating;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getModel_year() {
		return model_year;
	}
	public void setModel_year(int model_year) {
		this.model_year = model_year;
	}
	public String getManagement_status() {
		return management_status;
	}
	public void setManagement_status(String management_status) {
		this.management_status = management_status;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public int getAccident_history() {
		return accident_history;
	}
	public void setAccident_history(int accident_history) {
		this.accident_history = accident_history;
	}
	
	
}