package ddv.com.serviceManager.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ddv.com.serviceManagerBackEnd.dao.WorkshopDAO;

@Controller
public class PageController {
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	@Autowired
	private WorkshopDAO workshopDAO;

	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView index(HttpSession httpSession,Principal principal) {
		ModelAndView mv = new ModelAndView("basepage");
		//for redirect to login .... if condition...
		ModelAndView mav = new ModelAndView("login");
		
		mv.addObject("title", "Home");
		
		//object to print session id/creationTime/and user
		mv.addObject("sesid", httpSession.getId());
		
		DateFormat df = new SimpleDateFormat("dd:MM:yyyy  HH:mm:ss");
		long timex = httpSession.getCreationTime();
		String time = df.format(timex);
		mv.addObject("sesTimeCreation", time);
		
		//get name of logged user and redirect to login page if principal is null
		//if reconnect to app  and session is not timeout it get error because principal become null
		
		if ( principal != null ) {
			String username = principal.getName();
			mv.addObject("user", username);
			}
		else {
			return mav;
			}
	
		
		
		logger.info("inside page controller index methode -INFO");
		mv.addObject("listOfWorkshop",workshopDAO.list());
        mv.addObject("clientRequestHomePage",true);
		return mv;

	}



	

	
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam(name="error", required = false) String error,
			@RequestParam(name="logout", required = false) String logout) {
		ModelAndView mv = new ModelAndView("login");
		
		if(logout!=null) {
			mv.addObject("message","Logout succesifull");
		}
		
		if(error!=null) {
			mv.addObject("message", "Invalid User or Password");
		}
		
		
		mv.addObject("title","Login");
		
		return mv;
	}
	
	@RequestMapping(value="/perform-logout")
	public String performLogout (HttpServletRequest request,HttpServletResponse response) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(auth!=null) {
			
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		return "redirect:login?logout";
		
	}

	

}
