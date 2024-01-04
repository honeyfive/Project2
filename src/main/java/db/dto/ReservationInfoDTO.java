package db.dto;

public class ReservationInfoDTO {
	int reservation_number;
	String rental_place;
	String return_place;
	String rental_date;
	String return_date;
	int total_rental_date;
	int total_rental_time;
	int insurance_number;
	String car_number;
	int membership_number;
	int payment_number;

	public ReservationInfoDTO(int reservation_number, String rental_place, String return_place, String rental_date,
			String return_date, int total_rental_date, int total_rental_time, int insurance_number, String car_number,
			int membership_number, int payment_number) {
		super();
		this.reservation_number = reservation_number;
		this.rental_place = rental_place;
		this.return_place = return_place;
		this.rental_date = rental_date;
		this.return_date = return_date;
		this.total_rental_date = total_rental_date;
		this.total_rental_time = total_rental_time;
		this.insurance_number = insurance_number;
		this.car_number = car_number;
		this.membership_number = membership_number;
		this.payment_number = payment_number;
	}
	
	public ReservationInfoDTO(){}

	public int getReservation_number() {
		return reservation_number;
	}

	public void setReservation_number(int reservation_number) {
		this.reservation_number = reservation_number;
	}

	public String getRental_place() {
		return rental_place;
	}

	public void setRental_place(String rental_place) {
		this.rental_place = rental_place;
	}

	public String getReturn_place() {
		return return_place;
	}

	public void setReturn_place(String return_place) {
		this.return_place = return_place;
	}

	public String getRental_date() {
		return rental_date;
	}

	public void setRental_date(String rental_date) {
		this.rental_date = rental_date;
	}

	public String getReturn_date() {
		return return_date;
	}

	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}

	public int getTotal_rental_date() {
		return total_rental_date;
	}

	public void setTotal_rental_date(int total_rental_date) {
		this.total_rental_date = total_rental_date;
	}

	public int getTotal_rental_time() {
		return total_rental_time;
	}

	public void setTotal_rental_time(int total_rental_time) {
		this.total_rental_time = total_rental_time;
	}

	public int getInsurance_number() {
		return insurance_number;
	}

	public void setInsurance_number(int insurance_number) {
		this.insurance_number = insurance_number;
	}

	public String getCar_number() {
		return car_number;
	}

	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}

	public int getMembership_number() {
		return membership_number;
	}

	public void setMembership_number(int membership_number) {
		this.membership_number = membership_number;
	}

	public int getPayment_number() {
		return payment_number;
	}

	public void setPayment_number(int payment_number) {
		this.payment_number = payment_number;
	}

	public ReservationInfoDTO(String rental_place) {
		super();
		this.rental_place = rental_place;
	}

}
