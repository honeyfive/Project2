package db.dto;

// 화면에서 필요한 차량 정보 + 렌탈 비용 조인 테이블을 위한 DTO
public class CarRentalInfoDTO {
	String car_number;
	String car_name;
	String car_size;
	String car_type;
	int model_year;
	int rental_costs;
	String car_image;

	public CarRentalInfoDTO(String car_number, String car_name, String car_size, String car_type, int model_year,
			int rental_costs, String car_image) {
		super();
		this.car_number = car_number;
		this.car_name = car_name;
		this.car_size = car_size;
		this.car_type = car_type;
		this.model_year = model_year;
		this.rental_costs = rental_costs;
		this.car_image = car_image;
	}

	@Override
	public String toString() {
		return "CarRentalInfoDTO [car_number=" + car_number + ", car_name=" + car_name + ", car_size=" + car_size
				+ ", car_type=" + car_type + ", model_year=" + model_year + ", rental_costs=" + rental_costs
				+ ", car_image=" + car_image + "]";
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

	public int getModel_year() {
		return model_year;
	}

	public void setModel_year(int model_year) {
		this.model_year = model_year;
	}

	public int getRental_costs() {
		return rental_costs;
	}

	public void setRental_costs(int rental_costs) {
		this.rental_costs = rental_costs;
	}

	public String getCar_image() {
		return car_image;
	}

	public void setCar_image(String car_image) {
		this.car_image = car_image;
	}

}