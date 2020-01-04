
$(function(){


	var $table = $('#insurersTable');
	if($table.length){
		
		// console.log('inside v');
		
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
				{
					data : 'id',
				   mRender:function(data, type, row){
					var tablename = "insurers"
					var str = '';
					str += '<a href="'+window.contextRoot+'/json/data/'+data+'/'+tablename+'/delete " style="width : 40%" onclick="return getConfirmation()" class="btn btn-outline-primary" title="Delete"><i class="fa fa-times" style="color:red; font-size: 20px; " aria-hidden="true"></i></a> &#160 ' ;
					str += '<a href="'+window.contextRoot+'/adminArea/insurersManagement/?id='+data+'" style="width : 40%" class="btn mybtn btn-outline-primary"><i class="fa fa-sliders" style="color:blue; font-size: 20px;" aria-hidden="true"></i></a>';

                    return str;
				}
				
				}
				
			]
		});
	}
	
	
	var $wtable = $('#workshopTable');
	if($wtable.length){
		
		console.log('inside v');
		
		var workshopjsonURL = window.contextRoot + '/json/data/all/workshop';
		
		
		$wtable.DataTable({
			ajax: {
				url : workshopjsonURL,
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
					data : 'description'
				},
				{
					data : 'imageURL'
				},
				{
					data : 'active'
				},
				{
					data : 'id',
				   mRender:function(data, type, row){
					var tablename = 'workshops';
					var str = '';
				    str += '<a href="'+window.contextRoot+'/json/data/'+data+'/'+tablename+'/delete " onclick="return getConfirmation()" style="width : 40%" class="btn btn-outline-primary btn-xs" title="Delete"><i class="fa fa-times" style="color:red; font-size: 18px; " aria-hidden="true"></i></a> &#160 ' ;
					str += '<a href="'+window.contextRoot+'/adminArea/workshopManagement/?id='+data+'" style="width : 40%" class="btn btn-outline-primary btn-xs"><i class="fa fa-sliders" style="color:blue; font-size: 18px;" aria-hidden="true"></i></a>';

                    return str;
				}
				
				}
		
				
			
				
				
			]
		});
	}
	
	var $userstable = $('#usersTable');
	if($userstable.length){
		
		 console.log('inside usrs');
		
		var usersjsonURL = window.contextRoot + '/json/data/all/users';
		
		
		$userstable.DataTable({
			ajax: {
				url : usersjsonURL,
				dataSrc:''
			},
			columns: [
				{
					data : 'id'
				},
				{
					data : 'firstName'
				},
				{
					data : 'lastName'
				},
				{
					data : 'nickname'
				},
				{
					data : 'email'
				},
				{
					data : 'role'
				},
				{
					data : 'active'
				},
				{
					data : 'id',
				   mRender:function(data, type, row){
					   var tablename = "users";
					   var str = '';
					   str += '<a href="'+window.contextRoot+'/json/data/'+data+'/'+tablename+'/delete " onclick="return getConfirmation()" style="width : 40%" class="btn btn-outline-primary btn-xs" title="Delete"><i class="fa fa-times" style="color:red; font-size: 18px; " aria-hidden="true"></i></a> &#160 ' ;
					   str += '<a href="'+window.contextRoot+'/adminArea/usersManagement/?id='+data+'" style="width : 40%" class="btn btn-outline-primary btn-xs" title="Edit"><i class="fa fa-sliders" style="color:blue; font-size: 18px;" aria-hidden="true"></i></a>';

	                return str;
				}
				
				}
				
			]
		});
	}
	
	var $carbrandtable = $('#carBrandTable');
	if($carbrandtable.length){
		
		console.log('inside v');
		
		var carbrandjsonURL = window.contextRoot + '/json/data/all/carBrand';
		
		
		$carbrandtable.DataTable({
			ajax: {
				url : carbrandjsonURL,
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
				{
					data : 'id',
				   mRender:function(data, type, row){
					var tablename = 'carbrand';
					var str = '';
				    str += '<a href="'+window.contextRoot+'/json/data/'+data+'/'+tablename+'/delete " onclick="return getConfirmation()" style="width : 25%" class="btn btn-outline-primary btn-xs" title="Delete"><i class="fa fa-times" style="color:red; font-size: 18px; " aria-hidden="true"></i></a> &#160 ' ;
					str += '<a href="'+window.contextRoot+'/adminArea/carBrand/?id='+data+'" style="width : 25%" class="btn btn-outline-primary btn-xs" title="Update"><i class="fa fa-sliders" style="color:blue; font-size: 18px;" aria-hidden="true"></i></a> &#160';
					str += '<a href="'+window.contextRoot+'/adminArea/carModel?brandId='+data+'" style="width : 25%" class="btn btn-outline-primary btn-xs" title="List of Models"><i class="fa fa-list" style="color:blue; font-size: 18px;" aria-hidden="true"></i></a>';

                    return str;
				}
				
				}
		
				
			
				
				
			]
		});
	}
	

	 

	});




function getConfirmation(){
	 var deleting = confirm("Sigur stergi record ??");
	 if(deleting == true){
		 document.write("Recordul a fost sters");
		 return true;
	 }else{
		 document.write("Recordul nu a fost sters");
		 return false;
	 }
	
	
}
