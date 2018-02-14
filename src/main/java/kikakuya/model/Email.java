package kikakuya.model;

public class Email {
	String replyDue, title, message, status, mealChoiceBeef, mealChoicePork, mealChoiceChicken, mealChoiceVeg, mealChoiceFish, mealChoiceKids;
	int adultsMax, kidsMax;
	int[] recipients;
	
	public Email() {
	
	}

	public String getMealChoiceBeef() {
		return mealChoiceBeef;
	}

	public void setMealChoiceBeef(String mealChoiceBeef) {
		this.mealChoiceBeef = mealChoiceBeef;
	}

	public String getMealChoicePork() {
		return mealChoicePork;
	}

	public void setMealChoicePork(String mealChoicePork) {
		this.mealChoicePork = mealChoicePork;
	}

	public String getMealChoiceChicken() {
		return mealChoiceChicken;
	}

	public void setMealChoiceChicken(String mealChoiceChicken) {
		this.mealChoiceChicken = mealChoiceChicken;
	}

	public String getMealChoiceVeg() {
		return mealChoiceVeg;
	}

	public void setMealChoiceVeg(String mealChoiceVeg) {
		this.mealChoiceVeg = mealChoiceVeg;
	}

	public String getMealChoiceFish() {
		return mealChoiceFish;
	}

	public void setMealChoiceFish(String mealChoiceFish) {
		this.mealChoiceFish = mealChoiceFish;
	}

	public String getMealChoiceKids() {
		return mealChoiceKids;
	}

	public void setMealChoiceKids(String mealChoiceKids) {
		this.mealChoiceKids = mealChoiceKids;
	}

	public String getReplyDue() {
		return replyDue;
	}

	public void setReplyDue(String replyDue) {
		this.replyDue = replyDue;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getAdultsMax() {
		return adultsMax;
	}

	public void setAdultsMax(int adultsMax) {
		this.adultsMax = adultsMax;
	}

	public int getKidsMax() {
		return kidsMax;
	}

	public void setKidsMax(int kidsMax) {
		this.kidsMax = kidsMax;
	}

	public int[] getRecipients() {
		return recipients;
	}

	public void setRecipients(int[] recipients) {
		this.recipients = recipients;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
}
