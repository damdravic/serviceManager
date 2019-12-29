package ddv.com.serviceManagerBackEnd.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.exception.DataException;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ddv.com.serviceManagerBackEnd.dao.CarDAO;
import ddv.com.serviceManagerBackEnd.dto.Car;

@Repository("carDAO")
@Transactional
public class CarDAOImpl implements CarDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Car get(int carId) {
		try {
			return sessionFactory.getCurrentSession().get(Car.class, Integer.valueOf(carId));
		} catch (Exception ex) {
			ex.printStackTrace();

		}

		return null;
	}

	@Override
	public List<Car> list() {
		return sessionFactory.getCurrentSession().createQuery("FROM Car", Car.class).getResultList();

	}

	@Override
	public boolean add(Car car) {
		try {
			sessionFactory.getCurrentSession().persist(car);
			return true;
		} catch (DataException ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(Car car) {
		try {
			sessionFactory.getCurrentSession().update(car);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();

		}
		return false;
	}

	// for moment i don't need to delete a car.
	@Override
	public boolean delete(Car car) {
		try {
			car.setActive(false);
			return this.update(car);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean isCarExist(String carLicencePlate){

		@SuppressWarnings("unchecked")
		Query<Long> query =  sessionFactory.getCurrentSession().createQuery("select count(*) from Car where licencePlate =:carLicencePlate");
		query.setParameter("carLicencePlate",carLicencePlate);
		
		boolean exists = ((Long) query.uniqueResult()).intValue() >0;
		return exists;
}
}