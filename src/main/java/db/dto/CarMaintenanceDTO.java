package db.dto;

public class CarMaintenanceDTO {
	
	String maintenance_num;
	String car_number;
	String start_date;
	String completion_date;
	String maintenance_history;
	
	public CarMaintenanceDTO(String maintenance_num, String car_number, String start_date, String completion_date,
			String maintenance_history) {
		super();
		this.maintenance_num = maintenance_num;
		this.car_number = car_number;
		this.start_date = start_date;
		this.completion_date = completion_date;
		this.maintenance_history = maintenance_history;
	}

	public String getMaintenance_num() {
		return maintenance_num;
	}

	public void setMaintenance_num(String maintenance_num) {
		this.maintenance_num = maintenance_num;
	}

	public String getCar_number() {
		return car_number;
	}

	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getCompletion_date() {
		return completion_date;
	}

	public void setCompletion_date(String completion_date) {
		this.completion_date = completion_date;
	}

	public String getMaintenance_history() {
		return maintenance_history;
	}

	public void setMaintenance_history(String maintenance_history) {
		this.maintenance_history = maintenance_history;
	}
	
	
	
}
