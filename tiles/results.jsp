<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page buffer = "32kb" %>


					<div id="Content">
						<div class="holder">
							<div class="steps">
								<h2>Results</h2>
							</div>
							
							
							
							
							<form action="#">
								<div class="formwrap"> <span class="tl"></span> <span class="tr"><span></span></span>
									<div class="formcon">
										
											<fieldset>
											<logic:present name="search"> <h3>You searched for <bean:write name="search" filter="false"/></h3></logic:present>
											<div class="formblock">
		                                    <a href="downloadResults.do?name=<%=request.getParameter("name") %>&case_number=<%=request.getParameter("case_number")%>&from_day=<%=request.getParameter("from_day")%>&from_month=<%=request.getParameter("from_month")%>&from_year=<%=request.getParameter("from_year")%>&to_day=<%=request.getParameter("to_day")%>&to_month=<%=request.getParameter("to_month")%>&to_year=<%=request.getParameter("to_year")%>">Click here</a> to downlaod csv file for this search.
													<logic:present name="results" >
											            <div align="left">    
											               <display:table  id="result" class="cro"  name="requestScope.results" requestURI=""  pagesize="50" sort="list">
													       <display:setProperty name="paging.banner.placement" value="bottom" />
													    	   <display:column property="case_number" title="Account Number"  paramId="case_id" paramProperty="case_number" href="getDetail.do" />
															   <display:column property="prime_index" title="Name" />
															   <display:column property="date_account" title="Date Account Open"/>
															    
													       </display:table>
													       
											            </div>
											        </logic:present>
											 </div>
										</fieldset>
								  
										
										
										
									</div>
									<span class="bl"></span> <span class="br"></span> </div>
								
							</form>
						<div class="submitc">
								<div class="function previous"> <span class="tl"></span> <span class="tr"><span></span></span>
									<html:link href="search.do">Homepage</html:link> 
									<span class="bl"></span> <span class="br"></span> </div>
								
							</div>	
						</div>
						</div>
					
				
