package kikakuya.model;

public class User {
	private String userName;
    private String userPassword;
    private String email;
    private String token;
    private Integer isRememberMe;
	
    public User() {
		
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

	//1 for true, 0 for false.
	public Integer getIsRememberMe() {
		return isRememberMe;
	}

	public void setIsRememberMe(Integer isRememberMe) {
		this.isRememberMe = isRememberMe;
	}
    
}
