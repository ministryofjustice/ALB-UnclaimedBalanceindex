<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

			<h1 class="govuk-heading-xl"><bean:write name="detail" property="case_number" /> - <bean:write name="detail" property="prime_index" /></h1>

			<logic:present name="detail" scope="request">
			<dl class="govuk-summary-list">
				<div class="govuk-summary-list__row">
					<dt class="govuk-summary-list__key">Account Number</dt>
					<dd class="govuk-summary-list__value"><bean:write name="detail" property="case_number" /></dd>
				</div>
				<div class="govuk-summary-list__row">
					<dt class="govuk-summary-list__key">Year Carried Over</dt>
					<dd class="govuk-summary-list__value"><bean:write name="detail" property="year_carried" /></dd>
				</div>
				<div class="govuk-summary-list__row">
					<dt class="govuk-summary-list__key">Case Name</dt>
					<dd class="govuk-summary-list__value"><bean:write name="detail" property="prime_index" /></dd>
				</div>
				<div class="govuk-summary-list__row">
					<dt class="govuk-summary-list__key">Date Account Opened</dt>
					<dd class="govuk-summary-list__value"><bean:write name="detail" property="date_account" /></dd>
				</div>
				<div class="govuk-summary-list__row">
					<dt class="govuk-summary-list__key">Credit Details</dt>
					<dd class="govuk-summary-list__value" id="credit-details">??<bean:write name="detail" property="credit_detail" /></dd>
				</div>
				<script type="text/javascript">
					var creditDetailsDD = document.getElementById("credit-details");						
					creditDetailsDD.innerHTML = creditDetailsDD.innerHTML.replace(/\?/,/\&pound\;/g);
				</script>
			</dl>
	   </logic:present>		