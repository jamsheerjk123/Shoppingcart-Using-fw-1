<cfif isDefined("url.id")>

    <cfoutput  query="#rc.getpro#">
        <cfset id="#ID#">
        <cfset pro="#Prod_Name#">
        <cfset sub="#Sub_Name#">
        <cfset subid="#suid#">
        <cfset cat="#CategoryName#">
        <cfset catid="#cid#">
        <cfset price="#Price#">
        <cfset quantity="#Quantity#">
        <cfset des="#deacripton#">
        <cfset button ="#rc.title#">
    </cfoutput>

    
<cfelse>
    <cfset id="0">
    <cfset pro="">
    <cfset sub="">
    <cfset subid="">
    <cfset cat="">
    <cfset catid="">
    <cfset price="">
    <cfset quantity="">
    <cfset des="">
    <cfset button ="#rc.title#">

</cfif>
  <!-- Container Fluid-->
  <div class="container-fluid" id="container-wrapper">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800"><cfoutput>#rc.title#</cfoutput></h1>
      <cfparam name="rc.message" default="#arrayNew(1)#">
            <cfif not arrayIsEmpty(rc.message)>
              <cfloop array="#rc.message#" index="msg">
                <center><h5 style="color: green"><cfoutput>#msg#</cfoutput></h5></center>
              </cfloop>
            </cfif>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <!-- Form Basic -->
        <div class="card mb-4">
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary"></h6>
          </div>
          <div class="card-body">
            <form method="post" action="<cfoutput>#buildURL("admin.addProduct")#</cfoutput>" >
            <input type="hidden" name="id" value="<cfoutput>#id#</cfoutput>">
              <div class="form-group">
                <label for="exampleInputEmail1"> Product Name</label>
                <input type="text" name="productName" value="<cfoutput>#pro#</cfoutput>" class="form-control"  placeholder="Enter Product Name" required="">
              </div>
            <div>
                
                <label for="exampleInputEmail1"> Category</label>
                <select class="form-select form-select-lg mb-3" aria-label="Default select example" name="cats" id="cat">
                  <option value="<cfoutput>#catid#</cfoutput>" selected><cfoutput>#cat#</cfoutput></option>
                  <cfoutput query="#rc.showcat#">
                      <option value=#ID#>#CategoryName#</option>
                  </cfoutput>

            </div>
              
                
                
              </select>
              <div>

                <label for="exampleInputEmail1"> SubCategory</label>
                <select class="form-select form-select-lg mb-3" aria-label="Default select example" name="subs" id="sub">
                    <option value="" selected>select Sub category</option>
                    <option value="<cfoutput>#subid#</cfoutput>" selected><cfoutput>#sub#</cfoutput></option>
                   
                    
                    
                  </select>

              </div>
              
              <div>     
              <label for="exampleInputEmail1"> Price</label>
                <input type="text" name="prices" class="form-control" value="<cfoutput>#price#</cfoutput>" placeholder="Enter Price" required="">
              </div>
              <div>
              <label for="exampleInputEmail1"> Quantity</label>
                <input type="text" name="quantitys" class="form-control" value="<cfoutput>#quantity#</cfoutput>" placeholder="Enter Quantity" required="">
              </div><br>
              <div class="input-group" >
                <span class="input-group-text">Description</span>
                <textarea class="form-control" aria-label="With textarea" name="Description" value=""><cfoutput>#des#</cfoutput></textarea>
              </div><br>
              <button type="submit" class="btn btn-primary" name ="<cfoutput>#button#</cfoutput>"><cfoutput>#button#</cfoutput></button>
            </form>
          </div>    
        </div>
      </div>
   </div>
   <script>
   $(document).ready(function(){
    $("#cat").change(function(){
       var id=$(this).val();
       console.log(id)
       $.ajax({
           type: "POST",
           url:"add_product.cfm?action=admin.getsubcat",
           data:{"ID":id},
           success: function(sub){
               $("#sub").html(sub)
           }
       })
   })
   })
   
   </script>