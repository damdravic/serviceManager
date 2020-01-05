package ddv.com.serviceManager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ddv.com.serviceManagerBackEnd.dao.CarBrandDAO;
import ddv.com.serviceManagerBackEnd.dao.CarDAO;
import ddv.com.serviceManagerBackEnd.dao.CarModelDAO;
import ddv.com.serviceManagerBackEnd.dao.InsurerDAO;
import ddv.com.serviceManagerBackEnd.dao.UserDAO;
import ddv.com.serviceManagerBackEnd.dao.WorkshopDAO;
import ddv.com.serviceManagerBackEnd.dto.Car;
import ddv.com.serviceManagerBackEnd.dto.CarBrand;
import ddv.com.serviceManagerBackEnd.dto.CarModel;
import ddv.com.serviceManagerBackEnd.dto.Insurer;
import ddv.com.serviceManagerBackEnd.dto.User;
import ddv.com.serviceManagerBackEnd.dto.Workshop;

@Controller
@RequestMapping("/json/data")
public class JsonDataController {
	
	
	@Autowired
	private CarDAO carDAO;
	@Autowired
	private WorkshopDAO workshopDAO;
	@Autowired
	private InsurerDAO insurerDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CarBrandDAO carBrandDAO;
	@Autowired
	private CarModelDAO carModelDAO;

	@RequestMapping("/all/workshop")
	@ResponseBody
	public List<Workshop> getAllWorkshop(){
		
		return workshopDAO.list();
	}
	
	@RequestMapping("/all/users")
	@ResponseBody
	public List<User> getUsers(){
		return userDAO.getUserList();
	}

	@RequestMapping("/all/insurer")
	@ResponseBody
	public List<Insurer> getAllInsurers(){
		
		return insurerDAO.list();
	}
	
	@RequestMapping("/all/cars")
	@ResponseBody
	public List<Car> getAllProducts(){
		
		return carDAO.list();
	}
	
	@RequestMapping("all/carBrand")
	@ResponseBody
	public List<CarBrand> getAllBrands(){
		return carBrandDAO.list();
	}
	 
	@RequestMapping("all/models/{id}")
	@ResponseBody
	public List<CarModel> getModelsByBrandId(@PathVariable("id") int id ){
		return carModelDAO.listByBrand(id);
	}
	 
	
	/*
	 * deleting methode
	 * 2 pathVariables id and tablename
	 * come from jtables.js
	 * 
	 * 
	 * 
	 * */
	@RequestMapping("/{id}/{tablename}/delete")
	public String deletedata(@PathVariable("id") int id,@PathVariable("tablename") String tablename) {
		String str ="";
		switch(tablename) {
		case "workshops" :
		        workshopDAO.delete(id);
                str = "redirect:/adminArea/workshopManagement";
                break;
		case "users"  :
			    userDAO.deleteUser(id);
			    str = "redirect:/adminArea/usersManagement";
			    break;
		
		case "insurers" :
			 insurerDAO.deleteInsurer(id);
			 str = "redirect:/adminArea/insurersManagement";
			 break;
		case "carbrand" :
	         carBrandDAO.delete(id);
	         str = "redirect:/adminArea/carBrand";
	         break;
		case "carmodel" :
	         carModelDAO.delete(id);
	         str = "redirect:/adminArea/carBrand";
	         break;
		
		
		}
		return str;
	}
	

}

