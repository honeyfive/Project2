package db.dto;

public class CarAvailableDTO {
	
	String car_number;
	String state;
	
	public CarAvailableDTO(String car_number, String state) {
		super();
		this.car_number = car_number;
		this.state = state;
	}

	public String getCar_number() {
		return car_number;
	}

	public void setCar_nember(String car_number) {
		this.car_number = car_number;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	
	
}
