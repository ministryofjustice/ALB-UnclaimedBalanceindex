<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page buffer = "32kb" %>

			<a href="javascript:history.go(-1)" styleClass="govuk-back-link">Back</a>							

			<h1 class="govuk-heading-xl">Search Results</h2>

				<logic:present name="search"> 
					<h2 class="govuk-heading-m">You searched for <bean:write name="search" filter="false"/></h2>
				</logic:present>

        <logic:present name="results">

					<p class="govuk-body"><a href="downloadResults.do?name=<%=request.getParameter("name") %>&case_number=<%=request.getParameter("case_number")%>&from_day=<%=request.getParameter("from_day")%>&from_month=<%=request.getParameter("from_month")%>&from_year=<%=request.getParameter("from_year")%>&to_day=<%=request.getParameter("to_day")%>&to_month=<%=request.getParameter("to_month")%>&to_year=<%=request.getParameter("to_year")%>">Download results as CSV</a></p>
					<display:table  id="result" class="cro"  name="requestScope.results" requestURI=""  pagesize="50" sort="list">
		        <display:setProperty name="paging.banner.placement" value="bottom" />
		    	    <display:column property="case_number" title="Account Number"  paramId="case_id" paramProperty="case_number" href="getDetail.do" />
				    <display:column property="prime_index" title="Name" />
				    <display:column property="date_account" title="Date Account Open"/>
					</display:table>
										       
				</logic:present>
				<logic:notPresent name="resultss">
					<p class="govuk-body">No results found</p>
				</logic:notPresent>
									 

					
				
