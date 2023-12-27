package db.dto;

public class MemberInfoDTO {
	
	int membership_number;
	String name;
	int age;
	String tel;
	String id;
	String password;
	String email;
	String membership_level;
	String lisence_number;
	String gender;
	String birthday;
	String lisence_acquisition_date;
	int overdue_history;
	int use_count;
	
	
	public MemberInfoDTO(int membership_number, String name, int age, String tel, String id, String password,
			String email, String membership_level, String lisence_number, String gender, String birthday,
			String lisence_acquisition_date, int overdue_history, int use_count) {
		super();
		this.membership_number = membership_number;
		this.name = name;
		this.age = age;
		this.tel = tel;
		this.id = id;
		this.password = password;
		this.email = email;
		this.membership_level = membership_level;
		this.lisence_number = lisence_number;
		this.gender = gender;
		this.birthday = birthday;
		this.lisence_acquisition_date = lisence_acquisition_date;
		this.overdue_history = overdue_history;
		this.use_count = use_count;
	}
	
	public MemberInfoDTO(int membership_number, String membership_level) {
		super();
		this.membership_number = membership_number;
		this.membership_level = membership_level;
	}
	
	public MemberInfoDTO(String name) {
		super();
		this.name = name;
	}


	public int getMembership_number() {
		return membership_number;
	}


	public void setMembership_number(int membership_number) {
		this.membership_number = membership_number;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMembership_level() {
		return membership_level;
	}


	public void setMembership_level(String membership_level) {
		this.membership_level = membership_level;
	}


	public String getLisence_number() {
		return lisence_number;
	}


	public void setLisence_number(String lisence_number) {
		this.lisence_number = lisence_number;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getBirthday() {
		return birthday;
	}


	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}


	public String getLisence_acquisition_date() {
		return lisence_acquisition_date;
	}


	public void setLisence_acquisition_date(String lisence_acquisition_date) {
		this.lisence_acquisition_date = lisence_acquisition_date;
	}


	public int getOverdue_history() {
		return overdue_history;
	}


	public void setOverdue_history(int overdue_history) {
		this.overdue_history = overdue_history;
	}


	public int getUse_count() {
		return use_count;
	}


	public void setUse_count(int use_count) {
		this.use_count = use_count;
	}
	
	

}
