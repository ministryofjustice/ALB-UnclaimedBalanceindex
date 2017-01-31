
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
					
					
					<div id="Content">
					
						<div class="holder">
							<div class="steps">
								<h2>UBI Administration</h2>
							</div>
	
	<logic:present name="user_id" scope="session">	
						
							<logic:present name="errMsg" scope="request">
							<div class="errorm">
								<p><strong><bean:write name="errMsg" /></strong></p>
							</div>
							
							</logic:present>
							
							<html:form  action="fileUpload.do" method="post" enctype="multipart/form-data">
								<div class="formwrap"> <span class="tl"></span> <span class="tr"><span></span></span>
									<div class="formcon">
										<div class="formblock contact first">
											<fieldset>
											<legend><span></span></legend>
											<div>
												<div class="odd">
													<label for="words"><span>Select a file to upload :</span></label>
												</div>
												<div class="even">
													<html:file size="35" accept=" " property="theFile"></html:file>
												</div>
											</div>
											
											</fieldset>
										</div>
										
								</div>
									<span class="bl"></span> <span class="br"></span> </div>
								<div class="submitc">
									<div class="function next right"> <span class="tl"></span> <span class="tr"><span></span></span> <html:submit>Upload </html:submit> <span class="bl"></span> <span class="br"></span> </div>
								</div>
							</html:form>
	</logic:present>
							
							<div class="submitc">
								<div class="function previous"> <span class="tl"></span> <span class="tr"><span></span></span>
									
									<html:link href="logOff.do">Log out</html:link> 
									<span class="bl"></span> <span class="br"></span> </div>
								
							</div>	
						</div>
					</div>
					<div id="RHC">
						
					</div>
			
	
			<div id="LHC">
				<div class="holder"> </div>
			</div>
	