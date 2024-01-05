package db.dto;

public class ReservationHistoryDTO {
	public String rental_date;
	public String rental_place;
	public String real_return_date;
	public String return_place;
	public int overdue_history;
	public int total_rental_date;
	public String car_number;

	public ReservationHistoryDTO(String rental_date, String rental_place, String real_return_date, String return_place,
			int overdue_history, int total_rental_date, String car_number) {
		super();
		this.rental_date = rental_date;
		this.rental_place = rental_place;
		this.real_return_date = real_return_date;
		this.return_place = return_place;
		this.overdue_history = overdue_history;
		this.total_rental_date = total_rental_date;
		this.car_number = car_number;
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

	public String getReal_return_date() {
		return real_return_date;
	}

	public void setReal_return_date(String real_return_date) {
		this.real_return_date = real_return_date;
	}

	public String getReturn_place() {
		return return_place;
	}

	public void setReturn_place(String return_place) {
		this.return_place = return_place;
	}

	public int getOverdue_history() {
		return overdue_history;
	}

	public void setOverdue_history(int overdue_history) {
		this.overdue_history = overdue_history;
	}

	public int getTotal_rental_date() {
		return total_rental_date;
	}

	public void setTotal_rental_date(int total_rental_date) {
		this.total_rental_date = total_rental_date;
	}

	public String getCar_number() {
		return car_number;
	}

	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}

	@Override
	public String toString() {
		return "ReservationHistoryDTO [rental_date=" + rental_date + ", rental_place=" + rental_place
				+ ", real_return_date=" + real_return_date + ", return_place=" + return_place + ", overdue_history="
				+ overdue_history + ", total_rental_date=" + total_rental_date + ", car_number=" + car_number + "]";
	}
}