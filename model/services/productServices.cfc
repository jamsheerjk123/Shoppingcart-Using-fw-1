<cfcomponent>
    <cffunction name="getAllProducts" access="public" returntype="query">
        <cfquery name="allProducts">
             select p.Prod_Name,c.CategoryName,s.Sub_Name,p.Price,p.deacripton,p.ID,p.Quantity  from product as p inner join subcategory as s on p.sub_id=s.ID inner join category as c on  s.Cat_Id=c.ID
        </cfquery>
        <cfreturn allProducts/>

    </cffunction>  
    <cffunction name="searchProduct"  access="public" returntype="query">
        <cfargument name="productName" required="true" type="string">
        <cfquery name="getProduct">
             select p.Prod_Name,c.CategoryName,s.Sub_Name,p.Price,p.deacripton,p.ID,p.Quantity  from product as p inner join subcategory as s on p.sub_id=s.ID inner join category as c on  s.Cat_Id=c.ID where p.Prod_Name like "%#arguments.productName#%"
        </cfquery>
        <cfreturn getProduct/>
    </cffunction> 
    <cffunction name="getCategories" access="public" returntype="query">
        <cfquery name="Allcategories">
            select ID,CategoryName from category
        </cfquery>
        <cfreturn Allcategories>
    </cffunction>
    <cffunction name="catProducts" access="public" returntype="query">
        <cfargument name="id" required="true" type="numeric">
        <cfquery name="availableProduct">
             select p.Prod_Name,c.CategoryName,s.Sub_Name,p.Price,p.deacripton,p.ID,p.Quantity  from product as p inner join subcategory as s on p.sub_id=s.ID inner join category as c on  s.Cat_Id=c.ID where c.ID=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn availableProduct> 
    </cffunction>  
    <cfscript>
        public function getProductsByCategory(array id = [],numeric minRange =0,numeric maxRange)
    {

        arr = id;
    	newarray = arr.toList();

        if(arguments.minRange > 0){
    	    return  queryExecute("SELECT p.ID, p.Prod_Name,c.CategoryName,s.Sub_Name,p.Price,p.deacripton,p.ID,p.Quantity FROM product AS p LEFT JOIN subcategory AS s ON(p.sub_id = s.ID) LEFT JOIN category AS c ON(s.Cat_Id = c.ID) WHERE c.ID IN (#newarray#) AND p.Price between #arguments.minRange# and #arguments.maxRange#" );
        }
        else{
            return queryExecute("SELECT p.ID, p.Prod_Name,c.CategoryName,s.Sub_Name,p.Price,p.deacripton,p.ID,p.Quantity FROM product AS p LEFT JOIN subcategory AS s ON(p.sub_id = s.ID) LEFT JOIN category AS c ON(s.Cat_Id = c.ID) WHERE c.ID IN (#newarray#) " );       
        }
	
    }
    public function getSearchByProduct(string term){
        return queryExecute("SELECT Prod_Name FROM product WHERE LOWER(Prod_Name) LIKE '%#arguments.term#%'");
    }
    </cfscript>        
</cfcomponent>