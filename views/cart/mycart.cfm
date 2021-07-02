

            <section class="section-3" id="pricing" style="margin-top:100px">
              <div class="container">
                 <div class="row">
                   
                   <h1 class="text-center">MY CART</h1>
                   <p class="text-center">Simple and affordable price for your and your product</p>
                   <p class="text-center"><a href="<cfoutput>#buildURL("cart.checkout")#</cfoutput>" class="btn btn-danger btn-sm txt-right">Buy All</a></p>
             <span id="del" style="color:red;display:none">Item Removed</span>      
             <table class="table table-dark table-striped" id="example1">
             <thead>
              <tr>
                <td>Sl No</td>
                <td>Product</td>
                <td>Price</td>
                <td>Quantity</td>
                <td>Total</td>
                <td>Action</td>
              </tr>
             </thead>
             <tbody>
             <cfoutput query="#rc.cart#">
              <!--- <cfset tot="#GetCarts.Quantity * GetCarts.Price#"> --->
              <tr>
                <td>#ID#</td>
                <td>#Prod_Name#</td>
                <td>#Price#</td>
                <td><input type="number" class="quantity" value="#Quantity#" id="quantity#ID#" onchange="change_qty(this.value,#pid#,#ID#)" min=1 max=10 ></td>
                <td><span id="tot#ID#">#TotalPrice#</span></td>
                <td><a class="btn btn-primary btn-sm buy" data-id="#ID#" >Buy Now</a>&nbsp;&nbsp;<span id="delete" class="delete btn btn-danger btn-sm del" data-id='#ID#'>Remove</span></td>
              </tr>
             </cfoutput>
             
             </tbody>
             </table>
             
             </div>
               </div>
             </section>
             <script>
               function change_qty(val,pid,id){

                if (val < 1) {
                  $("#quantity"+id).val(1)
                  val=1
                  
                }
                if(val > 10){
                  $("#quantity"+id).val(10)
                  val=10
                  
                  
                }

                $.ajax({
                  type: "POST",
                  url:"mycart.cfm?action=cart.updatecart",
                  data:{"qty":val,"PID":pid,"CID":id},
                  success:function(ajaxdata){
                    $("#tot"+id).html(ajaxdata)
                  }
                })

               }
               $(document).ready(function(){
                 $('.buy').click(function(){
                  var el = this; 
                  var id=$(this).data('id');
                  $.ajax({
                  type: "POST",
                  url:"mycart.cfm?action=cart.cartBuy",
                  data:{"ID":id},
                  success: function(){
                   
                              $(el).closest('tr').css('background','tomato');
                              $(el).closest('tr').fadeOut(800,function(){
                              $(this).remove();
                              alert("Item Purchased Successfully")  
                              });
                              
                          }   
                })
                 })
               })
              
               
               $(document).ready(function(){
                 $('.del').click(function(){
                  var el = this; 
                  var id=$(this).data('id');
                  $.ajax({
                  type: "POST",
                  url:"mycart.cfm?action=cart.removeItem",
                  data:{"ID":id},
                  success: function(){
                    
                              $(el).closest('tr').css('background','tomato');
                              $(el).closest('tr').fadeOut(800,function(){
                              $(this).remove();
                              $("#del").fadeIn()
                              $("#del").fadeOut(3000)
                              

                              });
                              
                          }   
                })
                 })
               })

                

               
             </script>

