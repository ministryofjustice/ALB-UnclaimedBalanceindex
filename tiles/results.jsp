<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page buffer = "32kb" %>

			<a href="javascript:history.go(-1)" class="govuk-back-link">Back</a>							

			<h1 class="govuk-heading-xl">Search results</h1>

				<logic:present name="search"> 
					<!-- Note - this doesn't do anything but not removed in case we make it work in future. Styled(Jav) -->
					<h2 class="govuk-heading-m">You searched for <bean:write name="search" filter="false"/></h2>
				</logic:present>

				<section id="js-results-table"><!-- required for styling using JavaScript (see ubi-specific.js) -->
        <logic:present name="results">

					<p class="govuk-body"><a class="govuk-button" href="downloadResults.do?name=<%=request.getParameter("name") %>&case_number=<%=request.getParameter("case_number")%>&from_day=<%=request.getParameter("from_day")%>&from_month=<%=request.getParameter("from_month")%>&from_year=<%=request.getParameter("from_year")%>&to_day=<%=request.getParameter("to_day")%>&to_month=<%=request.getParameter("to_month")%>&to_year=<%=request.getParameter("to_year")%>">Download results as CSV</a></p>
					<tbody>
						<logic:present name="result">
						<tr>
						     <td>Account number</td>
						     <td>Case name</td>
						     <td>Date account opened</td>
						    
						 </tr>
						<logic:iterate id="bean" name="result">
						   <tr>
						     <td><bean:write name="bean" property="case_number"/></td>
						     <td><bean:write name="bean" property="prime_index"/></td>
						     <td><bean:write name="bean" property="date_account"/></td>
						    
						   </tr>
						</logic:iterate>
						</logic:present>
					</tbody>
											
					
					
										       
				</logic:present>
			</section><!-- /js-results-table -->
									 

					
				
