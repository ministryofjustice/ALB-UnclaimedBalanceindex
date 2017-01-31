
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
							
							<html:form  action="dumpdata.do">
								<div class="formwrap"> <span class="tl"></span> <span class="tr"><span></span></span>
									<div class="formcon">
										<div class="formblock contact first">
											<fieldset>
											<legend><span></span></legend>
											<div>
												<div class="odd">
														<label for="words"><span>File is successfully uploaded.</span></label>
												</div>
												<div class="odd">
														<div class="submitc">
															<div class="function next right"> <span class="tl"></span> <span class="tr"><span></span></span> <html:submit>Inject data </html:submit> <span class="bl"></span> <span class="br"></span> </div>
														</div>
												</div>
											</div>
											</fieldset>
										</div>
								
								</div>
									<span class="bl"></span> <span class="br"></span> </div>
							</html:form>
	</logic:present>						
							<div class="submitc">
								<div class="function previous"> <span class="tl"></span> <span class="tr"><span></span></span>
									<a href="javascript:history.go(-1)">Previous page</a> 
									<span class="bl"></span> <span class="br"></span> 
							    </div>
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
	