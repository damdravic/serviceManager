package ddv.com.serviceManagerBackEnd.dao;

import java.util.List;

import ddv.com.serviceManagerBackEnd.dto.Car;

public interface CarDAO {
	
	// CRUD cars from database
	
	Car get(int carId);
	boolean isCarExist(String carLicencePlate);
	List<Car>  list();
	boolean add(Car car);
	boolean update(Car car);
	boolean delete(Car car);
	
	
	
	
	
	

}
