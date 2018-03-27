package kikakuya.model;

import java.util.List;

public class GuestPlusOneForm {
	private List<GuestPlusOne> plusOnes;
	private Guest guest;
	private List<String> meals;

	public GuestPlusOneForm() {
		super();
	}

	public List<GuestPlusOne> getPlusOnes() {
		return plusOnes;
	}

	public void setPlusOnes(List<GuestPlusOne> plusOnes) {
		this.plusOnes = plusOnes;
	}

	public Guest getGuest() {
		return guest;
	}

	public void setGuest(Guest guest) {
		this.guest = guest;
	}

	public List<String> getMeals() {
		return meals;
	}

	public void setMeals(List<String> meals) {
		this.meals = meals;
	}

}
