<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<div id="Content">
						<div class="holder">
							<div class="steps">
								<h2>Case Detail</h2>
							</div>
						
						<logic:present name="detail" scope="request">
							
							<div class="formwrap"> <span class="tl"></span> <span class="tr"><span></span></span>
								<h3></h3>
								<div class="formcon">
									
									<dl>
										<dt><span>Account Number</span></dt>
										<dd><bean:write name="detail" property="case_number" /></dd>
										<dt><span>Year Carried Over</span></dt>
										<dd><bean:write name="detail" property="year_carried" /></dd>
										<dt><span>Case Name</span></dt>
										<dd><bean:write name="detail" property="prime_index" /></dd>
										<dt><span>Date Account Opened</span></dt>
										<dd><bean:write name="detail" property="date_account" /></dd>
										<dt><span>Credit Details</span></dt>
										<dd>
										<script>
											var test = new Object();
											test.credit_details="<bean:write name="detail" property="credit_detail" />";
											var str=test.credit_details;
										 	document.write(str.replace("?","&pound;"));
										</script>
									</dl>
								</div>
							
							</logic:present>
								<span class="bl"></span> <span class="br"></span> </div>
							
							
							<div class="submitc">
								<div class="function previous"> <span class="tl"></span> <span class="tr"><span></span></span>
									<a href="javascript:history.go(-1)">Previous page</a> 
									<span class="bl"></span> <span class="br"></span> </div>
								
							</div>
							
						</div>
						
						</div>
			