component accessors ="true" {

    property orderServices;

    public any function init (fw) {
        variables.fw = fw;
        return this;
   }

    function default(rc){
        variables.fw.redirect("login.login_page");
    }

    //Displaying the order of a user
    public void function myorders(rc){
        rc.orders=variables.orderServices.myorder()   
    }
    
    //To get total price of a product when a user select a product from home Page
    public any  function totalPrice(rc){
        rc.price=variables.orderServices.total(rc.qty,rc.ID)    
        rc.ajaxdata=rc.qty*rc.price.Price   
        return rc.ajaxdata    
    }


    //Getting the details of selected Product  
    public void function buy_product(rc){
        if(structKeyExists(rc,'id') && rc.id>0){
            rc.item=variables.orderServices.getItem(rc.id)    
        }
    }

    //Placing the order and redirecting to the thank you page
    public void function place_order(rc){
        rc.order=variables.orderServices.buyFromHome(rc.id,rc.qty)
        variables.fw.redirect(action="orders.thank_you_page")

    }


}