package ddv.com.serviceManager.controller;

import java.sql.SQLException;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ddv.com.serviceManagerBackEnd.dao.CarDAO;
import ddv.com.serviceManagerBackEnd.dao.InsurerDAO;
import ddv.com.serviceManagerBackEnd.dao.ServiceCaseDAO;
import ddv.com.serviceManagerBackEnd.dao.WorkshopDAO;
import ddv.com.serviceManagerBackEnd.dto.Car;
import ddv.com.serviceManagerBackEnd.dto.ServiceCase;

@Controller
@RequestMapping(value = "/adminArea")
public class CasesManagementController {
	
	
	
	@Autowired
	private ServiceCaseDAO caseDAO;
	@Autowired
	private WorkshopDAO workshopDAO;
	@Autowired
	private InsurerDAO insurerDAO;
	@Autowired
	private CarDAO carDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);
	
	@RequestMapping(value = "/addNewCase",method = RequestMethod.GET)
	public ModelAndView AddNewCase()  throws SQLException {
		ModelAndView mv = new ModelAndView("basepage");
		mv.addObject("title","Add New Case");
		mv.addObject("clientRequestAddNewCasePage",true);
		
		
		ServiceCase scase = new ServiceCase();
		
		//List of workshop for select section
		mv.addObject("listOfWorkshop",workshopDAO.list());
		
		//List of insurers for select section
		mv.addObject("listOfInsurers",insurerDAO.list());

		//creating param for car Controller to redirect to addNeeCase
		mv.addObject("requestFromNewCase","createNewCar");
		
		

		Car car = new Car();
		mv.addObject("car",car);
		
		//mv.addObject("listOfCars",carDAO.list());
		mv.addObject("serviceCase", scase);
		
		
		return mv;
	}
	
	
	@RequestMapping(value = "/addNewCase",method = RequestMethod.POST)
	public String handelAddNewCase(@Valid @ModelAttribute("ServiceCase") ServiceCase xsc, BindingResult results, Model model) throws SQLException{
		if (results.hasErrors()) {
		model.addAttribute("title","Add New Case");
		model.addAttribute("clienRequestAddNewCasePage", true);
		model.addAttribute("message", "Oooops!Something goes wrong....The car is not loaded");
		return "basepage";
		}
		
		logger.info(xsc.toString());
		caseDAO.add(xsc);

		
		return "redirect:/adminArea/addNewCase?operation=ServiceCase";
		
		
		
	}
	
	@RequestMapping(value="/check_availability",method = RequestMethod.POST)
	@ResponseBody
	public String checkAvailability(@RequestParam String carLicencePlate) {
        
			if(carDAO.isCarExist(carLicencePlate)) {
				return "Car exist";
			}else {
				return "Car not exist";
			}
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/casesManagement")
	public ModelAndView serviceCase() {
		
		ModelAndView mv = new ModelAndView("basepage");
		mv.addObject("title","Case");
		mv.addObject("clientRequestCasesManagementPage", true);
		return mv;
		
	}
	
}
