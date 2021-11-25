
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
					
					
			
				<a href="javascript:history.go(-1)" class="govuk-back-link">Back</a>
				<h1 class="govuk-heading-xl">Upload status</h1>
				
				<logic:present name="errMsg" scope="request">
				<div class="govuk-error-summary" aria-labelledby="error-summary-title" role="alert" tabindex="-1" data-module="govuk-error-summary">
				  <h2 class="govuk-error-summary__title" id="error-summary-title">
				    Status:
				  </h2>
					<div class="govuk-error-summary__body">
		    		<ul class="govuk-list govuk-error-summary__list">
							<li><bean:write name="errMsg" /></li>
						</ul>
					</div>
				</div>					
				</logic:present>
				