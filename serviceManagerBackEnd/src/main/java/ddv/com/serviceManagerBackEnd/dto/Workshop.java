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
@Table(name="workshop")
public class Workshop {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "workshop_id")
	private int id;
	
	@Column(name = "workshop_name" )
	private String name;
	
	@Column(name = "workshop_description")
	private String description;
	
	@Column(name = "workshop_imageURL")
	private String imageURL;
	
	@Column(name = "workshop_active")
	private boolean active ;
	
	@OneToMany(
       fetch = FetchType.EAGER,
		mappedBy = "workshop",
		cascade = CascadeType.ALL,
		orphanRemoval = true
			)
	 private List <ServiceCase> serviceCaseWorkshop = new ArrayList<>();
	
	
	

	
	public List<ServiceCase> getServiceCaseWorkshop() {
		return serviceCaseWorkshop;
	}
	public void setServiceCaseWorkshop(List<ServiceCase> serviceCaseWorkshop) {
		this.serviceCaseWorkshop = serviceCaseWorkshop;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	
	@Override
	public String toString() {
		return "Workshop [id=" + id + ", name=" + name + ", description=" + description + ", imageURL=" + imageURL
				+ ", active=" + active + "]";
	}

}
