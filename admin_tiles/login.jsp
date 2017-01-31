
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
					
					
					<div id="Content">
					
						<div class="holder">
							<div class="steps">
								<h2>Admin Login</h2>
							</div>
							
							<logic:present name="errMsg" scope="request">
							<div class="errorm">
								<p><strong><bean:write name="errMsg" /></strong></p>
							</div>
							
							</logic:present>
							
							<html:form  action="validateLogin.do">
								<div class="formwrap"> <span class="tl"></span> <span class="tr"><span></span></span>
									<div class="formcon">
										<div class="formblock contact first">
											<fieldset>
											<legend><span></span></legend>
											<div>
												<div class="odd">
													<label for="words"><span>Login name</span></label>
												</div>
												<div class="even">
													<html:text property="login_name"/>
												</div>
											</div>
											<div>
												<div class="odd">
													<label for="phrase"><span>Password</span></label>
												</div>
												<div class="even">
													<html:password property="password"></html:password>
												</div>
											</div>
											</fieldset>
										</div>
										
								</div>
									<span class="bl"></span> <span class="br"></span> </div>
								<div class="submitc">
									<div class="function next right"> <span class="tl"></span> <span class="tr"><span></span></span> <html:submit>Login </html:submit> <span class="bl"></span> <span class="br"></span> </div>
								</div>
							</html:form>
						</div>
					</div>
					<div id="RHC">
				</div>
			</div>
	
			<div id="LHC">
				<div class="holder"> </div>
			</div>
		</div>