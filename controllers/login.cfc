component accessors ="true"{


    property customerServices;
    


    public any function init (fw) {
         variables.fw = fw;
         return this;
    }
    
    //Display the Login Page
    function default(rc){
        variables.fw.redirect("login.login_page");
    }

    //To Register the user 
    public void function save(rc){
        rc.customer=variables.customerServices.saveCustomer(rc.id,rc.fullname,rc.email,rc.phonenumber,rc.username,rc.password)
        variables.fw.redirect(action="login.default");
    }
    
    //Authentication Of a User
    public void function userlogin(rc) {
        rc.user=variables.customerServices.login(rc.username,rc.password)
        if(rc.user.recordCount EQ 1 && rc.user.role EQ 1){
            session.auth.isLoggedIn = true;
            session.id = rc.user.ID;
            variables.fw.redirect(action="admin.default")
        }
        else if (rc.user.recordCount EQ 1){
            session.auth.isLoggedIn = true;
            session.id = rc.user.ID;    
            variables.fw.redirect(action="main.home")
        }
        rc.message = ["Username or Password is Incorrect"];
        variables.fw.redirect(action="login.login_page",preserve='message');
    }

    //User Logout 
    public void function userlogout(rc){
        session.auth.isLoggedIn = false;
        structdelete(session,"id")   
        variables.fw.redirect(action="login.default");
    }

}

