
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
					
			<h1 class="govuk-heading-xl">Admin login</h1>
		
			<logic:present name="errMsg" scope="request">
			<div class="govuk-error-summary" aria-labelledby="error-summary-title" role="alert" tabindex="-1" data-module="govuk-error-summary">
			  <h2 class="govuk-error-summary__title" id="error-summary-title">
			    There is a problem
			  </h2>
				<div class="govuk-error-summary__body">
	    		<ul class="govuk-list govuk-error-summary__list">
						<li><bean:write name="errMsg" /></li>
					</ul>
				</div>
			</div>
			</logic:present>
			
			<html:form  action="validateLogin.do">
				<div class="govuk-form-group">	
					<label for="username" class="govuk-label">Login name</label>
					<html:text property="login_name" styleClass="govuk-input" styleId="username"/>
				</div>
				<div class="govuk-form-group">
					<label for="password" class="govuk-label">Password</label>
					<html:password property="password" styleClass="govuk-input" styleId="password"></html:password>
				</div>
				<html:submit styleClass="govuk-button">Login </html:submit>
			</html:form>
