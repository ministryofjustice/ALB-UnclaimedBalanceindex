<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ page import="java.util.*" %>
<%@ page buffer = "32kb" %>

			<a href="javascript:history.go(-1)" class="govuk-back-link">Back</a>							


			<h1 class="govuk-heading-xl">Search results</h1>

				<logic:present name="search"> 
					<!-- Note - this doesn't do anything but not removed in case we make it work in future. Styled(Jav) -->
					<h2 class="govuk-heading-m">You searched for <bean:write name="search" filter="false"/></h2>
				</logic:present>

				<section id="js-results-table"><!-- required for styling using JavaScript (see ubi-specific.js) -->
       			 <logic:present name="results">
	                     <%   List results= (List)request.getAttribute("results");
								int total=50;  
	                            int currentPage=Integer.parseInt(request.getAttribute("currentPage").toString());
	                            int noOfPages=Integer.parseInt(request.getAttribute("noOfPages").toString());
	                            List list;
								
								//int noOfPages=5;
								String spageid=request.getParameter("page"); 
								
								System.out.println("no of pages"+currentPage+">>>"+noOfPages);
								//request.set
								if(spageid==null)
								{
								spageid="1";
								}
								int pageid=Integer.parseInt(spageid);  
								int endpage=pageid*50;
								if(pageid==1){
								currentPage=1;
								}  
								else{  
								    currentPage=pageid;
								    pageid=pageid-1;  
								    pageid=pageid*total+1;  
								} 
								if(currentPage==noOfPages-1)
								{
								 list=results.subList(pageid,results.size());
								}
								else{
								  list=results.subList(pageid,endpage);
								}
								request.setAttribute("List",list);
								  request.setAttribute("results",results);
								
						%>  
					<p class="govuk-body"><a class="govuk-button" href="downloadResults.do?name=<%=request.getParameter("name") %>&case_number=<%=request.getParameter("case_number")%>&from_day=<%=request.getParameter("from_day")%>&from_month=<%=request.getParameter("from_month")%>&from_year=<%=request.getParameter("from_year")%>&to_day=<%=request.getParameter("to_day")%>&to_month=<%=request.getParameter("to_month")%>&to_year=<%=request.getParameter("to_year")%>">Download results as CSV</a></p>
					<table>
						
						<tr>
						     <td>Account number</td>
						     <td>Case name</td>
						     <td>Date account opened</td>
						    
						 </tr>
						<logic:iterate id="bean" name="List">
						   <tr>
						     <td><bean:write name="bean" property="case_number"/></td>
						     <td><bean:write name="bean" property="prime_index"/></td>
						     <td><bean:write name="bean" property="date_account"/></td>
						    
						   </tr>
						</logic:iterate>
						        <tr>
							 	<% currentPage=Integer.parseInt(request.getAttribute("currentPage").toString());
							 	if(currentPage!=1)
							 	{ %>
							        <td><a href="searchResults.do?page=<%=(currentPage-1)%>&currentPage=<%=currentPage%>&name=<%=request.getParameter("name") %>&case_number=<%=request.getParameter("case_number")%>&from_day=<%=request.getParameter("from_day")%>&from_month=<%=request.getParameter("from_month")%>&from_year=<%=request.getParameter("from_year")%>&to_day=<%=request.getParameter("to_day")%>&to_month=<%=request.getParameter("to_month")%>&to_year=<%=request.getParameter("to_year")%>">Previous</a></td>
							    <% }%>
						        </tr>
						 
						    <%--For displaying Page numbers. 
    The when condition does not display a link for the current page--%>
						    <table border="1" cellpadding="5" cellspacing="5">
						        <tr>

						        	<% 
						        	noOfPages= Integer.parseInt(request.getAttribute("noOfPages").toString());
						        	for(int i=1; i < noOfPages ; i++)
						        	{ %>
						                      
						                       <td><a href="searchResults.do?page=<%=i%>&currentPage=<%=i%>&name=<%=request.getParameter("name") %>&case_number=<%=request.getParameter("case_number")%>&from_day=<%=request.getParameter("from_day")%>&from_month=<%=request.getParameter("from_month")%>&from_year=<%=request.getParameter("from_year")%>&to_day=<%=request.getParameter("to_day")%>&to_month=<%=request.getParameter("to_month")%>&to_year=<%=request.getParameter("to_year")%>">
						                       	<%=i%></a></td>
						            <%}%>
						        </tr>
						    </table>
						     
						    <%--For displaying Next link --%>
						    <%
						    int noOfPages1=Integer.parseInt(request.getAttribute("noOfPages").toString());
						    	noOfPages1=noOfPages1-1;
						    currentPage=Integer.parseInt(request.getAttribute("currentPage").toString()); 
						    if(currentPage < noOfPages1)
							 	{ %>
						        <td><a href="searchResults.do?page=<%=++currentPage%>&name=<%=request.getParameter("name") %>&case_number=<%=request.getParameter("case_number")%>&from_day=<%=request.getParameter("from_day")%>&from_month=<%=request.getParameter("from_month")%>&from_year=<%=request.getParameter("from_year")%>&to_day=<%=request.getParameter("to_day")%>&to_month=<%=request.getParameter("to_month")%>&to_year=<%=request.getParameter("to_year")%>">Next</a></td>
						    <%}%>
															
						</table>
																	
					
					
										       
				</logic:present>
			</section><!-- /js-results-table -->
									 

					
				
