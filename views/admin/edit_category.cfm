<div class="content">
    <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header card-header-primary">
            <h4 class="card-title ">View And Edit Your Category Here</h4>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered align-items-center table-flush" id="dataTable">
                <thead class=" text-primary">
                  
                  <th>Category Name</th>
                  <th>Created Date</th>
                  <th>Updated Date</th>
                  <th>Action</th>
                </thead>
                
                   
               
              <tbody>
                 
                       <!--- <cfscript>
                          key = generateSecretKey('AES');
                          encryptedMsg = encrypt(#ID#,key,'AES', 'Base64');
                      </cfscript> --->
                      <cfoutput query="#rc.show#" >
                      <tr>
                        
                         
                      <td>#CategoryName#</td>
                      <td>#Date_created#</td>
                      <td>#updated_date#</td>
                      
                      <td><a href="#buildURL(action="admin.add_category",querystring="id=#ID#")#" class="btn btn-primary btn-sm">Edit</a></td>
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
