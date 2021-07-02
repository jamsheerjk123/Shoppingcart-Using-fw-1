<cfcomponent>
    <cffunction name="getAllCustomers">
        <cfquery name="allCustomers">
            select CustomerName,Email,PhoneNumber,username,ID from customer 
        </cfquery>
        <cfreturn allcustomers/>
    </cffunction>
    <cffunction name='getCustomer' access="public" returntype="query">
        <cfargument name="id" required="true" type="numeric">
        <cfquery name="customer">
            select CustomerName,Email,PhoneNumber,username from customer where ID=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn customer/>
    </cffunction>
    <cffunction name='saveCustomer' access="public" >
        <cfargument name="id" required="true" type="numeric" default="0">
        <cfargument name="fullname" required="true" type="string">
        <cfargument name="email" required="true" type="string">
        <cfargument name="phonenumber" required="true" type="string">
        <cfargument name="username" required="true" type="string">
        <cfargument name="password" required="true" type="string">
        <cfset var customerExist=getCustomer(id).recordCount>
        <cfif arguments.id gt 0 AND customerExist>
            <cfquery name="updateCustomer">
                update customer set CustomerName=<cfqueryparam value= "#arguments.fullname#" cfsqltype="cf_sql_varchar">,Email=<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,PhoneNumber=<cfqueryparam value="#arguments.phonenumber#" cfsqltype="cf_sql_varchar">,username=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar"> where ID =<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfdump var ="updateCustomer">
            
        <cfelseif arguments.id EQ 0>
            <cfquery name="createCustomer">
                insert into customer  (CustomerName,Email,PhoneNumber,username,PASSWORD) values(<cfqueryparam value="#arguments.fullname#" cfsqltype="cf_sql_varchar">,<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,<cfqueryparam value="#arguments.phonenumber#" cfsqltype="cf_sql_varchar">,<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">,<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">)
            </cfquery>
            <cfreturn >    
        </cfif>
    </cffunction>
    <cffunction name="delete" access="public" >
        <cfargument name="id" required ="true" type="numeric">
        <cfquery>
            delete  from customer where ID=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        
    </cffunction>
    <cffunction name="login" access="public"  returntype="query">
        <cfargument name="username" required="true" type="string">
        <cfargument name="password" required="true" type="string">
        <cfquery name="user">
            select * from customer where username=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar"> AND password = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn user>
    </cffunction>   
</cfcomponent>