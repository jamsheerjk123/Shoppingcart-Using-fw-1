component accessors="true" {

    property productServices;
    
    
    public any function init (fw) {
        variables.fw = fw;
        return this;
    }
    
    function default(rc){
       variables.fw.redirect("login.login_page");
    }

    //Diaplying All products
    function  home(rc){
        
        rc.products=variables.productServices.getAllProducts();
        
    }   
    
    //Searching products
    function jsearch(rc){
        rc.search = variables.productServices.getSearchByProduct(rc.term);

        result = arrayNew(1);

        for(var i=1;i<=rc.search.recordCount;i++) {
        result[i] = rc.search.Prod_Name[i];
        }

        variables.fw.renderData( "json", result);
    }
    function search (rc) {
        
        rc.search=variables.productServices.searchProduct(rc.productName)
        if (rc.search.recordCount==0){
            rc.message=["No results were found"];
            variables.fw.redirect(action="main.home",preserve='message')
        }   
    }
    function filterproduct(rc) {
        rc.categories=variables.productServices.getCategories()
    }
    function filter (rc) {

        
            if(structKeyExists(rc,'cat')){

                if(structKeyExists(rc,'price')){
                    local.string = listToArray(rc.price, "[],''");
                    rc.minRange=local.string[1]
                    rc.maxRange=local.string[2]
                    rc.data=variables.productServices.getProductsByCategory(rc.cat,rc.minRange,rc.maxRange);
                    
                }
                else{
                    rc.data=variables.productServices.getProductsByCategory(rc.cat);
                }
                
                
                

            }
            
            
            else{
                rc.data=variables.productServices.getAllProducts();
            }
            result = arrayNew(1);

            for(var i=1;i<=rc.data.recordCount;i++) {

                result[i] = '<div class="col-lg-4 col-md-6 col-sm-10 offset-md-0 offset-sm-1" style="margin-top:12px;">
                        <div class="card">
                            <div class="card-body">
                                <h6 class="font-weight-bold pt-1">#rc.data.Prod_Name[i]#</h6>
                                <div class="text-muted description">#rc.data.deacripton[i]#</div>
                                <div class="d-flex align-items-center product"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star"></span> </div>
                                <div class="d-flex align-items-center justify-content-between pt-3">
                                    <div class="d-flex flex-column">
                                        <div class="h6 font-weight-bold">#rc.data.Price[i]# USD</div>
                                        
                                    </div>
                                    <div class="btn btn-primary">Buy now</div>
                                </div>
                            </div>
                        </div>
                    </div>';
            }
        variables.fw.renderData( "json", result);
        }
        
        
    }

   