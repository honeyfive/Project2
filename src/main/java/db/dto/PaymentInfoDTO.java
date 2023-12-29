package db.dto;

public class PaymentInfoDTO {
	public int payment_number;
	public int payment_price;
	public String payment_type;
	public String payment_time;
	public int reservation_number;
	public int payment_state;
	public String paymentDate;
	public String totalAmount;
	public String paymentCount;
	

	public PaymentInfoDTO(int payment_number, int payment_price, String payment_type, String payment_time,
			int reservation_number, int payment_state) {
		super();
		this.payment_number = payment_number;
		this.payment_price = payment_price;
		this.payment_type = payment_type;
		this.payment_time = payment_time;
		this.reservation_number = reservation_number;
		this.payment_state = payment_state;
	}
	
	public PaymentInfoDTO(String payment_time, int payment_price) {
		super();
		this.payment_time = payment_time;
		this.payment_price = payment_price;
	}
	
	public PaymentInfoDTO(String paymentDate, String totalAmount, String paymentCount) {
        this.paymentDate = paymentDate;
        this.totalAmount = totalAmount;
        this.paymentCount = paymentCount;
    }

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getPaymentCount() {
		return paymentCount;
	}

	public void setPaymentCount(String paymentCount) {
		this.paymentCount = paymentCount;
	}

	public int getPayment_number() {
		return payment_number;
	}

	public void setPayment_number(int payment_number) {
		this.payment_number = payment_number;
	}

	public int getPayment_price() {
		return payment_price;
	}

	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}

	public String getPayment_type() {
		return payment_type;
	}

	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}

	public String getPayment_time() {
		return payment_time;
	}

	public void setPayment_time(String payment_time) {
		this.payment_time = payment_time;
	}

	public int getReservation_number() {
		return reservation_number;
	}

	public void setReservation_number(int reservation_number) {
		this.reservation_number = reservation_number;
	}

	public int getPayment_state() {
		return payment_state;
	}

	public void setPayment_state(int payment_state) {
		this.payment_state = payment_state;
	}

	public PaymentInfoDTO(String payment_type) {
		super();
		this.payment_type = payment_type;
	}
	
	

}
