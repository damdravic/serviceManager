package ddv.com.serviceManager.controller;

import java.sql.SQLException;
import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
@RequestMapping("/adminArea")
public class ManagementController {

	@Autowired
	private CarDAO carDAO;
	@Autowired
	private WorkshopDAO workshopDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private InsurerDAO insurerDAO;
	@Autowired
	private CarBrandDAO carBrandDAO;
	@Autowired
	private CarModelDAO carModelDAO;


	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

	/*
	 * RequestMapping for cars
	 * -----------------------------------------------------------------------------------------------------
	 */
	
	@RequestMapping(value = "/cars", method = RequestMethod.GET)
	public ModelAndView showManegeCars(@RequestParam(name = "operation", required = false) String operation)
			throws SQLException {

		ModelAndView mv = new ModelAndView("basepage");
		mv.addObject("userClickManageCars", true);
		mv.addObject("title", "Cars Management");

		Car nCar = new Car();

		mv.addObject("car", nCar);

		if (operation != null) {
			if (operation.contentEquals("car")) {
				mv.addObject("message", "Car is added Successfully!");
			}
		}

		return mv;
	}

	@RequestMapping(value = "/cars", method = RequestMethod.POST)
	public String handelCarSibmission(@Valid @ModelAttribute("car") Car mCar, BindingResult results, Model model,
			@RequestParam(name="requestFromNewCase",required = false ) String requestFromNewCase,
			@RequestParam(required=false) String licencePlate)
			throws SQLException {
		if (results.hasErrors()) {

			model.addAttribute("userClickManageCars", true);
			model.addAttribute("title", "Cars Management");
			model.addAttribute("message", "Oooops!Something goes wrong....The car is not loaded");
			//model.addAttribute("carLicencePlate",carLicencePlate);
			return "basepage";
		}

		logger.info(mCar.toString());
		carDAO.add(mCar);
        if(requestFromNewCase.equals("newCase")) {
        	return "redirect:/adminArea/addNewCase?carLicencePlate="+licencePlate;}
        else {
		return "redirect:/adminArea/cars?operation=car";}
	}
	
	/*
	 * RequestMappig for insurers
	 * ----------------------------------------------------------------------------------------------------------
	 */
	
