<div class="content">
    <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header card-header-primary">
            <h4 class="card-title ">View And Edit Your Product Here</h4>
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
                  <th>Product Name</th>
                  <th>SubCategory Name</th>
                  <th>Category Name</th>
                  <th>Price</th>
                  <th>Quantity</th>
                  <th>Action</th>
                </thead>

              <tbody>
                  <cfoutput query="#rc.show#">
                       <!--- <cfscript>
                          key = generateSecretKey('AES');
                          encryptedMsg = encrypt(#ID#,key,'AES', 'Base64');
                      </cfscript> --->
                      <tr>
                      <td>#Prod_Name#</td>  
                      <td>#Sub_Name#</td>    
                      <td>#CategoryName#</td>
                      <td>#Price#</td>
                      <td>#Quantity#</td>
                      
                      <td><a href="#buildURL(action="admin.add_product",querystring="id=#ID#")#" class="btn btn-primary btn-sm">Edit</a>&nbsp;&nbsp;&nbsp;<a class="btn btn-danger btn-sm del" style="color:white" data-id='#ID#'>Delete</a></td>
                      
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
 

    $(document).ready(function(){
                 $('.del').click(function(){
                  var el = this; 
                  var id=$(this).data('id');
                  $.ajax({
                  type: "POST",
                  url:"edit_product.cfm?action=admin.delete",
                  data:{"ID":id},
                  success: function(){
                    
                              $(el).closest('tr').css('background','tomato');
                              $(el).closest('tr').fadeOut(800,function(){
                              $(this).remove();

                              });
                              
                          }   
                })
                 })
               })

  
</script>