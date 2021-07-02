<cfif isDefined("url.id")>
    <cfoutput query=#rc.getsub#>

        <cfset button="Update">
    <cfset subid="#ID#" > 
    <cfset sub="#Sub_Name#">
    <cfset cat="#CategoryName#">
    <cfset catid="#cid#">

    </cfoutput>
    
    
<cfelse> 
    <cfset subid="0" >
    <cfset button="Add">
    <cfset sub="">
    <cfset cat="Choose Your Category">
    <cfset catid="">  


</cfif>
  <!-- Container Fluid-->
  <div class="container-fluid" id="container-wrapper">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <cfparam name="rc.message" default="#arrayNew(1)#">
      <h1 class="h3 mb-0 text-gray-800"><cfoutput>#button#</cfoutput> SUBCATEGORY</h1>
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
            <form method="post"action="<cfoutput>#buildURL(action="admin.addsub")#</cfoutput>">
              <div class="form-group">
              <input type="hidden" name="id" value="<cfoutput>#subid#</cfoutput>">

                <label for="exampleInputEmail1">Sub Category Name</label>
                <input type="text" name="subName" class="form-control" value="<cfoutput>#sub#</cfoutput>" placeholder="Enter Subcategory Name" required="">
              </div>
              
              
              <select class="form-select form-select-lg mb-3" aria-label="Default select example" name="cats">
                <option value=<cfoutput>#catid#</cfoutput>  selected><cfoutput>#cat#</cfoutput></option>
                <cfoutput query="#rc.show#">
                    <option value=#ID#>#CategoryName#</option>
                </cfoutput>
                
                
              </select><br><br>
              <button type="submit" class="btn btn-primary" name ="<cfoutput>#button#</cfoutput>"><cfoutput>#button#</cfoutput></button>
            </form>
          </div>
        </div>
      </div>
   </div>