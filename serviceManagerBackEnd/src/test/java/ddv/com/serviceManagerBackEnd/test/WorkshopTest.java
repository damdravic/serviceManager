package ddv.com.serviceManagerBackEnd.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import ddv.com.serviceManagerBackEnd.dao.WorkshopDAO;

public class WorkshopTest {

	
      private static AnnotationConfigApplicationContext context;
	  private static WorkshopDAO workshopDAO;
	
	   @BeforeClass
		public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("ddv.com.serviceManagerBackEnd");
		context.refresh();
		workshopDAO = context.getBean("workshopDAO",WorkshopDAO.class);
		}
	

		@Test
		public void testListWorkshop() {
			
			//workshopObject.getName();
			assertEquals("Succes",2,workshopDAO.list().size());
		}
	   

}

