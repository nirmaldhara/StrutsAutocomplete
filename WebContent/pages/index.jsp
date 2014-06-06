<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<style type="text/css">
body {
	font-family: "Trebuchet MS", "Helvetica", "Arial",  "Verdana", "sans-serif";
	font-size: 62.5%;
}
</style>
<meta charset="utf-8">
  <title>jQuery UI Autocomplete - Remote JSONP datasource</title>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <style>
  .ui-autocomplete-loading {
    background: white url('images/ui-anim_basic_16x16.gif') right center no-repeat;
  }
  #city { width: 25em; }
  </style>
<script type="text/javascript">
  $(function() {
   
 
    $( "#country").autocomplete({
       // alert("hi");
      source: function( request, response ) {
        //  alert("hi"+request.term);
        $.ajax({
          url: "http://localhost:7001/StrutsAutocomplete/getcountry",
          dataType: "json",
          data: {
               name_startsWith: request.term
            },
          success: function( data ) {
        	 // alert(""+data);
            response( $.map( data.state, function( item ) {
                
            	 return {
                     label: item,
                     value: item
                     
                     };

            }));
          },

          error: function(XMLHttpRequest, textStatus, errorThrown){
              alert('error - ' +errorThrown);
              //console.log('error', textStatus, errorThrown);
          }
        });
      },
      minLength: 2
    });
  });
  </script>
</head>
<body>
<h1>Struts 2 Autocomplete using jquery and oracle</h1>

<s:form action="success">
	<s:textfield name="country" label="Country Name" id="country"/>
	
</s:form>

</body>
</html>