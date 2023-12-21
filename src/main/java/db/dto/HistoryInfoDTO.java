package db.dto;

public class HistoryInfoDTO {
	public String reservation_number;
	public int membership_number;
	public String return_date;
	public String real_return_date;
	public int overdue_history;
	public String accident_history;
	
	public HistoryInfoDTO(String reservation_number, int membership_number, String return_date, String real_return_date,
			int overdue_history, String accident_history) {
		super();
		this.reservation_number = reservation_number;
		this.membership_number = membership_number;
		this.return_date = return_date;
		this.real_return_date = real_return_date;
		this.overdue_history = overdue_history;
		this.accident_history = accident_history;
	}

	public String getReservation_number() {
		return reservation_number;
	}

	public void setReservation_number(String reservation_number) {
		this.reservation_number = reservation_number;
	}

	public int getMembership_number() {
		return membership_number;
	}

	public void setMembership_number(int membership_number) {
		this.membership_number = membership_number;
	}

	public String getReturn_date() {
		return return_date;
	}

	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}

	public String getReal_return_date() {
		return real_return_date;
	}

	public void setReal_return_date(String real_return_date) {
		this.real_return_date = real_return_date;
	}

	public int getOverdue_history() {
		return overdue_history;
	}

	public void setOverdue_history(int overdue_history) {
		this.overdue_history = overdue_history;
	}

	public String getAccident_history() {
		return accident_history;
	}

	public void setAccident_history(String accident_history) {
		this.accident_history = accident_history;
	}
	
}
