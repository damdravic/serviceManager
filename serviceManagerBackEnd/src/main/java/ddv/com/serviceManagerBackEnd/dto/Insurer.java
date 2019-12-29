package ddv.com.serviceManagerBackEnd.dto;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "insurers")
public class Insurer {
    
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "insurer_id")
	private int id;
	
	@Column(name = "insurer_name")
	private String name;
	
	@Column(name = "insurer_active")
	private boolean active;
	
	@OneToMany(
			fetch = FetchType.EAGER,
		mappedBy ="insurer"	,
		cascade =CascadeType.ALL,
		orphanRemoval =true
		)
	
	private List<ServiceCase>  serviceCaseInsurer = new ArrayList<>();
	


	public List<ServiceCase> getServiceCaseInsurer() {
		return serviceCaseInsurer;
	}

	public void setServiceCaseInsurer(List<ServiceCase> serviceCaseInsurer) {
		this.serviceCaseInsurer = serviceCaseInsurer;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

}
