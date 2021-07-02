component accessors ="true" {
    property cartServices;
    property orderServices;

    public any function init (fw) {
        variables.fw = fw;
        return this;
    }

    function default(rc){
        variables.fw.redirect("login.login_page"); 
    }

    //Display The Cart Page
    public void function mycart(rc){
        rc.cart=variables.cartServices.showCart()
    }
    
    //Adding to the Cart
    public void function addToCart(rc){
        if(structKeyExists(rc,'id')&& rc.id>0){
            rc.add_cart=variables.cartServices.addToCart(rc.id)
            variables.fw.redirect(action="main.home");
        } 
    }

    //Updating cart Details like Price & quantity
    public any function updatecart(rc){
        rc.updateCart=variables.cartServices.updateCart(rc.qty,rc.PID,rc.CID)
        rc.ajaxdata=rc.updateCart.Price*rc.qty
        return rc.ajaxdata
    }

    //Buying the product from the cart Itself
    public any function cartBuy(rc){
        rc.ajaxdata=variables.orderServices.buyCart(rc.ID)
        return rc.ajaxdata    
    }

    //Displaying the Total Price of products inserted in the cart
    public void function checkout(rc){
        rc.cart=variables.cartServices.showCart()
        rc.sum=variables.cartServices.sumTotal()
    }

    //Buying All Products inserted in the cart
    public void function buyall(rc){
        rc.buyAll=variables.orderServices.buyAll();
        variables.fw.redirect(action="orders.thank_you_page")
    }


    //Removing the products from the cart
    public any function removeItem(rc){
        rc.remove =variables.cartServices.removeItem(rc.ID)
    }
}