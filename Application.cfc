component extends="framework.one"{
    this.name="newproject";
    this.datasource="shop";
    variables.framework= {

        reloadApplicationOnEveryRequest = true
    }

    function onMissingView(rc) {
        if(structKeyExists(rc, "ajaxdata") && isAjaxRequest()) {
          request.layout = false;
          content type="application/json";
          return serializeJSON(rc.ajaxdata);
        }
        else {
          return view("main/notfound");
        }
      }
      
      function isAjaxRequest() {
        var headers = getHttpRequestData().headers;
        return structKeyExists(headers, "X-Requested-With") 
               && (headers["X-Requested-With"] eq "XMLHttpRequest");
      }
        
    
}