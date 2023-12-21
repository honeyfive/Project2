package db.dto;

public class InsuranceInfoDTO {
	public int insurance_number;
	public String insurance_type;
	public int insurance_price;

	public InsuranceInfoDTO(int insurance_number, String insurance_type, int insurance_price) {
		super();
		this.insurance_number = insurance_number;
		this.insurance_type = insurance_type;
		this.insurance_price = insurance_price;
	}

	public int getInsurance_number() {
		return insurance_number;
	}

	public void setInsurance_number(int insurance_number) {
		this.insurance_number = insurance_number;
	}

	public String getInsurance_type() {
		return insurance_type;
	}

	public void setInsurance_type(String insurance_type) {
		this.insurance_type = insurance_type;
	}

	public int getInsurance_price() {
		return insurance_price;
	}

	public void setInsurance_price(int insurance_price) {
		this.insurance_price = insurance_price;
	}

}
