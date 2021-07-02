<cfset request.layout="false">
<html>
    <head><title>Login Page</title>
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
    

<body>
<h1 class="text-center"> Login </h1>
<cfparam name="rc.message" default="#arrayNew(1)#">
            <cfif not arrayIsEmpty(rc.message)>
              <cfloop array="#rc.message#" index="msg">
                <center><h5 style="color: red"><cfoutput>#msg#</cfoutput></h5></center>
              </cfloop>
            </cfif>
<div class="container"style="margin-top:60px">
    <form class="" method="post" action=<cfoutput>"#BuildURL(action='login.userlogin' )#"</cfoutput>>
        <div class="form-group">
          
          
            
        <div class="form-group">
          <label for="formGroupExampleInput2">UserName</label>
          <input type="text" class="form-control" id="formGroupExampleInput2" name="username" value="" placeholder="Enter a Username">
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2">Password</label>
            <input type="password" class="form-control" id="formGroupExampleInput2" name="password" value="" placeholder="Enter a password">
          </div>
          <br>
        <center><button class="btn btn-primary"type="submit">Signin</button></center>
        <br>

    </form>
    <p>Not a User?<a href="<cfoutput>#buildURL('login.signup') #</cfoutput>">Register</a></p>
</div>      
</body>
</html>