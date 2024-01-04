package db.dto;

public class ReservationMyPageDTO {
	public ReservationMyPageDTO(int reservation_number, String rental_date, String rental_place, String return_date,
			String return_place, String car_number) {
		super();
		this.reservation_number = reservation_number;
		this.rental_date = rental_date;
		this.rental_place = rental_place;
		this.return_date = return_date;
		this.return_place = return_place;
		this.car_number = car_number;
	}

	public int getReservation_number() {
		return reservation_number;
	}

	public void setResevation_number(int reservation_number) {
		this.reservation_number = reservation_number;
	}

	public String getRental_date() {
		return rental_date;
	}

	public void setRental_date(String rental_date) {
		this.rental_date = rental_date;
	}

	public String getRental_place() {
		return rental_place;
	}

	public void setRental_place(String rental_place) {
		this.rental_place = rental_place;
	}

	public String getReturn_date() {
		return return_date;
	}

	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}

	public String getReturn_place() {
		return return_place;
	}

	public void setReturn_place(String return_place) {
		this.return_place = return_place;
	}

	public String getCar_number() {
		return car_number;
	}

	@Override
	public String toString() {
		return "ReservationMyPageDTO [rental_date=" + rental_date + ", rental_place=" + rental_place + ", return_date="
				+ return_date + ", return_place=" + return_place + ", car_number=" + car_number + "]";
	}

	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}

	int reservation_number;
	String rental_date;
	String rental_place;
	String return_date;
	String return_place;
	String car_number;

}