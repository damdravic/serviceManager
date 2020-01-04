package ddv.com.serviceManagerBackEnd.dto;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="car_brand")
public class CarBrand {
	

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="car_brand_id")
	private int id;
	
	@Column(name="car_brand_name")
	private String name;
	
	
	@Column(name="car_brand_active")
	private boolean active;
	
	@OneToMany(
			mappedBy ="carbrand",
			cascade = CascadeType.ALL,
			orphanRemoval = true
			)
	 @JsonIgnore
	private List<CarModel> carModels = new ArrayList<>();
	
	
	
	
	
	public List<CarModel> getCarModels() {
		return carModels;
	}


	public void setCarModels(List<CarModel> carModels) {
		this.carModels = carModels;
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
