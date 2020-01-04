package ddv.com.serviceManagerBackEnd.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.hibernate.exception.DataException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ddv.com.serviceManagerBackEnd.dao.CarBrandDAO;
import ddv.com.serviceManagerBackEnd.dto.CarBrand;

@Repository("carBrandDAO")
@Transactional
public class CarBrandDAOImpl implements CarBrandDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<CarBrand> list() {
		
		return sessionFactory.getCurrentSession().createQuery("FROM CarBrand", CarBrand.class).getResultList() ;
	}

	@Override
	public CarBrand getBrands(int carBrandId) {
		try {
			return sessionFactory.getCurrentSession().get(CarBrand.class, Integer.valueOf(carBrandId));
			
		}catch(DataException ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean addBrand(CarBrand carBrand) {
		try {
			sessionFactory.getCurrentSession().persist(carBrand);
			return true;
			
		}catch(DataException ex){
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(CarBrand carBrand) {
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(carBrand);
			return true;
		}catch(DataException ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(int carBrandId) {
		try {
			CarBrand carbrand = sessionFactory.getCurrentSession().load(CarBrand.class, carBrandId);
			sessionFactory.getCurrentSession().delete(carbrand);
			return true;
		}catch(DataException ex) {
			ex.printStackTrace();
		}
		return false;
	}

}
