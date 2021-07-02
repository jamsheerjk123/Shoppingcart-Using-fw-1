<cfcomponent>
    <cfset cdate=dateTimeFormat(now(),'yyyy-mm-dd HH:nn:ss')>

    <!--- To Display the selected Product For purchase --->
    <cffunction name="getItem" access="public" returntype="query">
        <cfargument name="id" required="true" type="numeric">
        <cfquery name="item">
            select p.Prod_Name,c.CategoryName,s.Sub_Name,p.Price,p.deacripton,p.ID,p.Quantity  from product as p inner join subcategory as s on p.sub_id=s.ID inner join category as c on  s.Cat_Id=c.ID where p.ID =<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn item />
    </cffunction>

    <!--- To get Total Amount of the Product to be Purchased  --->
    <cffunction name="total" access="public" returntype="query">
        <cfargument name="qty" required="true" type="numeric">
        <cfargument name="ID" required="true" type="numeric">
        <cfquery name="pro_price">
            select Price from product where ID =<cfqueryparam value="#arguments.ID#">
        </cfquery>
        <cfreturn pro_price/>
    </cffunction>

    <!--- To get all the orders done by the Customer --->
    <cffunction name="myorder" access="public" returntype="query">
        <cfquery name="getallorders" >
            select p.Prod_Name,O.TotalPrice,O.Quantity, O.Order_date ,O.ID from orders as O inner join product  as p on O.Pro_Id=p.ID  where O.Cus_Id="#session.id#"
        </cfquery>
        <cfreturn getallorders>
    </cffunction>
    
    <!--- To purchase a product in a cart --->
    <cffunction name="buyCart" access="public" returntype="query" >
        
        <cfargument name="id" required ="true" type="numeric">
        <cfquery name="cartdetails">
                select Cus_Id,Pro_Id,Quantity,TotalPrice from cart where ID=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfquery>
            insert into orders (Pro_Id,Cus_Id,Quantity,TotalPrice,Order_date,status) values(#cartdetails.Pro_Id#,#cartdetails.Cus_Id#,#cartdetails.Quantity#,#cartdetails.TotalPrice#,<cfqueryparam value="#cdate#" cfsqltype="cf_sql_timestamp">,0)
        </cfquery>
        <cfquery>
        update product set Quantity=Quantity-#cartdetails.Quantity# where ID=#cartdetails.Pro_Id#
        </cfquery>
        <cfquery>
            delete from cart where ID=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery> 
        <cfreturn cartdetails />
    </cffunction>

    <!--- To purchase an Item from the home itself--->
    <cffunction name="buyFromHome" access="public" >
        <cfargument name="id" required="true" type="numeric">
        <cfargument name="qty" required="true" type="numeric">
        <cfquery name="pro_price">
            select Price from product where ID =<cfqueryparam value="#arguments.ID#">
        </cfquery>
        <cfquery>
            insert into orders (Pro_Id,Cus_Id,Quantity,TotalPrice,Order_date,status) values(<cfqueryparam value="#arguments.id#">,#session.id#,<cfqueryparam value="#arguments.qty#">,#pro_price.Price#*#arguments.qty#,<cfqueryparam value="#cdate#" cfsqltype="cf_sql_timestamp">,0)
        </cfquery>
        <cfquery>
            update product set Quantity=Quantity-#arguments.qty# where ID=#arguments.ID#
        </cfquery>
    </cffunction> 
    
    <!--- To purchase all products inserted in cart --->
    <cffunction name="buyAll" access="public" >
        <cfquery name="cartsProduct">
            select Pro_Id, Quantity,TotalPrice from cart where Cus_Id="#session.id#"
        </cfquery>
         <cfoutput query="cartsProduct">
            <cfquery>
                insert into orders (Pro_Id,Cus_Id,Quantity,TotalPrice,Order_date,status) values(#Pro_Id#,#session.id#,#Quantity#,#TotalPrice#,<cfqueryparam value="#cdate#" cfsqltype="cf_sql_timestamp">,0)
            </cfquery>
            <cfquery>
                update product set Quantity=Quantity-#Quantity# where ID=#Pro_Id#
            </cfquery>
        </cfoutput>
        <cfquery>
            delete  from cart where Cus_Id="#session.id#"
        </cfquery>   
    </cffunction>

</cfcomponent>