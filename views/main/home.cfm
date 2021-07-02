
 
<!--- <cfoutput>

    
    

    <h3 class="text-center">Add Customer</h3>
    <center><a href="#buildURL("main.add")# " class="btn btn-primary ">Add</a></center>
    <br>
    <h3 class="text-center">Logout</h3>
    <center><a href="#buildURL("login.userlogout")# " class="btn btn-primary ">Logout</a></center>
    <h3 class="text-center">#rc.title#</h3>  <br>

</cfoutput> --->

<div class="container"style="padding:150px 50px 150px 50px">
    
  <cfparam name="rc.message" default="#arrayNew(1)#">
  <cfif not arrayIsEmpty(rc.message)>
    <cfloop array="#rc.message#" index="msg">
      <p style="margin-top:80px;  "><cfoutput>#msg#</cfoutput></p>
    </cfloop>
  </cfif>
  
  <div class="row">
      <cfoutput query="#rc.products#">
       
      <div class=col-4>
       
        
              <div class="card#ID#" style="margin-bottom:5px;border:1px solid black">
                
                  <div class="card-body">
                    <h5 class="card-title">#Prod_Name#</h5>
                    <p class="card-text">#deacripton#</p>
                  </div>
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item">#Sub_Name#</li>
                    <li class="list-group-item">#CategoryName#</li>
                    <cfif #Quantity# lt 1  >
                      <li class="list-group-item"><strong>Out of Stock</strong></li>   
                    </cfif>
                    <li class="list-group-item"><strong>Rs:#Price#</strong></li>
                  </ul>
                  <div class="card-body">
                      <a href="#buildURL(action='cart.addToCart',queryString="id=#ID#")#" class="btn btn-warning bt#ID#" onclick="msg()">Add To Cart</a>
                      <!--- <span class="1#ID# hide1"  >
                          Quantity:<input   id="inputsm" type="text"style="width:60px"><br><br>
                          <a class="btn btn-primary" onclick="orders(#ID#)" >Buy</a><br><br>
                      </span> --->
                      
                      
                      <a href="#buildURL(action='orders.buy_product',queryString="id=#ID#")#" class="btn btn-primary"  >Buy</a>
                  </div>
              
              </div>
              
          
         
          

      </div>
  </cfoutput>
  </div>

      
</div>


</div>

<a href="<cfoutput>#buildURL(action='main.search')#</cfoutput>">Goto Home Page</a>
<script>
  function msg(){
    alert("Succrssfully Added To Cart")
  }
</script>