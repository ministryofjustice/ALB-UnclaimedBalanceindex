
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
					
			<logic:present name="user_id" scope="session">	
				<a href="logOff.do" class="govuk-back-link">Log out</a> 
				<h1 class="govuk-heading-xl">Upload CSV</h1>
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
				
				<html:form  action="fileUpload.do" method="post" enctype="multipart/form-data">
					<div class="govuk-form-group">
						<label for="file-upload" class="govuk-label">Select a file to upload</label>
						<html:file size="35" accept=" " property="theFile" styleId="file-upload" styleClass="govuk-file-upload"></html:file>
					</div>
					<html:submit styleClass="govuk-button">Upload</html:submit>
				</html:form>
			</logic:present>
							