package ddv.com.serviceManagerBackEnd.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="service_users")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private int id;
	
	@Column(name = "user_first_name")
	private String firstName;
	
	@Column(name = "user_last_name")
	private String lastName;
	
	@Column(name = "user_nickname")
	private String nickname;
	
	@Column(name = "user_email")
	private String email;
	
	@Column(name = "user_password")
	private String password;
	
	@Column(name = "user_securitykey")
	private Integer securityKey;

	@Column(name = "user_role")
	private String role;
	
	@Column(name = "user_active")
	private boolean active;

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getSecurityKey() {
		return securityKey;
	}

	public void setSecurityKey(Integer securityKey) {
		this.securityKey = securityKey;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	

}
