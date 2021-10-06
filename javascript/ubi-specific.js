/* UBI specific scripts - depends on design system but not part of it. So when upgrading, leave this as is. Also it only includes non-core functionality */

/* Style results table as it's locked in backend code, so no access to glasses 
Called from Search results page */
var stylingGDS = {
	init: function() {
		if(this.elem('js-results-table')) { 
			this.styleResultsTable();
			this.stylePagination();
		}
	}
	,elem: function(id) {
		return document.getElementById(id);
	}
	,styleResultsTable: function() { 
		var table = this.elem('result'); if(!table)return;
		var headers = table.getElementsByTagName('th');
		for(var th of headers) th.className='govuk-table__header';
		var rows = table.getElementsByTagName('tr');
		for(var tr of rows) tr.className='govuk-table__row';
		var links = table.getElementsByTagName('a');
		for(var link of links) link.className='govuk-link';
		if(table.getElementsByTagName('tbody').length>0)
			table.getElementsByTagName('tbody')[0].className = 'govuk-table__body';
		if(table.getElementsByTagName('tbody').length>0)
			table.getElementsByTagName('thead')[0].className = 'govuk-table__head';
	}
	,stylePagination: function(){
		var paginationTitle = document.getElementsByClassName('pagebanner')[0];
		if(paginationTitle)paginationTitle.parentNode.removeChild(paginationTitle);
		var pageLinksHolder = document.getElementsByClassName('pagelinks')[0];
		if(pageLinksHolder) pageLinksHolder.className = 'govuk-body';
		var pageLinks = pageLinksHolder.getElementsByTagName('a');
		for(var link of pageLinks) link.className = 'govuk-link'
	}
}
stylingGDS.init();