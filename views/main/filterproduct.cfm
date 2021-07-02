<link rel="stylesheet" type="text/css" href="assets/filter.css">
<div class="wrapper">
  <div class="d-md-flex align-items-md-center">
      <div class="h3">Fruits and vegetables</div>
      <div class="ml-auto d-flex align-items-center views"> <span class="btn text-success"> <span class="fas fa-th px-md-2 px-1"></span><span>Grid view</span> </span> <span class="btn"> <span class="fas fa-list-ul"></span><span class="px-md-2 px-1">List view</span> </span> <span class="green-label px-md-2 px-1">428</span> <span class="text-muted">Products</span> </div>
  </div>
  
  
  <div class="filters"> <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#mobile-filter" aria-expanded="true" aria-controls="mobile-filter">Filter<span class="px-1 fas fa-filter"></span></button> </div>
  <div id="mobile-filter">
      
      
      
  </div>
  <div class="content py-md-0 py-3">
      <section id="sidebar">
          <div class="py-3">
              <h5 class="font-weight-bold">Categories</h5>
              <form class="brand"  >
                <cfoutput query="#rc.categories#">
                  <div class="form-inline d-flex align-items-center py-1"> <label class="tick">#CategoryName#<input class="productDetail category" type="checkbox"  id="category" value=#ID#> <span class="check"></span> </label> </div>
                </cfoutput>
              </form>
          </div>
          <div class="py-3">
              <h5 class="font-weight-bold">Price</h5>
              <form class="brand">
                  <div class="form-inline d-flex align-items-center py-1"> <label class="tick">500-1000 <input class="price go" type="checkbox" value="['500','1000']"> <span class="check"></span> </label> </div>
                  <div class="form-inline d-flex align-items-center py-1"> <label class="tick">1000-3000<input class="price go" type="checkbox" value="[500,2000]" > <span class="check"></span> </label> </div>
                  <div class="form-inline d-flex align-items-center py-1"> <label class="tick">3000-7000 <input class="price go" type="checkbox" value="[500,3000]" > <span class="check"></span> </label> </div>
                  <div class="form-inline d-flex align-items-center py-1"> <label class="tick">7000-15000 <input class="price go" type="checkbox" value="[500,4000]"> <span class="check"></span> </label> </div>
                  <div class="form-inline d-flex align-items-center py-1"> <label class="tick">15000-above <input class="price go" type="checkbox" value="[500,50000]"> <span class="check"></span> </label> </div>
              </form>
          </div>
          
      </section> <!-- Products Section -->
      <section id="products">
          <div class="container py-3">
              <div class="row searchResult">
                 
                  
                  
                  
              </div>
          </div>
      </section>
  </div>
</div>

<script>
  $(document).ready(function(){
    filterSearch(); 
    $('.price').click(function(){
      
      $('.price').not(this).prop('checked', false)
      filterSearch()
    })
    $('.productDetail').click(function(){
        
      filterSearch()
      
    }); 
  }); 
function filterSearch() {
    $('.searchResult').html('<div id="loading">Loading .....</div>');
    var action = 'fetch_data';
    // var minPrice = $('#minPrice').val();
    // var maxPrice = $('#maxPrice').val();
    var price=getPrice('go')
    var cat = getFilterData('category');
    $.ajax({
        url:"filterproduct.cfm?action=main.filter",
        method:"POST",
        dataType: "json",       
        data:{act:'filterproduct', cat:cat,price:price},
        success:function(result){
            $('.searchResult').html(result);
        }
    });
}
function getFilterData(className) {
    var filter = [];
    $('.'+className+':checked').each(function(){
        filter.push($(this).val());
    });
    
    return filter;
}
function getPrice(className) {
  
  var price=$('.'+className+':checked').val();
  
  return price
}
</script>
