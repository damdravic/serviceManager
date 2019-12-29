

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<c:choose>

   <c:when test="${not empty id}">
        <c:url var="action" value="/adminArea/workshops/update" context="${contextRoot}"/>
        <c:set var="titleCard" value="Update workshop" />
        <c:set var="btnLabel"  value="Update workshop" />
   </c:when>
   <c:otherwise>
        <c:url var="action" value="/adminArea/workshops" context="${contextRoot}"/>
        <c:set var="titleCard" value="Adding new workshop" />
         <c:set var="btnLabel"  value="Create workshop" />
   </c:otherwise>
</c:choose>

<div id="insertForm" class="container" style="display:none;" >
  <div class="row  justify-content-center">
  <div class="col-md-10 border-none">
     <div class="card ">
       <div class="card-header bg-primary text-white text-right">
        <c:out value="${titleCard}" />
       
       </div>
      
     
       <div class="card-body bg-none">
          <sf:form modelAttribute="workshop" action="${action}" methode="">
          
             <div class="form-group row">
               <label for="name" class="col-sm-3 col-form-label text-dark">Workshop Name</label>
               <div class="col-sm-9">
                  <sf:input type="text" path="name"   class="form-control text-uppercase"  placeholder="Workshop name"/>
                </div>
             </div>
             <c:out value="${id}"/>
             <div class="form-group row">
               <label for="description" class="col-sm-3 col-form-label text-dark">Workshop Description</label>
               <div class="col-sm-9">
                  <sf:input type="text"  path="description" class="form-control text-uppercase" placeholder="Workshop Description"/>
                </div>
             </div>
             
             <div class="form-group row">
               <label for="imageURL" class="col-sm-3 col-form-label text-dark">Workshop Image</label>
               <div class="col-sm-9">
                  <sf:input type="text"  path="imageURL" class="form-control text-uppercase" placeholder="Workshop Image Path"/>
                </div>
             </div>
             <sf:hidden path="id" />
         
              
            
          
          <sf:hidden path="active" />
          
          
          
						<div class="form-group row">
							<label for="" class="col-sm-8 col-form-label text-dark">Update or create new workshop</label>
							<div class="col-sm-4">
								<button type="submit" class="btn btn-primary">${btnLabel}</button>
							</div>
						</div>
          
          </sf:form>
       
       
       
       
       </div>
       <div class="card-footer bg-primary">
       <c:out value="${id}"/>
       </div>
     
     </div>
     </div>
  
  </div>
</div>

<div id="table" class="container" style="display:block;" >
	<div class="row justify-content-center">
	   
	   <div class="col-md-10">
	   <div class="card">
	   <div class="card-header bg-primary text-white text-right">
	       <h2> Workshop Management </h2>
	   </div>
	   
	    <div class="card-body bg-none"> 

		<table id="workshopTable" style="width:100%;" class="table table-striped  ">
		  <thead>
		    <tr>
		       <th>Id</th>
		       <th>Name</th>
		       <th>Description</th>
		       <th>Image</th>
		       <th>Active</th>
		       <th></th>
		      
		        
             </tr>
		  </thead>
         </table>
     
	
         </div>
         

         <div class="card-body bg-light">
           <button type="button" class="btn btn-block btn-outline-primary" onclick="display()">Add new Workshop</button>
     
         </div>
         <div class="card-footer bg-primary">
         <br/>
         </div>
         
         
        
	
	    </div>
	  </div>
	
	</div>

</div>

 <c:if test="${not empty id}">
       <script>
       display();
       </script>
      
       </c:if>
