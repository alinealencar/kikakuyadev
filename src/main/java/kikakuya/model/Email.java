package kikakuya.model;

public class Email {
	String type, replyDue, title, message;
	int adultsMax, kidsMax;
	String[] mealChoice, recipients;
	
	public Email() {
		super();
	}

	public Email(String type, String replyDue, String title, String message, int adultsMax, int kidsMax,
			String[] mealChoice, String[] recipients) {
		this.type = type;
		this.replyDue = replyDue;
		this.title = title;
		this.message = message;
		this.adultsMax = adultsMax;
		this.kidsMax = kidsMax;
		this.mealChoice = mealChoice;
		this.recipients = recipients;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String[] getMealChoice() {
		return mealChoice;
	}

	public void setMealChoice(String[] mealChoice) {
		this.mealChoice = mealChoice;
	}

	public String[] getRecipients() {
		return recipients;
	}

	public void setRecipients(String[] recipients) {
		this.recipients = recipients;
	}
	
	
	
	
}
