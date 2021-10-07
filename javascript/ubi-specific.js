/* UBI specific scripts - depends on design system but not part of it. 
So when upgrading, leave this as is. Also it only includes non-core functionality */

// Needed for below
function elem(id) {	return document.getElementById(id);}
function byClass(className) { return document.getElementsByClassName(className);}

/* Style results table as it's locked in backend code, so no access to Java classes 
called from Search results page. Also any further styling using JavaScript is to in order
to stick to the GDS patterns 
Once backend changes are made to include code classes, this can be deleted. */
var stylingGDS = {
	init: function() {
		if(elem('js-results-table')) { 
			this.styleResultsTable();
			this.stylePagination();
		}
	}
	,styleResultsTable: function() { 
		var table = elem('result'); if(!table)return;
		var tableTags = function(tagName) { return table.getElementsByTagName(tagName); };
		var headers = tableTags('th');
		for(var th of headers) th.className='govuk-table__header';
		var rows = tableTags('tr');
		for(var tr of rows) tr.className='govuk-table__row';
		var links = tableTags('a');
		for(var link of links) link.className='govuk-link';
		if(tableTags('tbody').length>0)
			tableTags('tbody')[0].className = 'govuk-table__body';
		if(tableTags('tbody').length>0)
			tableTags('thead')[0].className = 'govuk-table__head';
	}
	,stylePagination: function(){
		var paginationTitle = byClass('pagebanner')[0];
		if(paginationTitle)paginationTitle.parentNode.removeChild(paginationTitle);
		var pageLinksHolder = byClass('pagelinks')[0];
		if(pageLinksHolder) pageLinksHolder.className = 'govuk-body';
		var pageLinks = pageLinksHolder.getElementsByClassName('a');
		for(var link of pageLinks) link.className = 'govuk-link';
	}
};
stylingGDS.init();

/* The search class expects zeros in the date fields rather than blanks. 
Therefore if the user doens't enter a date, the fields need to be replaced by zeros in order
to obtain search results. Once the backend search is altered to accept blanks and still provide results,
this can be deleted. */
function defaultDateSearch() {
		var form = elem('js-search-form');
		if(form) {
			form.addEventListener("submit", function() {
				dateInputs = byClass('js-zero-fill');
				for(dateInput of dateInputs) if(dateInput.value!=='') return;
				for(dateInput of dateInputs) dateInput.value = '0';
			});
		}
}
defaultDateSearch();
