<div class="container">
 
  
    <div class="row">
      
        <cfoutput query="#rc.item#">
            
        
        <div class=col-4>
            
          
                <div class="card#ID#" style="width: 18rem;margin-top:100px;border:1px solid black">
                    
                    <div class="card-body">
                      <h5 class="card-title">#Prod_Name#</h5>
                      <p class="card-text">#deacripton#</p>
                    </div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item">#Sub_Name#</li>
                      <li class="list-group-item">#CategoryName#</li>
                      <li class="list-group-item"><input type="number" class="quantity" value="" id="quantity#ID#" onchange="change_qty(this.value,#ID#)" min=1 max=10 ></li>

                      <!--- <cfif #Quantity# lt 1  >
                        <li class="list-group-item"><strong>Out of Stock</strong></li>   
                      </cfif> --->
                      <li class="list-group-item" id="tot#ID#" >#Price#</li>
                    </ul>
                    <div class="card-body">
                        <a href="#buildURL(action='cart.addToCart',queryString="id=#ID#")#" class="btn btn-warning bt#ID#">Add To Cart</a>
                        <!--- <span class="1#ID# hide1"  >
                            Quantity:<input   id="inputsm" type="text"style="width:60px"><br><br>
                            <a class="btn btn-primary" onclick="orders(#ID#)" >Buy</a><br><br>
                        </span> --->
                        
                        
                        <a  onclick="buy(#ID#)"   class="btn btn-primary" >Place Order</a>
                    </div>
                
                </div>
                
            
           
            
  
        </div>
    </cfoutput>
    </div>
  
        
  </div>
  
  
  </div>
  <script>
    function change_qty(val,id){

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
        url:"buy_product.cfm?action=orders.totalPrice",
        data:{"qty":val,"ID":id},
        success : function(ajaxdata){
          $('#tot'+id).html(ajaxdata);
        }
      })

    }
    function buy(id){

      var qty=$("#quantity"+id).val()
      if (qty <1){
        var qty=1
      }
      $.ajax({
        type: "POST",
        url:"buy_product.cfm?action=orders.place_order",
        data:{"id":id,"qty":qty},
        success: function(result){


            window.location="buy_product.cfm?action=orders.thank_you_page"
        }
      })

    }

  </script>