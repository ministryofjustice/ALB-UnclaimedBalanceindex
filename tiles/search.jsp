
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

			<a href="./" class="govuk-back-link">Back</a>	

			<h1 class="govuk-heading-xl">Search for unclaimed court money</h1>
<logic:present name="genericerror" scope="request">
<div class="govuk-error-summary" aria-labelledby="error-summary-title" role="alert" tabindex="-1" data-module="govuk-error-summary">
			  <h2 class="govuk-error-summary__title" id="error-summary-title">
			    There is a problem
			  </h2>
			  <div class="govuk-error-summary__body">
					<ul class="govuk-list govuk-error-summary__list">
					<logic:present name="yearError" scope="request">
						<li>"Date from" must be before "Date to"</li>
					</logic:present>
					
					<logic:present name="dateError" scope="request">
					<li>Enter a date in the correct format</li>
					</logic:present>
					
					<logic:present name="fieldError" scope="request">
					<li>Enter a valid search term</li>
					</logic:present>

					<logic:present name="invalidError" scope="request">
					<li>Enter a keyword in the correct format</li>
					</logic:present>
				
					<logic:present name="requiredError" scope="request">
					<li>Enter a keyword</li>
					</logic:present>
					</ul>
				</div>
			</div>
</logic:present>
			

			<div class="govuk-grid-row">
				<div class="govuk-grid-column-two-thirds">
					<p class="govuk-body">You can search using keyword and/or date. Entering specific information will improve the accuracy of your search results.
</p>
					<html:form  styleClass="accessible" action="searchResults.do" method="get" styleId="js-search-form">
						<div class="govuk-form-group">
							<label class="govuk-label" for="phrase"><strong>Search by keywords</strong></label>
							<div class="govuk-hint">For example, name, location, case type, organisation and/or court account number (has 9 characters, for example 27891231P)
</div>
							<html:text styleId="phrase" property="name" styleClass="govuk-input"></html:text>
						</div>			
						
						
						<p class="govuk-body"><strong>Search a date range</strong></p>
						<div class="govuk-form-group">
						  <fieldset class="govuk-fieldset" role="group">
						    <legend class="govuk-fieldset__legend">
						    	Date from:
						    </legend>
								<div class="govuk-hint">For example, 27 3 2018.</div>
								<div class="govuk-date-input">
					      	<div class="govuk-date-input__item">
						        <div class="govuk-form-group">
						          <label class="govuk-label govuk-date-input__label" for="dayFrom">
						            Day
						          </label>
											<html:text styleId="dayFrom" property="from_day" styleClass="js-zero-fill govuk-input govuk-date-input__input govuk-input--width-2"></html:text>
										</div>
									</div>
									<div class="govuk-date-input__item">
						        <div class="govuk-form-group">
						          <label class="govuk-label govuk-date-input__label"  for="monthFrom">Month</label>
											<html:text styleId="monthFrom" property="from_month" styleClass="js-zero-fill govuk-input govuk-date-input__input govuk-input--width-2"></html:text>
										</div>
									</div>
									<div class="govuk-date-input__item">
						        <div class="govuk-form-group">
						          <label class="govuk-label govuk-date-input__label" for="yearFrom">Year</label>
											<html:text styleId="yearFrom" property="from_year" styleClass="js-zero-fill govuk-input govuk-date-input__input govuk-input--width-4"></html:text>
										</div>
									</div>
								</div>
							</fieldset>
						</div><!-- /form-group -->
						<div class="govuk-form-group">
							<fieldset class="govuk-fieldset" role="group">
						    <legend class="govuk-fieldset__legend">Date to:</legend>
								<div class="govuk-hint">For example, 27 3 2021.</div>
								<div class="govuk-date-input">
					      	<div class="govuk-date-input__item">
						        <div class="govuk-form-group">
						          <label class="govuk-label govuk-date-input__label" for="dayTo">Day</label>
											<html:text styleId="dayTo" property="to_day" styleClass="js-zero-fill govuk-input govuk-date-input__input govuk-input--width-2"></html:text>
										</div>
									</div>
									<div class="govuk-date-input__item">
						        <div class="govuk-form-group">
						          <label class="govuk-label govuk-date-input__label"  for="monthTo">Month</label>
											<html:text styleId="monthTo" property="to_month" styleClass="js-zero-fill govuk-input govuk-date-input__input govuk-input--width-2"></html:text>
										</div>
									</div>
									<div class="govuk-date-input__item">
						        <div class="govuk-form-group">
						          <label class="govuk-label govuk-date-input__label" for="yearTo">Year</label>
											<html:text styleId="yearTo" property="to_year" styleClass="js-zero-fill govuk-input govuk-date-input__input govuk-input--width-4"></html:text>
										</div>
									</div>
								</div><!-- /date-input -->
							</fieldset>
						</div><!-- /formgroup -->
				  	<p><html:submit styleClass="govuk-button">Search</html:submit></p>
					</html:form>
				</div><!-- /column-two-thirds -->
			</div><!-- /gridrow -->
					
