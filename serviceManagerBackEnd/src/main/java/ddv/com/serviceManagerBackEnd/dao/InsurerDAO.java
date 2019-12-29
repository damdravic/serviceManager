package ddv.com.serviceManagerBackEnd.dao;

import java.util.List;

import ddv.com.serviceManagerBackEnd.dto.Insurer;

public interface InsurerDAO {
    
	//get insurer by id
	Insurer getInsurerById(int insurerId);
	
	
	//get all insurers in a list
	List<Insurer> list();
	// add new insurer
	boolean addNewInsurer(Insurer insurer);
	
	
	
	//update insurer by id
	boolean updateInsurer(Insurer insurer);
	
	//delete insurer by id
	void  deleteInsurer(int insurerId);
	
	
}
