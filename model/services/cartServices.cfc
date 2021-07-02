<cfcomponent>
    <cffunction name="addToCart" access="public">
        <cfargument name="id" required="true" type="numeric">
        <cfset cdate=dateTimeFormat(now(),"yyyy-mm-dd HH:nn:ss")>
        <cfquery name ="product_to_cart">select * from product where ID=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer"></cfquery>

        <cfquery>
         INSERT INTO cart(Pro_Id,Cus_Id,date_created,Quantity,TotalPrice) values(#product_to_cart.ID#,#session.id#,<cfqueryparam value="#cdate#" cfsqltype="cf_sql_timestamp"> ,1,#product_to_cart.Price#) 

        </cfquery>
    </cffunction>
    <cffunction name="showCart" access="public" returntype="query">
        <cfquery name="carts">
            select ct.ID,p.Prod_Name,ct.Quantity,ct.TotalPrice,p.ID as pid,Price from cart as ct inner join  product as p on ct.Pro_Id=p.ID inner join customer as c on ct.Cus_Id=c.ID where  ct.Cus_Id=#session.id#
        </cfquery>
        <cfreturn carts/>
    </cffunction>
    <cffunction name="sumTotal" access="public" returntype="query">
        <cfquery name="sum">
            SELECT SUM(TotalPrice) AS totsum FROM cart WHERE Cus_Id = #session.id#
        </cfquery>
        <cfreturn sum />

    </cffunction>

    <cffunction name="updateCart" access="public" returntype="query">
        <cfargument name="qty" required="true" type="numeric">
        <cfargument name="pid" required="true" type="numeric">
        <cfargument name="cid" required="true" type="numeric">
        <cfquery name="productPrice">
            select Price from product where ID =<cfqueryparam value="#arguments.pid#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfset price="#productPrice.Price#"*"#arguments.qty#">
        <cfquery name="updateCart">
            update  cart set Quantity=<cfqueryparam value="#arguments.qty#" cfsqltype="cf_sql_integer"> ,TotalPrice=#price# where ID =<cfqueryparam value="#arguments.cid#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn productPrice>
    </cffunction>
    <cffunction name="removeItem" access="public">
        <cfargument name="id" required="true" type="numeric">
        <cfquery name="remove">
            delete from cart where  ID =<cfqueryparam value="#arguments.id#"cfsqltype="cf_sql_integer">
        </cfquery>
    </cffunction>    
</cfcomponent>