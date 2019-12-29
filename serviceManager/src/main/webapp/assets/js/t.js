/**
 * 
 */

$(function b(){


	var $wtable = $('#workshopTable');
	if($wtable.length){
		
		console.log('inside v');
		
		var jsonURL = window.contextRoot + '/json/data/all/workshop';
		
		
		$wtable.DataTable({
			ajax: {
				url : jsonURL,
				dataSrc:''
			 
			},
			columns: [
				{
					data : 'id'
				},
				{
					data : 'active'
				},
				{
					data : 'description'
				},
				{
					data : 'imageURL'
				},
				{
					data : 'name'
				}
			
				
				
			]
		});
	}
	});


$(function a(){


var $table = $('#carsTable');
if($table.length){
	
	console.log('inside v');
	
	var jsonURL = window.contextRoot + '/json/data/all/cars';
	
	
	$table.DataTable({
		ajax: {
			url : jsonURL,
			dataSrc:''
		},
		columns: [
			{
				data : 'carId'
			},
			{
				data : 'licencePlate'
			},
			{
				data : 'brand'
			},
			{
				data : 'model'
			},
			{
				data : 'active'
			}
		
			
			
		]
	});
}
});



$(function c(){


	var $table = $('#insurersTable');
	if($table.length){
		
		console.log('inside v');
		
		var jsonURL = window.contextRoot + '/json/data/all/insurer';
		
		
		$table.DataTable({
			ajax: {
				url : jsonURL,
				dataSrc:''
			},
			columns: [
				{
					data : 'id'
				},
				{
					data : 'name'
				},
				{
					data : 'active'
				},
				
			
				
				
			]
		});
	}
	});


var $alert = $('.alert');
 if($alert.lenght){
	 setTimeout(function(){
		 $alert.fadeOut('slow');
	 } , 3000);
 }