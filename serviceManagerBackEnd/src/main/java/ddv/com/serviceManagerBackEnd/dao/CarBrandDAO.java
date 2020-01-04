package ddv.com.serviceManagerBackEnd.dao;

import java.util.List;

import ddv.com.serviceManagerBackEnd.dto.CarBrand;

public interface CarBrandDAO {
  
	
	List<CarBrand> list();
	CarBrand  getBrands(int carBrandId);
	boolean addBrand(CarBrand carBrand);
	boolean update(CarBrand carBrand);
	boolean delete(int carBrandId);
	
	
}
