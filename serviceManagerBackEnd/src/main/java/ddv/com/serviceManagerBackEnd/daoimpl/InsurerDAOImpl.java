package ddv.com.serviceManagerBackEnd.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ddv.com.serviceManagerBackEnd.dao.InsurerDAO;
import ddv.com.serviceManagerBackEnd.dto.Insurer;

@Repository("insurerDAO")
@Transactional
public class InsurerDAOImpl implements InsurerDAO{
	
	@Autowired
	private SessionFactory sessionFactory;


	@Override
	public List<Insurer> list() {
		return sessionFactory.getCurrentSession().createQuery("FROM Insurer", Insurer.class).getResultList();		
	}


	@Override
	public void deleteInsurer(int insurerId) {
		Insurer insurer = sessionFactory.getCurrentSession().load(Insurer.class, insurerId);
		sessionFactory.getCurrentSession().delete(insurer);
	}


	@Override
	public boolean updateInsurer(Insurer insurer) {
		try {
			sessionFactory.getCurrentSession().update(insurer);
		}catch(Exception ex) {
			ex.getStackTrace();
		}
		return false;
	}


	@Override
	public boolean addNewInsurer(Insurer insurer) {
		try {
			sessionFactory.getCurrentSession().persist(insurer);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}


	@Override
	public Insurer getInsurerById(int insurerId) {
		
		return sessionFactory.getCurrentSession().get(Insurer.class, Integer.valueOf(insurerId));
	}

}
