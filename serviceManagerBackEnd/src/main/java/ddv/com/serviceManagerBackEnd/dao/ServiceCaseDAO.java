package ddv.com.serviceManagerBackEnd.dao;

import java.util.List;

import ddv.com.serviceManagerBackEnd.dto.ServiceCase;

public interface ServiceCaseDAO {

	//CRUD Operations
	
	List<ServiceCase> list();
	ServiceCase get(int serviceCaseId);
	boolean add(ServiceCase serviceCase);
	boolean update(ServiceCase serviceCase);
	boolean delete(ServiceCase serviceCase);
	
	//Business operations
	
	List<ServiceCase> listActiveCases();
	List<ServiceCase> listActiveCasesByWorkshop(int workshopId);
	List<ServiceCase> listLatestActiveCases(int count);
	
}
