component accessors ="true" {
    property adminServices;

    public any function init (fw) {
        variables.fw = fw;
        return this;
   }
    public void function default(rc){

    

    }
    
    //Adding And Editing Categories

    //To display the page for Adding and Editing Categories
    public void function add_category(rc){
        
        if (structkeyexists(rc,'id') && rc.id>0){
            rc.title="Edit Category"
            rc.button="update"
            rc.get=variables.adminServices.getCategory(rc.id)  
            rc.cat=rc.get.CategoryName 
            rc.id=rc.id 
        }
        else{
            rc.button="Add"
            rc.title="Add Category"
            rc.cat=""
            rc.id=0   
        }    
    }

    //To display the page for  Categories To Edit
    public any function edit_category(rc){
        rc.show=variables.adminServices.showCategory()             
    }

    
    // Adding and Editing Categories
    public any function add(rc){
        
        if(rc.id==0){
            rc.get=variables.adminServices.catName(rc.catName)
            
            if(rc.get.recordCount==0){
                rc.add=variables.adminServices.addCategory(rc.id,rc.catName);
                rc.message = ["Added Successfully"];
                variables.fw.redirect(action="admin.add_category",preserve='message')
            }
            else{
                rc.message = ["Already Added"];
                variables.fw.redirect(action="admin.add_category",preserve='message')
            }
        }  
        rc.add=variables.adminServices.addCategory(rc.id,rc.catName);        
        variables.fw.redirect("admin.edit_category")
    }

    //Subcategory Adding And Edit

    //To display the page for Adding and Editing Subcategories
    public void function add_subcategory(rc){
        
        if (structkeyexists(rc,'id') && rc.id>0){
            
            rc.getsub=variables.adminServices.getSubCategory(rc.id)
            rc.show=variables.adminServices.showCategory()    
        }
        else{
            rc.show=variables.adminServices.showCategory() 
        }
    }

    //To view the subcategories for Editing
    public void function edit_subcategory(rc){
        rc.show=variables.adminServices.showSubCategory()
    }

    //To Add and Edit the Subcategory
    public  void  function addsub(rc){
 
        if (structkeyexists(rc,'id') && rc.id>0){
             
            rc.add=variables.adminServices.addSubCategory(rc.id,rc.subName,rc.cats)
            rc.message = ["Updated Successfully"];
            variables.fw.redirect(action="admin.edit_subcategory",preserve='message') 
        }
        else{
            rc.get=variables.adminServices.subName(rc.id,rc.subName)
            if(rc.get.recordCount==0){
                rc.add=variables.adminServices.addSubCategory(rc.id,rc.subName,rc.cats)
                rc.message = ["Added Successfully"];
                variables.fw.redirect(action="admin.add_subcategory",preserve='message')
            }
            else{
                rc.message = ["Already Added"];
                variables.fw.redirect(action="admin.add_subcategory",preserve='message')
            }
        }
        
    }

    //Adding And Editing Products

    //Display the page for adding and editing Products
    public void function add_product(rc){
        if (structkeyexists(rc,'id')&& rc.id>0){
            rc.title="Edit Product"
            rc.getpro=variables.adminServices.getProduct(rc.id)
            rc.showsub=variables.adminServices.showSubCategory()
            rc.showcat=variables.adminServices.showCategory()
        }
        else {
            rc.title="Add Product"
            rc.showsub=variables.adminServices.showSubCategory()
            rc.showcat=variables.adminServices.showCategory()     
        }   
    }

    //Showing the subcategories When we Select Category
    public any function getsubcat(rc){
       

        rc.sub=variables.adminServices.getsub(rc.ID) 
        cfloop (query=rc.sub){
            var sub=writeOutput("<option value='#rc.sub.ID#'>#rc.sub.Sub_Name#</option>")
        }   
        variables.fw.renderData("html",sub)   
    }

    //Listing the Product to Edit
    public void function edit_product(rc){
        rc.show=variables.adminServices.showProducts()
    }

    //Adding the Product
    public void function addProduct(rc){
        
        if (structkeyexists(rc,'id') && rc.id>0){
            rc.add=variables.adminServices.addProduct(rc.id,rc.productName,rc.cats,rc.subs,rc.prices,rc.quantitys,rc.Description)
            rc.message = ["Updated Successfully"];
            variables.fw.redirect(action="admin.edit_product",preserve='message')     
        }
        else{
            rc.productExists=variables.adminServices.getPro(rc.productName)
            if(rc.productExists.recordcount==0){
                rc.add=variables.adminServices.addProduct(rc.id,rc.productName,rc.cats,rc.subs,rc.prices,rc.quantitys,rc.Description)
                rc.message = ["Product Added Successfully"];
                variables.fw.redirect(action="admin.add_product",preserve='message')
            }
            rc.message = ["Product Already Added"];
            variables.fw.redirect(action="admin.add_product",preserve='message')
        }   
    }

    //To delete Products
    public void function delete(rc){
        rc.delete=variables.adminServices.deleteProduct(rc.ID)
    }

    //Order Details
    public void function orderDetails(rc){
        rc.show=variables.adminServices.showOrders()
    }

    //Update order Status
    public void function updateStatus(rc){
        rc.update=variables.adminServices.updateOrderStatus(rc.status,rc.ID )
    }

    //User Details
    public void function viewUsers(rc){
        rc.show=variables.adminServices.userDetail()
    }
}