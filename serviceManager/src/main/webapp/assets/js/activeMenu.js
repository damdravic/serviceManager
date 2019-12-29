/**
 * 
 */

$(function(){
	switch(menu){
	case 'HOME':
		$('#home').addClass('active');
		break;
	case 'Charts':
		$('#charts').addClass('active');
		break;
	case 'Tables':
		$('#tables').addClass('active');
		break;
	case 'Cars Management':
		$('#manageCars').addClass('active');
		break;
    default:
    	$('#home').addClass('active');
    break;
		
		
	
	
	}
	
	
	
});
