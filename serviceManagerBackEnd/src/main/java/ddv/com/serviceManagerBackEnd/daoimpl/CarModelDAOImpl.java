package ddv.com.serviceManagerBackEnd.daoimpl;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.hibernate.exception.DataException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ddv.com.serviceManagerBackEnd.dao.CarModelDAO;
import ddv.com.serviceManagerBackEnd.dto.CarModel;

@Repository("carModel")
@Transactional
public class CarModelDAOImpl implements CarModelDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	
	@Override
	public List<CarModel> list() {
  
          return sessionFactory.getCurrentSession().createQuery("FROM CarModel",CarModel.class).getResultList();
		
	}
	@Override
	public List<CarModel> listByBrand(int brandId) {
		int carBrandId = brandId;
		Query query = sessionFactory.getCurrentSession().createQuery("FROM CarModel c WHERE c.carbrand.id=:carBrandId");
		query.setParameter("carBrandId", carBrandId);
		
	
		@SuppressWarnings("unchecked")
		List<CarModel> listModels = query.getResultList();
		return listModels;
	}


	@Override
	public CarModel getModel(int carModelId) {
		try {
			CarModel cm = sessionFactory.getCurrentSession().get(CarModel.class, Integer.valueOf(carModelId));
			return cm;
		}catch(DataException ex) {
			
			ex.printStackTrace();
		} return null;
	}

	@Override
	public boolean addModel(CarModel carModel) {
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(carModel);
			return true;
		}catch(DataException ex) {
			ex.printStackTrace();
		}
		return false;
		
	}

	@Override
	public boolean saveOrUpdate(CarModel carModel) {
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(carModel);
			return true;
		}catch(DataException ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(int carModelId) {
		try {
		CarModel carModel = sessionFactory.getCurrentSession().load(CarModel.class, carModelId);
		sessionFactory.getCurrentSession().delete(carModel);
		return true;
		}catch(DataException ex) {
			ex.printStackTrace();
		}
		
		return false;
	}
	@Override
	public int nrOfModels(int brandId) {
	    try {
	    String queryString = "select count(*) FROM CarModel c WHERE c.carbrand.id=:carBrandId ";
	    Query query = sessionFactory.getCurrentSession().createQuery(queryString);
	    query.setParameter("carBrandId", brandId);
	    
	    int count =(int) query.getSingleResult();
	    return count;
	    
	    }catch(DataException ex){
	    	ex.printStackTrace();
	    	
	    }	return 0;
	}

	
}
