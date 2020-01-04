package ddv.com.serviceManagerBackEnd.dao;

import java.util.List;

import ddv.com.serviceManagerBackEnd.dto.CarModel;

public interface CarModelDAO {
	
	List<CarModel> list();
	List<CarModel> listByBrand(int brandId);
	int nrOfModels(int brandId);
	CarModel getModel(int carModelId);
	boolean addModel(CarModel carModel);
	boolean saveOrUpdate(CarModel carModel);
	boolean delete(int carModelId);
	
	

}
