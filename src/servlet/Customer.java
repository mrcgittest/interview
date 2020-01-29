package servlet;

public class Customer {
	private String name;
	private String number;
	private String amountDue;
	
	public Customer(String number, String name, String amountDue) {
		this.number = number;
		this.name = name;
		this.amountDue = amountDue;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getAmountDue() {
		return amountDue;
	}

	public void setAmountDue(String amountDue) {
		this.amountDue = amountDue;
	}
	
	
}
