package ddv.com.serviceManagerBackEnd.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ddv.com.serviceManagerBackEnd.dao.WorkshopDAO;
import ddv.com.serviceManagerBackEnd.dto.Workshop;



@Repository("workshopDAO")
@Transactional
public class WorkshopDAOImpl implements WorkshopDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	/*
	static {
		
		Workshop workshopObject = new Workshop();
		
		workshopObject.setId(1);
		workshopObject.setName("mecamina");
		workshopObject.setDescription("dec");
		workshopObject.setImageURL("wdc");
		workshopObject.setActive(true);
		
		listOfWorkshop.add(workshopObject);
		
		workshopObject = new Workshop();
		
		workshopObject.setId(2);
		workshopObject.setName("voopsitorie");
		workshopObject.setDescription("dec");
		workshopObject.setImageURL("wwed");
		workshopObject.setActive(true);
		
		listOfWorkshop.add(workshopObject);
	
		
	}
	*/

	
	
	
	@Override
	public List<Workshop> list() {
		
		return  sessionFactory.getCurrentSession().createQuery("FROM Workshop",Workshop.class).getResultList();
			}



	@Override
	
	public boolean add(Workshop workshop) {
		try {
			
			sessionFactory.getCurrentSession().persist(workshop);
			return true;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	
	}



	@Override
	public Workshop get(int id) {
		return sessionFactory.getCurrentSession().get(Workshop.class, Integer.valueOf(id));
	}


	@Override
	public void delete(int id) {
          Workshop workshop = sessionFactory.getCurrentSession().load(Workshop.class, id);
          sessionFactory.getCurrentSession().delete(workshop);
		
	}
	
	@Override
	public boolean update(Workshop workshop) {
		try {
			sessionFactory.getCurrentSession().update(workshop);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			
		}
		return false;
	}

}
