<%@page import="java.util.List,org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="org.codehaus.jackson.JsonGenerationException"%>
<% 
ObjectMapper mapper = new ObjectMapper();

List countryList=(List) request.getAttribute("countyList");
//System.out.println("length"+countryList.size());
out.println("{");
out.println("\"state\":");
try{
out.println(mapper.writeValueAsString(countryList));
}
catch (JsonGenerationException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

out.println("}");

%>
