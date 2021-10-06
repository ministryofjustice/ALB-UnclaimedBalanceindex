
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
					
						<logic:present name="user_id" scope="session">	
							<a href="logOff.do">Log out</a> 
							<h1>UBI Administration</h1>
							<logic:present name="errMsg" scope="request">
								<bean:write name="errMsg" />
							
							</logic:present>
							
							<html:form  action="fileUpload.do" method="post" enctype="multipart/form-data">
								
													<label for="words"><span>Select a file to upload :</span></label>
												
													<html:file size="35" accept=" " property="theFile"></html:file>

										
								<html:submit>Upload </html:submit>
							</html:form>
	</logic:present>
							
							
									
									
									<span class="bl"></span> <span class="br"></span> </div>
								

	