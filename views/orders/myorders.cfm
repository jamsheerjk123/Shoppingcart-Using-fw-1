
<div class="container" style="margin-top:70px">
<table class="table table-striped">
    <thead>
      <tr>
        <th scope="col">Order ID</th>
        <th scope="col">Product Name</th>
        <th scope="col">Quantity</th>
        <th scope="col">Total Price</th>
        <th scope="col">Date Of Order</th>
      </tr>
    </thead>
    <tbody>
      <cfoutput query="#rc.orders#" > 
        <tr >
        <th scope="row">#ID#</th>
        <td>#Prod_Name#</td>
        <td>#Quantity#</td>
        <td>#TotalPrice#</td>
        <td>#Order_date#</td>
      </tr>
    </cfoutput> 
    </tbody>
  </table>
</div>
<script>