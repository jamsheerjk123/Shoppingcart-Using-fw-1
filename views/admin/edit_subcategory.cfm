<div class="content">
    <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header card-header-primary">
            <h4 class="card-title ">View And Edit Your Category Here</h4>
            <cfparam name="rc.message" default="#arrayNew(1)#">
            <cfif not arrayIsEmpty(rc.message)>
              <cfloop array="#rc.message#" index="msg">
                <center><h5 style="color: green"><cfoutput>#msg#</cfoutput></h5></center>
              </cfloop>
            </cfif>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered align-items-center table-flush" id="dataTable">
                <thead class=" text-primary">
                  <th>SubCategory Name</th>
                  <th>Category Name</th>
                  <th>Created Date</th>
                  <th>Updated Date</th>
                  <th>Action</th>
                </thead>
                
              <tbody>
                  <cfoutput query="#rc.show#">
                       <!--- <cfscript>
                          key = generateSecretKey('AES');
                          encryptedMsg = encrypt(#ID#,key,'AES', 'Base64');
                      </cfscript> --->
                      <tr>
                        <cfparam name="rc.message" default="#arrayNew(1)#">
                      <td>#Sub_Name#</td>    
                      <td>#CategoryName#</td>
                      <td>#Date_created#</td>
                      <td>#updated_date#</td>
                      
                      <td><a href="#buildUrl(action="admin.add_subcategory",querystring="id=#id#")#" class="btn btn-primary btn-sm">Edit</a></td>
                      </tr>
                      </cfoutput>


               
          </tbody>
      </table>
    </div>
  </div>
</div>
</div>
</div>
</div>
</div>