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
                  <th>ID</th>
                  <th>Customer  Name</th>
                  <th>Email</th>
                  <th>Phone Number</th>
                  <th>Username</th>
                  <th>Role</th>
                </thead>
                
              <tbody>
                  <cfoutput query="#rc.show#">
                       <!--- <cfscript>
                          key = generateSecretKey('AES');
                          encryptedMsg = encrypt(#ID#,key,'AES', 'Base64');
                      </cfscript> --->
                      <tr>
                        
                      <td>#ID#</td>    
                      <td>#CustomerName#</td>    
                      <td>#Email#</td>
                      <td>#PhoneNumber#</td>
                      <td>#username#</td>
                      <td><cfif #role# EQ 0><coutput>Customer</coutput><cfelse><coutput>Admin</coutput></cfif></td>
                      
                      
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
