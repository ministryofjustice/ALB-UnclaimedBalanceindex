<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>

<%@ page import="java.util.List" %>
<%@ page buffer = "32kb" %>

			<a href="javascript:history.go(-1)" class="govuk-back-link">Back</a>							


			<h1 class="govuk-heading-xl">Search results</h1>

				<logic:present name="search"> 
					<!-- Note - this doesn't do anything but not removed in case we make it work in future. Styled(Jav) -->
					<h2 class="govuk-heading-m">You searched for <bean:write name="search" filter="false"/></h2>
				</logic:present>

				<section id="js-results-table"><!-- required for styling using JavaScript (see ubi-specific.js) -->
       			 <logic:present name="results">
	                     <%  List results= request.getParameter("results");
								int total=50;  
	                            int currentPage=0;
								
								String spageid=request.getParameter("page"); 
								//int noOfPages=results.size()/50;
								System.out.println("no of pages"+results.size()/50);
								request.set
								int pageid=Integer.parseInt(spageid);  
								
								if(pageid==1){
								currentPage=1;
								}  
								else{  
								    currentPage=pageid;
								    pageid=pageid-1;  
								    pageid=pageid*total+1;  
								}  
								List list=results.(pageid,total*pageid);
								  
								  
								out.print("<h1>Page No: "+spageid+"</h1>");  
						%>  
					<p class="govuk-body"><a class="govuk-button" href="downloadResults.do?name=<%=request.getParameter("name") %>&case_number=<%=request.getParameter("case_number")%>&from_day=<%=request.getParameter("from_day")%>&from_month=<%=request.getParameter("from_month")%>&from_year=<%=request.getParameter("from_year")%>&to_day=<%=request.getParameter("to_day")%>&to_month=<%=request.getParameter("to_month")%>&to_year=<%=request.getParameter("to_year")%>">Download results as CSV</a></p>
					<table>
						
						<tr>
						     <td>Account number</td>
						     <td>Case name</td>
						     <td>Date account opened</td>
						    
						 </tr>
						<logic:iterate id="bean" name="results">
						   <tr>
						     <td><bean:write name="bean" property="case_number"/></td>
						     <td><bean:write name="bean" property="prime_index"/></td>
						     <td><bean:write name="bean" property="date_account"/></td>
						    
						   </tr>
						</logic:iterate>
							/*  	<c:if test="${currentPage != 1}">
						        <td><a href="searchResults.do?page=${currentPage - 1}">Previous</a></td>
						    </c:if>
						 
						  <%--For displaying Page numbers. 
						    The when condition does not display a link for the current page--%>
						    <table border="1" cellpadding="5" cellspacing="5">
						        <tr>
						            <c:forEach begin="1" end="${noOfPages}" var="i">
						                <c:choose>
						                    <c:when test="${currentPage eq i}">
						                        <td>${i}</td>
						                    </c:when>
						                    <c:otherwise>
						                        <td><a href="searchResults.do?page=${i}">${i}</a></td>
						                    </c:otherwise>
						                </c:choose>
						            </c:forEach>
						        </tr>
						    </table>
						     
						    <%--For displaying Next link --%>
						    <c:if test="${currentPage lt noOfPages}">
						        <td><a href="searchResults.do?page=${currentPage + 1}">Next</a></td>
						    </c:if>
									*/						
						</table>
																	
					
					
										       
				</logic:present>
			</section><!-- /js-results-table -->
									 

					
				
