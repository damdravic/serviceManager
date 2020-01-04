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

import org.hibernate.validator.constraints.NotBlank;

@Entity(name = "Car")
@Table(name = "car")
public class Car {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="car_id")
	private int carId;
	
	
	@Column(name="licence_plate")
	@NotBlank(message = "Please enter a valid Licence_Plate")
	private String licencePlate;
	
	private String brand;
	private String model;
	private String owner;
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}

	private boolean active;
	
	@OneToMany(
			mappedBy = "car",
			cascade = CascadeType.ALL,
			orphanRemoval = true
                 )
	private List<ServiceCase>  serviceCaseCar = new ArrayList<>();
	
	
	
	
	public List<ServiceCase> getServiceCaseCar() {
		return serviceCaseCar;
	}
	public void setServiceCaseCar(List<ServiceCase> serviceCaseCar) {
		this.serviceCaseCar = serviceCaseCar;
	}
	public void setCarId(int carId) {
		this.carId = carId;
	}
	public int getCarId() {
		return carId;
	}
	public void setCar_id(int carId) {
		this.carId = carId;
	}
	public String getLicencePlate() {
		return licencePlate;
	}
	public void setLicencePlate(String licensePlate) {
		this.licencePlate = licensePlate;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	
	public void setActive(boolean active) {
		this.active = active;
	}
	
	public boolean getActive() {
		return active;
	}
	
}
