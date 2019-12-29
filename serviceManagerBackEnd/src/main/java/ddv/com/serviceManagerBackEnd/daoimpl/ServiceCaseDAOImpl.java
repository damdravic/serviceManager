package ddv.com.serviceManagerBackEnd.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ddv.com.serviceManagerBackEnd.dao.ServiceCaseDAO;
import ddv.com.serviceManagerBackEnd.dto.ServiceCase;

@Repository("caseDAO")
@Transactional
public class ServiceCaseDAOImpl implements ServiceCaseDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	

	@Override
	public List<ServiceCase> list() {
		return sessionFactory.getCurrentSession().createQuery("FROM ServiceCase", ServiceCase.class).getResultList();
	}

	@Override
	public ServiceCase get(int serviceCaseId) {
		try {
		return sessionFactory.getCurrentSession().get(ServiceCase.class, Integer.valueOf(serviceCaseId));}
		catch(Exception ex) {
			ex.printStackTrace();
		
		}
		return null;
	}

	@Override
	public boolean add(ServiceCase serviceCase) {
		try {
			sessionFactory.getCurrentSession().persist(serviceCase);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(ServiceCase serviceCase) {
		try {
		sessionFactory.getCurrentSession().update(serviceCase);
		return true;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
		}
	@Override
	public boolean delete(ServiceCase serviceCase) {
		
		try {
		serviceCase.setCaseActive(false);
		    this.update(serviceCase);
		    return true;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public List<ServiceCase> listActiveCases() {
		
			return sessionFactory.getCurrentSession()
			   .createQuery("FROM ServiceCase WHERE active = :active",ServiceCase.class)
			       .setParameter("active", true)
			            .getResultList();
	
	}

	@Override
	public List<ServiceCase> listActiveCasesByWorkshop(int workshopId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ServiceCase> listLatestActiveCases(int count) {
		// TODO Auto-generated method stub
		return null;
	}

}
