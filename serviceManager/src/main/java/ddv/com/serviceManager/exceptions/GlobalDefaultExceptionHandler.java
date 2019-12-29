package ddv.com.serviceManager.exceptions;




import org.hibernate.exception.DataException;
import org.springframework.transaction.CannotCreateTransactionException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;



@ControllerAdvice
public class GlobalDefaultExceptionHandler {
	
	

	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handleNoHandlerFoundException() {
		ModelAndView mv = new  ModelAndView("usersarea/error");
		
		mv.addObject("errorTitle","This page is not constructed!");
		mv.addObject("ErrorDescription","The page youare looking for is not available now!");
		mv.addObject("title","404 Error PagCJCommunicationsExceptione");
		return mv;
	}
	

	@ExceptionHandler(DataException.class)
	public ModelAndView DataAccessFoundException() {
		ModelAndView mv = new  ModelAndView("usersarea/error");
		
		mv.addObject("errorTitle","DataException Exception");
		mv.addObject("ErrorDescription","error to create entry in databare");
		mv.addObject("title","error");
		return mv;
	}
	


	
	@ExceptionHandler(CannotCreateTransactionException.class)
	 public ModelAndView handleConnectException(Exception exception) {
        ModelAndView mv = new  ModelAndView("usersarea/error");
		
        String exceptionName = exception.getCause().toString();
		mv.addObject("errorTitle","Connection problem!");
		mv.addObject("errorDescription"," Cannot acces DataBase   --   " + exceptionName);
		mv.addObject("title","404 Error DB_Exceptione");
		return mv;
	
	}
	
	
}
