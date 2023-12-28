package db.dto;

public class CarRentalManagementDTO {
	String car_number;
	int rental_costs;
	int rental_oil_reserves;
	int return_oil_reserves;
	
	
	public CarRentalManagementDTO(String car_number, int rental_costs, int rental_oil_reserves,
			int return_oil_reserves) {
		super();
		this.car_number = car_number;
		this.rental_costs = rental_costs;
		this.rental_oil_reserves = rental_oil_reserves;
		this.return_oil_reserves = return_oil_reserves;
	}


	public String getCar_number() {
		return car_number;
	}


	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}


	public int getRental_costs() {
		return rental_costs;
	}


	public void setRental_costs(int rental_costs) {
		this.rental_costs = rental_costs;
	}


	public int getRental_oil_reserves() {
		return rental_oil_reserves;
	}


	public void setRental_oil_reserves(int rental_oil_reserves) {
		this.rental_oil_reserves = rental_oil_reserves;
	}


	public int getReturn_oil_reserves() {
		return return_oil_reserves;
	}


	public void setReturn_oil_reserves(int return_oil_reserves) {
		this.return_oil_reserves = return_oil_reserves;
	}
	
	
	
}
