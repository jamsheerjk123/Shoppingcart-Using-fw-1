<cfif structKeyExists(session,"id")>
<html>
    <head><title>Home Page</title>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
  .navcustom{
    background: #d1b932;
    padding:10px 0px 10px 0px;
   
  }
  .navcustom a{
    font-size:20px;
    color:white;
    text-decoration: none;
    letter-spacing:1px;
  }
  
</style>
</head>
    


<body>
  <nav class="navbar fixed-top navbar-expand-lg navcustom "  >
    <div class="container-fluid">
      <!--- <a class="navbar-brand" href="#">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button> --->
      <form class="d-flex"  method="post" action=<cfoutput>"#BuildURL(action='main.search' )#"</cfoutput>>
        <input class="form-control mr-sm-2" id="rew" type="text"  name="productName" placeholder="Search Your Products" aria-label="Search">
        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
      </form>
      
      <div class="collapse navbar-collapse " id="navbarNav">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
          <li class="nav-item">
           
          </li>
          <li class="nav-item">
            <a class="nav-link " aria-current="page" href="<cfoutput>#buildURL("main.home")#</cfoutput>">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " aria-current="page" href="<cfoutput>#buildURL("main.filterproduct")#</cfoutput>">Products</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<cfoutput>#buildURL("cart.mycart")#</cfoutput>">My cart</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<cfoutput>#buildURL("orders.myorders")#</cfoutput>">My Orders</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<cfoutput>#buildURL("login.userlogout")#</cfoutput>"><button class="btn btn-danger"type="button" >Logout</button></a>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>
      <cfoutput>
        #body#
      </cfoutput>
      
      <!-- JavaScript Bundle with Popper -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
      <script>
            $(function() {
                    $("#rew").autocomplete({
                        source: "main.cfm?action=main.jsearch",
                    });
                });
      </script>
      
    </body>
  </html>
<cfelse>
  <cflocation url="login_page.cfm"> 
</cfif>