  
  <!-- Container Fluid-->
  <div class="container-fluid" id="container-wrapper">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800"><cfoutput>#rc.title#</cfoutput></h1>
      <cfparam name="rc.message" default="#arrayNew(1)#">
      <cfif not arrayIsEmpty(rc.message)>
        
        <cfloop array="#rc.message#" index="msg">
          <center><h5 style="color: green"><cfoutput>#msg#</cfoutput></h5></center>
        </cfloop>
      </cfif>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <!-- Form Basic -->
        <div class="card mb-4">
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary"></h6>
          </div>
          <div class="card-body">

            <!--- <cfif isDefined("url.id") >
              <form method="post" action=<cfoutput>#buildURL(action="admin.add")#</cfoutput>>
              
                <cfoutput query="#rc.get#">
               
              <input type="hidden" name="id" value="#ID#">
              <div class="form-group">
                <label for="exampleInputEmail1">Category Name</label>
                <input type="text" name="catName" class="form-control" value="<cfoutput> #CategoryName#</cfoutput>" placeholder="Enter Category Name" required="">
              </div>
            </cfoutput>
           
              <button type="submit" class="btn btn-primary" name ="addCategory">Add</button>
            </form>
          <cfelse> --->
            <form method="post" action=<cfoutput>#buildURL(action="admin.add")#</cfoutput>>
              
              <input type="hidden" name="id" value="<cfoutput>#rc.id#</cfoutput>">
             
            
              <div class="form-group">
                <label for="exampleInputEmail1">Category Name</label>
                <input type="text" name="catName" class="form-control" value="<cfoutput>#rc.cat#</cfoutput>" placeholder="Enter Category Name" required="">
              </div>
            
              <button type="submit" class="btn btn-primary" name ="addCategory"><cfoutput>#rc.button#</cfoutput></button>
           
              
            </form>
            
            
            

            
          </div>
        </div>
      </div>
   </div>
<!--- <cfif isDefined("addCategory")>
  <cfset catName = "#catName#">
  <cfset cdate=DateFormat(now(),'yyyy-mm-dd')>
  <cfquery name="AddCategory">
    SELECT category_name FROM category WHERE category_name = '#catName#';
  </cfquery>
  <cfif AddCategory.RecordCount gt 0>
    <script>alert('Already added');</script>
  <cfelse>
    <cfquery name="Insertcategory">
      INSERT INTO category (category_name, created_date, updated_date, status) VALUES('#catName#','#cdate#','#cdate#','0');
    </cfquery>
    <script>alert('Successfully added');</script>
  </cfif>
</cfif> --->
