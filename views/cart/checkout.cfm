<div class="container" style="margin-top:70px">
    <table class="table">
        <thead>
         <tr>
           <td>Product</td>
           <td>Quantity</td>
           <td>Total</td>
         </tr>
        </thead>
        
        <tbody>
        <cfoutput query="#rc.cart#" >
         <!--- <cfset tot="#GetCarts.Quantity * GetCarts.TotalPrice#"> --->
         <tr>
           <td>#Prod_Name#</td>
           <td>#Quantity#</td>
           <td><span id="tot#ID#">#TotalPrice#</span></td>
         </tr>
        </cfoutput>
        </tbody>
        </table>
        <h4 class="text-center">SUB TOTAL :  <cfoutput>#rc.sum.totsum#</cfoutput></h4>
        <div class="text-center">
        <a href="<cfoutput>#buildURL("cart.buyall")#</cfoutput>" class="btn btn-primary btn-sm text-center">Checkout Now</a>
        </div>

</div>