	@RequestMapping(value = "/insurersManagement")
	public ModelAndView insurersManagement(@RequestParam(value = "id",required = false) String id ) {
		ModelAndView mv = new ModelAndView("basepage");
		mv.addObject("insurersManagement",true);
		mv.addObject("title","Insurer Management");
		
		if(id != null) {
		mv.addObject("id",id);
		Insurer insurer = insurerDAO.getInsurerById(Integer.parseInt(id));
		mv.addObject("insurer",insurer);
		}else {
		
		Insurer insurer = new Insurer();
		mv.addObject("insurer",insurer);
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/insurerManagementAddNewInsurer",method = RequestMethod.POST)
	public String addNewInsurer(@Valid @ModelAttribute("insurer") Insurer insurer, BindingResult bindingResult,Model model)  throws SQLException {
		if(bindingResult.hasErrors()) {
			model.addAttribute("insurerManagement",true);
			model.addAttribute("title", "InsurerManagement");
			model.addAttribute("message","We have some problems");
		}
		
		
		   insurerDAO.addNewInsurer(insurer);
	
	    
		return "redirect:/adminArea/insurersManagement";
	}
	@RequestMapping(value = "/insurerManagementUpdateInsurer",method = RequestMethod.POST)
	public String updateInsurer(@Valid @ModelAttribute("insurer") Insurer insurer, BindingResult bindingResult,Model model)  throws SQLException {
		if(bindingResult.hasErrors()) {
			model.addAttribute("insurerManagement",true);
			model.addAttribute("title", "InsurerManagement");
			model.addAttribute("message","We have some problems");
		}
		   insurerDAO.updateInsurer(insurer);
	
	    
		return "redirect:/adminArea/insurersManagement";
	}
	
	/*
	 * RequestMapping for workshop
	 * --------------------------------------------------------------------------------------------------------------------
	 */
	
	@RequestMapping(value = "/workshopManagement")
	public ModelAndView workshopManagement(@RequestParam(value = "id", required = false) String id) {
		ModelAndView mv = new ModelAndView("basepage");
		
		mv.addObject("workshopManagement",true);
		if(id != null) {
			mv.addObject("id",id);
			Workshop workshop = workshopDAO.get(Integer.parseInt(id));
			mv.addObject("workshop",workshop);
			
		}else {
		
		
		Workshop workshop = new Workshop();
		mv.addObject("workshop",workshop);
		mv.addObject("id",id);
		
		}
		return mv;
	}
	
	@RequestMapping(value = "/workshops",method = RequestMethod.POST)
	public String handlingWorksohopSubmission(@Valid @ModelAttribute("workshop") Workshop ws,BindingResult br,Model model) throws SQLException{
		if (br.hasErrors()) {
			model.addAttribute("workshopManagement", true);
			model.addAttribute("title","Workshop Management");
			
			
			return "basepage";
		}
		workshopDAO.add(ws);
		return "redirect:/adminArea/workshopManagement";
	}
	
	@RequestMapping(value = "/workshops/update",method = RequestMethod.POST)
	public String workshopManagementUpdate(@Valid Workshop updatedWorkshop,BindingResult br,Model model) throws SQLException {
		if(br.hasFieldErrors()) {
			model.addAttribute("workshopManagement",true);
            model.addAttribute("title","Workshop Management");
			
			
			return "basepage";
		}
		workshopDAO.update(updatedWorkshop);
		return "redirect:/adminArea/workshopManagement";
		
	
	}
	
	/*
	 * RequestMapping for users
	 * -------------------------------------------------------------------------------------------------------------------------
	 */
	
	@RequestMapping(value = "/usersManagement",method = RequestMethod.GET)
	public ModelAndView usersManegement(@RequestParam(value="id",required = false) String id) {
		
		ModelAndView mv = new ModelAndView("basepage");
		mv.addObject("title","User Management");
		mv.addObject("requestUserManagement",true);
		if(id != null) {
			User user = userDAO.getUser(Integer.valueOf(id));
			mv.addObject("user",user);
			mv.addObject("id",id);
			return mv;
		}

        User user = new User();
		mv.addObject("user",user);
		return mv;
		
	}
	
	@RequestMapping(value = "/usersManagementAddNewUser",method = RequestMethod.POST)
	public String usersManegementAdding(@Valid @ModelAttribute("user") User user,BindingResult br, Model model) throws SQLException {
	
		if (br.hasErrors()) {
			model.addAttribute("requestUserManagement", true);
			model.addAttribute("title","User Management");
			
			
			return "basepage";
		}
		userDAO.addNewUser(user);
		return "redirect:/adminArea/usersManagement";
	}
	
	@RequestMapping(value = "/usersManagementUpdateUser",method = RequestMethod.POST)
	public String usersManagementUpdating(@Valid @ModelAttribute("user") User user,BindingResult bindingResult,Model model) throws SQLException{
	
		if(bindingResult.hasErrors()) {
			model.addAttribute("requestUserManagement",true);
			model.addAttribute("title","User Management");
			return "basepage";
		}
		userDAO.updateUser(user);
		return "redirect:/adminArea/usersManagement";
		
	}
		
   
	@RequestMapping(value = "/carBrand")
	public ModelAndView carBrand(@RequestParam(value="id",required = false) String id) {
		 ModelAndView mav = new ModelAndView("basepage");
		 
		 mav.addObject("title","Cars brand Manager");
		 mav.addObject("carbrandrequest",true);
		 
		 if(id != null) {
				CarBrand carBrand = carBrandDAO.getBrands(Integer.valueOf(id));
				mav.addObject("carBrand",carBrand);
				mav.addObject("id",id);
				return mav;
			}
		 CarBrand carBrand = new CarBrand();
		 mav.addObject("carBrand",carBrand);
		 
		 return mav;
	}
	@RequestMapping(value="/carBrand",method=RequestMethod.POST)
	public String addindUpdatingBrand(@Valid @ModelAttribute("carBrand") CarBrand carBrand,BindingResult bindingResult,Model model) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("carbrandrequest",true);
			model.addAttribute("title","Cars brand Manager");
			return "basepage";
		}
		
		
		
		
		carBrandDAO.update(carBrand);
		return "redirect:/adminArea/carBrand";

	
	}
	@RequestMapping(value = "/carModel")
	public ModelAndView carModel(@RequestParam(value="id",required = false) String id,
			                     @RequestParam(value="brandId",required = false) String brandId) {
		                         ModelAndView mav = new ModelAndView("basepage");
		 
		 //adding or update model
		 if(id != null) {
			 mav.addObject("title","Cars Model Manager");
			 mav.addObject("carmodelrequest",true);
			 //get model by id to fillform insertForm
				CarModel carModel = carModelDAO.getModel(Integer.valueOf(id));
				mav.addObject("carModel",carModel);
				
				
				mav.addObject("brandId",brandId);
				mav.addObject("id",id);
				return mav;
		 }
        
//request from brand with brandId to dispaly models list
		 mav.addObject("title","Cars Model Manager");
		 mav.addObject("carmodelrequest",true);
		
		 //carModel object for ModelAttribute in insertForm
		 CarModel carModel = new CarModel();
		 mav.addObject("carModel",carModel);
		 
		 //get carbrand Name 
		 mav.addObject("brandName",carBrandDAO.getBrands(Integer.valueOf(brandId)).getName());
		 
		 
		 //list of models
		 int intbrandId = Integer.valueOf(brandId);
	     List<CarModel> carModels = carModelDAO.listByBrand(intbrandId);
         mav.addObject("carModels",carModels);
		

		 
		 return mav;
	}
	@RequestMapping(value="/carModelUpdate",method=RequestMethod.POST)
	public String addindUpdatingBrand(@Valid @ModelAttribute("carModel") CarModel carModel,BindingResult bindingResult,Model model,
			@RequestParam (value="brandId",required = false) String brandId ){
		if(bindingResult.hasErrors()) {
			model.addAttribute("carmodelrequest",true);
			model.addAttribute("title","Cars model Manager");
			return "basepage";
		}
		
		CarBrand carBrand = carBrandDAO.getBrands(Integer.valueOf(brandId));
		carModel.setCarbrand(carBrand);
       	carModelDAO.saveOrUpdate(carModel);
		return "redirect:/adminArea/carBrand";

	
	}
	
	

}
