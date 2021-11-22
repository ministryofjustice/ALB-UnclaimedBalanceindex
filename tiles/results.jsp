<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="java.util.*" %>
<%@ page buffer = "32kb" %>

			<a href="search.do" class="govuk-back-link">Back</a>							

			<h1 class="govuk-heading-xl">Search results</h1>

			<logic:present name="search"> 
			<!-- Note - this doesn't do anything but not removed in case we make it work in future. -->
			<h2 class="govuk-heading-m">You searched for <bean:write name="search" filter="false"/></h2>
			</logic:present>

      <logic:present name="results">
        <%     
        List results= (List)request.getAttribute("results");
        int total=50;  
        int currentPage=Integer.parseInt(request.getAttribute("currentPage").toString());
        int noOfPages=Integer.parseInt(request.getAttribute("noOfPages").toString());
        List list;
        String spageid=request.getParameter("currentPage"); 
        if(spageid==null){
        	spageid="1";
        }
        int pageid=Integer.parseInt(spageid);  
        int endpage=pageid*50;
        if(pageid==1){
        	currentPage=1;
        } else{  
            currentPage=pageid;
            pageid=pageid-1;  
            pageid=pageid*total+1;  
        }
        if(results.size()== 0){
          list=results;
        } else if(results.size()<=50){
            list=results.subList(pageid,results.size());
        } else{
	        if(currentPage==noOfPages-1){
	         list=results.subList(pageid,results.size());
	        } else{
	          list=results.subList(pageid,endpage);
	        }
        }
        request.setAttribute("List",list);
        request.setAttribute("results",results); %>   
				
				<p class="govuk-body"><a class="govuk-button" href="downloadResults.do?name=<%=request.getParameter("name") %>&case_number=<%=request.getParameter("case_number")%>&from_day=<%=request.getParameter("from_day")%>&from_month=<%=request.getParameter("from_month")%>&from_year=<%=request.getParameter("from_year")%>&to_day=<%=request.getParameter("to_day")%>&to_month=<%=request.getParameter("to_month")%>&to_year=<%=request.getParameter("to_year")%>">Download results as CSV</a></p>
				
				<table class="govuk-table">
					<thead class="govuk-table__head">
						<tr class="govuk-table__row">
							<th class="govuk-table__header">Account number</th>
							<th class="govuk-table__header">Case name</th>
							<th class="govuk-table__header">Date account opened</th>
						</tr>
					</thead>
					<tbody class="govuk-table__body">
						<logic:iterate id="bean" name="List">
					   <tr class="govuk-table__row">
					     <td class="govuk-table__cell"><bean:write name="bean" property="case_number"/></td>
					     <td class="govuk-table__cell"><a href="#" class="govuk-link"><bean:write name="bean" property="prime_index"/></a></td>
					     <td class="govuk-table__cell"><bean:write name="bean" property="date_account"/></td>
					   </tr>
						</logic:iterate>
					</tbody>
				</table>
				<nav role="navigation" aria-label="Pagination Navigation" id="pagination">
			    <ul class="govuk-list">
		    	<% // Previous
		    	if(currentPage > 1) { %>
		    	<li class="pag-prev"><a class="govuk-link" href="searchResults.do?currentPage=<%=(currentPage - 1)%>&name=<%=request.getParameter("name") %>&case_number=<%=request.getParameter("case_number")%>&from_day=<%=request.getParameter("from_day")%>&from_month=<%=request.getParameter("from_month")%>&from_year=<%=request.getParameter("from_year")%>&to_day=<%=request.getParameter("to_day")%>&to_month=<%=request.getParameter("to_month")%>&to_year=<%=request.getParameter("to_year")%>">Previous</a></li>

        	<% }
        	// Page numbers
        	for(int i=1; i < noOfPages ; i++){ %>
						<li><a class="govuk-link" 
							href="searchResults.do?currentPage=<%=i%>&name=<%=request.getParameter("name") %>&case_number=<%=request.getParameter("case_number")%>&from_day=<%=request.getParameter("from_day")%>&from_month=<%=request.getParameter("from_month")%>&from_year=<%=request.getParameter("from_year")%>&to_day=<%=request.getParameter("to_day")%>&to_month=<%=request.getParameter("to_month")%>&to_year=<%=request.getParameter("to_year")%>" 
							aria-label="<%if(currentPage == i) { %>Current page, page <%=i%><% } else { %>Go to page <%=i%><%}%>"
							<%if(currentPage==i) {%> aria-current="true"<% } %>><%=i%></a>
						</li>
          <%}  

          // Next
			    if(currentPage < (noOfPages -1))
				 	{ %>
			      <li class="pag-next"><a class="govuk-link" href="searchResults.do?currentPage=<%=++currentPage%>&name=<%=request.getParameter("name") %>&case_number=<%=request.getParameter("case_number")%>&from_day=<%=request.getParameter("from_day")%>&from_month=<%=request.getParameter("from_month")%>&from_year=<%=request.getParameter("from_year")%>&to_day=<%=request.getParameter("to_day")%>&to_month=<%=request.getParameter("to_month")%>&to_year=<%=request.getParameter("to_year")%>">Next</a></li>
			    <%}%>
					</ul>
				</nav>													
			</logic:present>
			<logic:notPresent name="results">
				<p class="govuk-body">No results found</p>
			</logic:notPresent>
