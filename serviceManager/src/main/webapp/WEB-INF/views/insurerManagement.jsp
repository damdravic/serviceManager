<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



<c:choose>
   <c:when test="${not empty id}">
   <c:url var="action" value="/adminArea/insurerManagementUpdateInsurer" context="${contextRoot}"/>
   <c:set var="cardTitle" value="Update selected Insurer" />
   <c:set var="btnLabel"  value="Update Insurer" />
   </c:when>
   
   <c:otherwise>
   <c:url var="action" value="/adminArea/insurerManagementAddNewInsurer" context="${contextRoot}"/>
   <c:set var="cardTitle" value="Insert new Insurer" />
   <c:set var="btnLabel"  value="Create Insurer" />
   </c:otherwise>
   
</c:choose>



<div id="insertForm" class="container" style="display:none">
    <div class="row justify-content-center">
        <div class="col-md-10">
         <div class="card">
            <div class="card-header bg-primary text-right text-white">
            <p><c:out value="${cardTitle}"/>/p>
            </div>
            <div class="card-body">
          
              <sf:form modelAttribute="insurer" action="${action}" methode="">
                
                <div class="form-group row">
                  <label for="name" class="col-md-3 col-form-label text-dark" > Insurer Name </label>
                  <div class="col-md-9 ">
                  <sf:input type="text" path="name" class="form-control text-uppercase" placeholder="Insurer Name" /> 
                  </div>
                </div>
                
                <div class="form-group row">
                <label for="active" class="col-md-3 col-form-label text-dark">Active</label>
                <div class="col-md-9">
                   <sf:input type="text" path="active"  class="form-control" placeholder="Is Avctive" />
                </div>
                </div>
               
                <div class="form-group row">
                  <label for="" class="col-md-6 col-form-label"> Create or Update Insurer</label>
                  <div class="col-md-6">
                         <button type="submit" class="btn btn-primary"><c:out value="${btnLabel}"/></button>
                  </div>
                
                </div>
                <sf:hidden path="id" />
                
                
                
                
                
              </sf:form>
            </div>
            <div class="card-footer bg-primary text-right text-white">
            </div>
         
         </div>

        
        </div>
    
    
    </div>
</div>
<div id="table" class="container" style="display:block">
	<div class="row justify-content-center">

		<div class="col-md-10 ">
			<div class="card">

				<div class="card-header bg-primary text-right text-white ">
					<h3>Insurer Management</h3>
				</div>

				<div class="card-body bg-none">

					<table id="insurersTable" style="width: 100%"
						class="table table-sm table-striped table-light ">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Active</th>
								<th></th>

							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body bg-light">
					<button type="button" class="btn btn-block btn-outline-primary"  onclick="display()">Add new Insurer</button>
				</div>
				<div class="card-footer bg-primary">
					66<c:out value="${id}"/>66
					<br />
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


