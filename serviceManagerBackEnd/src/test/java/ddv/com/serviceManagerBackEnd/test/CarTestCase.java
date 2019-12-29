package ddv.com.serviceManagerBackEnd.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import ddv.com.serviceManagerBackEnd.dao.CarDAO;
import ddv.com.serviceManagerBackEnd.dto.Car;

public class CarTestCase {
	
	private static AnnotationConfigApplicationContext context;
	
	private static CarDAO carDAO;
	
	private static Car car;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("ddv.com.serviceManagerBackEnd");
		context.refresh();
		carDAO = context.getBean("carDAO",CarDAO.class);
		
	}
	
	@Test
	public void testAddCar() {
		car = new Car();
		
		
		car.setBrand("Mercedes");
		car.setModel("C220");
		car.setActive(true);
		
		assertEquals("succes s",true,carDAO.add(car));
		}
		
	@Test
	public void testGetCar() {
		car = carDAO.get(2);
		assertEquals("no succes","HYUNDAI",car.getBrand());
		
	}

}
