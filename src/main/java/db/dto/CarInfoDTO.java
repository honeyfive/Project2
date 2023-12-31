package db.dto;

public class CarInfoDTO {
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
	String car_image;

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
        if (car_size.equals("M")) {
            return "중형";
        } else if (car_size.equals("SPORT")) {
            return "스포츠";
        } else if (car_size.equals("S")) {
            return "경차";
        } else if (car_size.equals("L_SEDAN")) {
            return "대형 세단";
        } else if (car_size.equals("L_RV")) {
            return "대형 RV";
        } else if (car_size.equals("S_SUV")) {
            return "소형 SUV";
        } else {
            // 다른 경우에 대한 처리 (예: 기본값 반환)
            return car_size;
        }
    }

	public void setCar_size(String car_size) {
		this.car_size = car_size;
	}

	public String getCar_type() {
        if (car_type.equals("E")) {
            return "전기";
        } else if (car_type.equals("G")) {
            return "휘발유";
        } else if (car_type.equals("D")) {
            return "경유";
        } else if (car_type.equals("H")) {
            return "수소";
        } else {
            // 다른 경우에 대한 처리 (예: 기본값 반환)
            return car_type;
        }
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

	public String getCar_image() {
		return car_image;
	}

	public void setCar_image(String car_image) {
		this.car_image = car_image;
	}

	public CarInfoDTO(String car_number, String car_name, String car_size, String car_type, int passenger_count,
			int vehicle_rating, String company, String color, int model_year, String management_status, String option1,
			String option2, int accident_history, String car_image) {
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
		this.car_image = car_image;
	}

	public CarInfoDTO(String car_image, String car_number, String car_name, String car_size, int model_year) {
		super();
		this.car_number = car_number;
		this.car_name = car_name;
		this.car_size = car_size;
		this.model_year = model_year;
		this.car_image = car_image;
	}

	public CarInfoDTO() {}
}