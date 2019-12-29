package ddv.com.serviceManagerBackEnd;


import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import ddv.com.serviceManagerBackEnd.dao.WorkshopDAO;
import ddv.com.serviceManagerBackEnd.dto.Workshop;

public class Test {
	

	public static void main(String[] args){
	
	
 AnnotationConfigApplicationContext context;
	WorkshopDAO workshopDAO;
	 Workshop workshopObject;
	
	
		
		context = new AnnotationConfigApplicationContext();
		context.scan("ddv.com.serviceManagerBackEnd");
		context.refresh();
		workshopDAO = context.getBean("workshopDAO",WorkshopDAO.class);
	    context.close();
	
	/*
	@Test
	public void testAddWorkshop() {
		
		workshopObject = new Workshop();
		
	
		workshopObject.setName("mecamina");
		workshopObject.setDescription("dec");
		workshopObject.setImageURL("wdc");
		workshopObject.setActive(true);
		
		assertEquals("wedwefdwf",true,workshopDAO.add(workshopObject));
		
	}
	
	*/
	
	
	
		
		
	workshopObject = workshopDAO.get(2);
	workshopObject.getName();
	//assertEquals("Succes","Mecanica",workshopObject.getName());
	
}

}
