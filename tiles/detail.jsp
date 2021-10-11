<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

			<a href="javascript:history.go(-1)" class="govuk-back-link">Back</a>

			<logic:present name="detail" scope="request">
			
			<h1 class="govuk-heading-xl">Account details</h1>
			<p class="govuk-body">
				<a class="govuk-button" href="javascript:window.print()">Print account details</a>
			</p>
			<dl class="govuk-summary-list">
				<div class="govuk-summary-list__row">
					<dt class="govuk-summary-list__key">Account number</dt>
					<dd class="govuk-summary-list__value"><bean:write name="detail" property="case_number" /></dd>
				</div>
				<div class="govuk-summary-list__row">
					<dt class="govuk-summary-list__key">Year carried over</dt>
					<dd class="govuk-summary-list__value"><bean:write name="detail" property="year_carried" /></dd>
				</div>
				<div class="govuk-summary-list__row">
					<dt class="govuk-summary-list__key">Case name</dt>
					<dd class="govuk-summary-list__value"><bean:write name="detail" property="prime_index" /></dd>
				</div>
				<div class="govuk-summary-list__row">
					<dt class="govuk-summary-list__key">Date account opened</dt>
					<dd class="govuk-summary-list__value"><bean:write name="detail" property="date_account" /></dd>
				</div>
				<div class="govuk-summary-list__row">
					<dt class="govuk-summary-list__key">Credit details</dt>
					<dd class="govuk-summary-list__value" id="credit-details"><bean:write name="detail" property="credit_detail" /></dd>
				</div>
			</dl>

	   <details class="govuk-details" data-module="govuk-details">
		  <summary class="govuk-details__summary">
		    <h2 class="govuk-details__summary-text">What happens next</h2>
		  </summary>
		  <div class="govuk-details__text">
		  	<h3 class="govuk-heading-s">Provide any further information you know</h3>
		    <p class="govuk-body">So we can identify the account, print these results and send to the Courts Fund Office including any other details you might know, such as the:</p>
		    <ul class="govuk-list govuk-list--bullet">
					<li>court account name</li>
					<li>name of the relevant court case</li>
					<li>court that dealt with the case</li>
					<li>date of the case</li>
					<li>name of the person paying the money to the court</li>
					<li>name of the person the money was awarded to</li>
				</ul>

				<h3 class="govuk-heading-s">Show evidence you're entitled to claim</h3>
				<p class="govuk-body">We need evidence that the money could belong to you, someone you're responsible for or are representing. This could be copies of:</p>
				<ul class="govuk-list govuk-list--bullet">
					<li><a class="govuk-link" href="https://www.gov.uk/wills-probate-inheritance/searching-for-probate-records">will or grant of administration</li>
					<li><a class="govuk-link" href="https://www.gov.uk/order-copy-birth-death-marriage-certificate">birth, death or marriage certificates</a></li>
					<li><a class="govuk-link" href="https://www.nationalarchives.gov.uk/help-with-your-research/research-guides/census-records/">census record</a></li>
					<li>a court order (the court that issued it can provide a copy)</li>
				</ul>

				<h4 class="govuk-body govuk-!-font-weight-bold">Include your ID</h4>
				<p class="govuk-body">We also need evidence of your identity, so include a copy of some identification such as a passport or driving licence.</p>

				<h3 class="govuk-heading-s">Send your claim by post</h3>
				<p class="govuk-body">Court Funds Office<br>Sunderland<br>SR43 3AB</p>
				<p class="govuk-body">You will receive a reply by letter.</p>
				<p class="govuk-body">You can find out <a class="govuk-link" href="https://www.gov.uk/government/publications/court-funds-office-privacy-notice">how your personal information will be stored and used</a>.</p>
		  </div>
		</details>
	  </logic:present>

		<logic:notPresent name="detail" scope="request">
			<p class="govuk-body">Sorry, unable to find a matching record. Please try going back and searching again.</p>
		</logic:notPresent>
