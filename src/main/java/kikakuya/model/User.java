package kikakuya.model;

public class User {
	private int userId;
	private String userName;
    private String userPassword;
    private String email;
    private String token;
    private String series;
    private int isRememberMe;
	
    public User() {
		
	}
    
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getSeries() {
		return series;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	public int getIsRememberMe() {
		return isRememberMe;
	}

	public void setIsRememberMe(int isRememberMe) {
		this.isRememberMe = isRememberMe;
	}
}
