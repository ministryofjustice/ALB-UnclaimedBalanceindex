
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

			<h1 class="govuk-heading-xl">Unclaimed Balance Index</h1>
			<div id="Content">
				<div class="holder">
					<div class="steps">
						<h2 class="govuk-heading-m">Information summary</h2>
					</div>
					<div class="formtext first">
						<p class="govuk-body">"When conducting a search, please insert either an account number (if known) and/or the name(s) of the case. It may aid your search to complete an approximate date the Court Order was made.</p>

						<p class="govuk-body">	i.e. with account number - 27891234P (9 characters)</p> 
						<p class="govuk-body">with name - Smith v Jones Insurance</p>

						<p class="govuk-body">Please note the more information completed the narrower the results will be"</p>
					</div>
					
					<logic:present name="yearError" scope="request">
					<div class="errorm">
						<p><strong>Error : "To Year" must be greater than "From Year" </strong></p>
					</div>
					</logic:present>
					
					<logic:present name="dateError" scope="request">
					<div class="errorm">
						<p><strong>Error : Invalid date</strong></p>
					</div>
					</logic:present>
					
					<logic:present name="fieldError" scope="request">
					<div class="errorm">
						<p><strong>Error : Search cannot be blank</strong></p>
					</div>
					</logic:present>

					<logic:present name="invalidError" scope="request">
					<div class="errorm">
						<p><strong>Error : Invalid case name / case number</strong></p>
					</div>
					</logic:present>
				
					<logic:present name="requiredError" scope="request">
					<div class="errorm">
						<p><strong>Error : Case name is mandatory field</strong></p>
					</div>
					</logic:present>

					<div class="govuk-grid-row">
						<div class="govuk-grid-column-two-thirds">
							<html:form  styleClass="accessible" action="searchResults.do" method="get">
								<div class="govuk-form-group">
									<label class="govuk-label" for="phrase">Key word (required)</label>
										<div class="govuk-hint">
									     (eg., name, location, case type, company/organisation etc)
									  </div>
										<html:text property="name" styleClass="govuk-input"></html:text>
								</div>			
								<div class="govuk-form-group">
									<label for="words" class="govuk-label"><span>With account number</span></label>
									<html:text property="case_number" styleClass="govuk-input"/>
								</div>
								
								<h2 class="govuk-heading-m">Search within a date range</h2>
								<div class="govuk-form-group">
								  <fieldset class="govuk-fieldset" role="group">
								    <legend class="govuk-fieldset__legend govuk-fieldset__legend--s">
								    	Date from
								    </legend>
										<div class="govuk-hint">
								     For example, 27 3 2007
								  	</div>
										<div class="govuk-date-input">
							      	<div class="govuk-date-input__item">
								        <div class="govuk-form-group">
								          <label class="govuk-label govuk-date-input__label" for="day">
								            Day
								          </label>
													<html:text property="from_day" styleClass="govuk-input govuk-date-input__input govuk-input--width-2"></html:text>
												</div>
											</div>
											<div class="govuk-date-input__item">
								        <div class="govuk-form-group">
								          <label class="govuk-label govuk-date-input__label"  for="month">
								            Month
								          </label>
													<html:text property="from_month" styleClass="govuk-input govuk-date-input__input govuk-input--width-2"></html:text>
												</div>
											</div>
											<div class="govuk-date-input__item">
								        <div class="govuk-form-group">
								          <label class="govuk-label govuk-date-input__label" for="year">
								            Year
								          </label>
													<html:text property="from_year" styleClass="govuk-input govuk-date-input__input govuk-input--width-4"></html:text>
												</div>
											</div>
										</div>
									</fieldset>
								</div>
								<div class="govuk-form-group">
									<fieldset class="govuk-fieldset" role="group">
								    <legend class="govuk-fieldset__legend govuk-fieldset__legend--s">
								    	Date to
								    </legend>
										<div class="govuk-hint">
								     For example, 27 3 2007
								  	</div>
										<div class="govuk-date-input">
							      	<div class="govuk-date-input__item">
								        <div class="govuk-form-group">
								          <label class="govuk-label govuk-date-input__label" for="day">
								            Day
								          </label>
													<html:text property="to_day" styleClass="govuk-input govuk-date-input__input govuk-input--width-2"></html:text>
												</div>
											</div>
											<div class="govuk-date-input__item">
								        <div class="govuk-form-group">
								          <label class="govuk-label govuk-date-input__label"  for="month">
								            Month
								          </label>
													<html:text property="to_month" styleClass="govuk-input govuk-date-input__input govuk-input--width-2"></html:text>
												</div>
											</div>
											<div class="govuk-date-input__item">
								        <div class="govuk-form-group">
								          <label class="govuk-label govuk-date-input__label" for="year">
								            Year
								          </label>
													<html:text property="to_year" styleClass="govuk-input govuk-date-input__input govuk-input--width-4"></html:text>
												</div>
											</div>
										</div>
									</fieldset>
								</div>
						  <p><html:submit styleClass="govuk-button">Next</html:submit></p>
						</div>
					</html:form>
				</div>
			</div>
					
