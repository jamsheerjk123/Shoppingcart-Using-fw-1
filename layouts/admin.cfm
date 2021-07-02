<cfset request.layout="false">
<!DOCTYPE html>
<html lang="en">

<head><meta charset="gb18030">
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="assets/css/ruang-admin.min.css" rel="stylesheet">
  <title>Shopping cart</title>
</head>
<!--- <cfif structKeyExists(session, "userId")>
  <cfelse>
    <cflocation url = "http://localhost:8888/myapp/" addToken = "no">
</cfif> --->
<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.cfm">
        <div class="sidebar-brand-icon">
          <img src="">
        </div>
        <div class="sidebar-brand-text mx-3">Shopping cart</div>
      </a>
      <hr class="sidebar-divider my-0">
      <li class="nav-item active">
        <a class="nav-link" href="index.cfm">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>
      <hr class="sidebar-divider">

  
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsetype"
          aria-expanded="true" aria-controls="collapseBootstrap">
          <i class="fa fa-book"></i>
          <span>Category</span>
        </a>
        <div id="collapsetype" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<cfoutput>#buildURL(action="admin.add_category",querystring="id=0")#</cfoutput>">Add category</a>
            <a class="collapse-item" href="<cfoutput>#buildURL("admin.edit_category")#</cfoutput>">Edit category</a>
            </div>
        </div>
      </li>
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsetype1"
          aria-expanded="true" aria-controls="collapseBootstrap">
          <i class="fa fa-book"></i>
          <span>Sub category</span>
        </a>
        <div id="collapsetype1" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<cfoutput>#buildURL("admin.add_subcategory")#</cfoutput>">Add subcategory</a>
            <a class="collapse-item" href="<cfoutput>#buildURL("admin.edit_subcategory")#</cfoutput>">Edit subcategory</a>
            </div>
        </div>
      </li>
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsebook"
          aria-expanded="true" aria-controls="collapseBootstrap">
           <i class="fas fa-fw fa-book"></i>
          <span>Products</span>
        </a>
        <div id="collapsebook" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
             <a class="collapse-item" href="<cfoutput>#buildURL("admin.add_product")#</cfoutput>">Add Products</a>
             <a class="collapse-item" href="<cfoutput>#buildURL("admin.edit_product")#</cfoutput>">Edit Products</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseebook"
          aria-expanded="true" aria-controls="collapseBootstrap">
          <i class="fa fa-user"></i>
          <span>User management</span>
        </a>
        <div id="collapseebook" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<cfoutput>#buildURL("admin.viewUsers")#</cfoutput>">View Users</a>
            <a class="collapse-item" href="<cfoutput>#buildURL("admin.orderDetails")#</cfoutput>">Users Order</a>
          </div>
        </div>
      </li>
    
    </ul>
    <!-- Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
        <nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">

          <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
          <div id="timestamp" style="color: white;font-size: 30px;"></div>
          
          <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown no-arrow mx-1">
           <a class="nav-link dropdown-toggle" href="#" id="goFS" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false" title="Click to fullscreen">
                <i class="fas fa-desktop fa-fw"></i>
                
              </a>
            </li>
            <div class="topbar-divider d-none d-sm-block"></div>
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
               
                <span class="ml-2 d-none d-lg-inline text-white small">Admin</span>
              </a>
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
              
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="<cfoutput>#buildURL("login.userlogout")#</cfoutput>">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>
          </ul>
        </nav>
        <!-- Topbar -->
        <cfoutput>
            #body#
        </cfoutput>
    
</div>


<!-- Scroll to top -->
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>

<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="assets/js/ruang-admin.min.js"></script>


</body>

</html>