component displayname="adminServices" accessors="true"{

    //Categories Functions
    public void function addCategory( numeric id =0 , string name=''){
        var catExists=getCategory(id).recordcount;
         
        if (arguments.id>0 && catExists){
            
            queryExecute("update category set CategoryName=:name,updated_date=curtime() where id=:id",{id = { value = arguments.id, cfsqltype = 'integer'},name = { value = arguments.name, cfsqltype = 'varchar' }})
        }
        if(arguments.id==0){

            queryService=new query()
            result=queryService.execute(sql="SELECT MAX(ID) as top from category")
            max_id=result.getResult();
            var id=max_id.top+1
            time=datetimeformat(now(),'yyyy-mm-dd HH:nn:ss')
            queryExecute("insert into category (ID,CategoryName, Date_created, updated_date) values(#id#,:name,curtime(),curtime())",{
                name = { value = arguments.name, 
                    cfsqltype = 'varchar' }

            })
          
        }    
    }
    public query function catName(required string name=''){
        return queryexecute("select CategoryName from category where CategoryName=:name",{name={value=arguments.name,cfsqltype='varchar'}})
    }
    public query function getCategory(required numeric id){
        return queryExecute("select ID, CategoryName from category where ID=:id",{ id = { value = arguments.id, cfsqltype = 'integer' } } )
    }
    public query function showCategory(){

        return queryExecute("select * from category ");
    }

    //Subcategories Functions
    public query function showSubCategory(){
        return queryExecute( "select  s.ID,s.Sub_Name,c.CategoryName,s.Date_created,s.updated_date ,c.ID as cid from subcategory as s  inner Join category as c on s.Cat_Id=c.ID")
    }
    public query function getSubCategory(required numeric id){
        return queryExecute("select s.ID,s.Sub_Name,c.CategoryName,s.Date_created,s.updated_date ,c.ID as cid from subcategory as s  inner Join category as c on s.Cat_Id=c.ID where s.ID=:id",{ id = { value = arguments.id, cfsqltype = 'integer' } })
    }
    public void function addSubCategory(required numeric id=0,string subName="",numeric cats){
        var subExists=getSubCategory(id).recordCount;
        if(arguments.id>0 && subExists){
            queryExecute("update subcategory set Sub_Name=:subName ,Cat_Id=:cats,updated_date=curtime() where ID=:id",{id={value=arguments.id, cfsqltype = 'integer' },subName={value=arguments.subName, cfsqltype = 'varchar'},cats={value=arguments.cats, cfsqltype = 'integer'}})
        }
        if(arguments.id==0){
            queryExecute("insert into subcategory (Sub_Name,Cat_Id,Date_created, updated_date) values(:name,:cats,curtime(),curtime())",{id={value=arguments.id, cfsqltype = 'integer' },name={value=arguments.name, cfsqltype = 'varchar'},cats={value=arguments.cats, cfsqltype = 'integer'}})
        }
    }
    public query function subName(required string name=""){
        return queryExecute("select ID from subcategory where Sub_Name=:name",{name={value=arguments.name,cfsqltype = 'varchar'}})
    }

    //Products functions
    public query function showProducts(){
        return queryExecute("select  p.ID,p.Prod_Name,s.Sub_Name,c.CategoryName,p.Price,p.Quantity,p.deacripton from product as p inner join subcategory as s on p.sub_id=s.ID  inner Join category as c on s.Cat_Id=c.ID")
    }
    public query function getsub(required numeric ID){
         return queryExecute("select ID,Sub_Name from subcategory where Cat_Id=:ID",{ID={value=arguments.ID, cfsqltype="integer"}})
        
        
    }
    public query function getPro(required string productName=''){
        return queryExecute("select ID from product where Prod_Name=:productName",{productName={value=arguments.productName,cfsqltype="string"}})
    }
    public query function getProduct(required numeric id){

        return queryExecute("select  p.ID,p.Prod_Name,s.Sub_Name,c.CategoryName,p.Price,p.Quantity,p.deacripton,s.ID  as suid ,c.ID as cid from product as p inner join subcategory as s on p.sub_id=s.ID  inner Join category as c on s.Cat_Id=c.ID where p.ID=:id",{ id = { value = arguments.id, cfsqltype = 'integer' } })

    }

    public void function addProduct(required numeric id,string productName="",numeric cats,numeric subs,numeric prices,numeric quantitys,string Description=''){
        var proExists=getProduct(id).recordCount;
        if(arguments.id>0 && proExists){
           queryExecute("update product set Prod_Name=:productName,cat_id=:cats,sub_id=:subs,Price=:prices,Quantity=:quantitys,deacripton=:Description where ID=:id",{ id = { value = arguments.id, cfsqltype = 'integer' },productName={value=arguments.productName, cfsqltype = 'varchar'},cats={value=arguments.cats, cfsqltype = 'integer' },subs={value=arguments.subs,cfsqltype = 'integer' },prices={value=arguments.prices,cfsqltype = 'integer' },quantitys={value=arguments.quantitys,cfsqltype = 'integer' },Description={value=arguments.Description,cfsqltype = 'varchar' }})
        }
        if(arguments.id==0){
            queryExecute("insert into product (Prod_Name,sub_id,cat_id,Price,Quantity,deacripton) values(:productName,:subs,:cats,:prices,:quantitys,:Description) ",{ productName={value=arguments.productName, cfsqltype = 'varchar'},subs={value=arguments.subs,cfsqltype = 'integer' },cats={value=arguments.cats, cfsqltype = 'integer' },prices={value=arguments.prices,cfsqltype = 'integer' },quantitys={value=arguments.quantitys,cfsqltype = 'integer' },Description={value=arguments.Description,cfsqltype = 'varchar' }})
        } 
    }
    public void function deleteProduct(required numeric ID) {
        queryExecute("delete from product where ID=:ID",{ID={value=arguments.ID,cfsqltype = 'integer' }})
    }

    //Order Details
    public query function showOrders(){
        return queryExecute("select o.ID,c.CustomerName,p.Prod_Name,o.TotalPrice,o.Quantity,o.Order_date,o.status from orders as o inner join customer as c on o.Cus_Id=c.ID inner JOIN product AS p ON   o.Pro_Id=p.ID ORDER BY o.ID")
    }

    public void function updateOrderStatus(required numeric status,  numeric ID){
        
         queryExecute("update orders set status=:status where ID=:ID",{status={value=arguments.status, cfsqltype = 'integer' },ID={value=arguments.id, cfsqltype = 'integer' }})
    }

    //CustomerDetails
    public query function userDetail(){
        return queryExecute("select ID, CustomerName,Email,PhoneNumber,username,role from customer")
    }
    
    
}