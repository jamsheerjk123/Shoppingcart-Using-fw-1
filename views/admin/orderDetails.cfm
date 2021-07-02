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
                  <th>OrderDate</th>
                  <th>status</th>
                </thead>
                
                
              <tbody>
                  <cfoutput query="#rc.show#">
                    <cfif #status# EQ 0>
                        <cfset status1="Pending">
                    <cfelseif #status# EQ 1 >
                        <cfset status1="Shipped">
                    <cfelseif #status# EQ 2 >
                        <cfset status1="Cancelled">
                    <cfelseif #status# EQ 3 >
                        <cfset status1="Delivered">
                    </cfif>
                      <tr>
                        
                      <td >#ID#</td>    
                      <td>#CustomerName#</td>    
                      <td>#Prod_Name#</td>
                      <td>#TotalPrice#</td>
                      <td>#Quantity#</td>
                      <td>#Order_date#</td>
                      <td><select class="form-select form-select-lg mb-3" aria-label="Default select example" name="status"  onchange="update(this.value,#ID#)">
                        
                        <option value="<cfoutput>#status#</cfoutput>" selected>#status1#</option</td>
                        <option value="0" >Pending</option</td>
                        <option value="1" >Shipped</option</td>
                        <option value="2" >Cancelled</option</td>
                        <option value="3" >Deliverd</option</td>
                      
                      
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
<script>

        function update(status,id){
           
            $.ajax({
                type: "POST",
                url: "orderDetails.cfm?action=admin.updateStatus",
                data:{"status":status,"ID":id},
                success: function(){

                }
            
            })   
    
        }
   
            
</script>