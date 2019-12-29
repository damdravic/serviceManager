package ddv.com.serviceManagerBackEnd.dao;

import java.util.List;

import ddv.com.serviceManagerBackEnd.dto.Workshop;

public interface WorkshopDAO {
	
	
	
	List<Workshop> list();
	
	Workshop get(int id);
	
    boolean add(Workshop woprkshop);
    
    boolean update(Workshop workshop);
	
    void delete(int id);
	

}
