package db.dto;

public class ReservationCancelDTO {
	int reservation_number;
	int membership_number;
	int cancellation_fee;
	String cancellation_date;

	
	public int getReservation_number() {
		return reservation_number;
	}

	public void setReservation_number(int reservation_number) {
		this.reservation_number = reservation_number;
	}

	public int getMembership_number() {
		return membership_number;
	}

	public void setMembership_number(int membership_number) {
		this.membership_number = membership_number;
	}

	public int getCancellation_fee() {
		return cancellation_fee;
	}

	public void setCancellation_fee(int cancellation_fee) {
		this.cancellation_fee = cancellation_fee;
	}

	public String getCancellation_date() {
		return cancellation_date;
	}

	public void setCancellation_date(String cancellation_date) {
		this.cancellation_date = cancellation_date;
	}

	@Override
	public String toString() {
		return "ReservationCancelDTO [reservation_number=" + reservation_number + ", membership_number="
				+ membership_number + ", cancellation_fee=" + cancellation_fee + ", cancellation_date="
				+ cancellation_date + "]";
	}

	public ReservationCancelDTO(int reservation_number, int membership_number, int cancellation_fee,
			String cancellation_date) {
		super();
		this.reservation_number = reservation_number;
		this.membership_number = membership_number;
		this.cancellation_fee = cancellation_fee;
		this.cancellation_date = cancellation_date;
	}

}