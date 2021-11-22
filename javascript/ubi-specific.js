/* UBI specific scripts - depends on design system but not part of it. 
So when upgrading, leave this as is. Also it only includes non-core functionality */

// Needed for below
function elem(id) {	return document.getElementById(id);}
function byClass(className) { return document.getElementsByClassName(className);}

/* The search class expects zeros in the date fields rather than blanks. 
Therefore if the user doens't enter a date, the fields need to be replaced by zeros in order
to obtain search results. Once the backend search is altered to accept blanks and still provide results,
this can be deleted. */
function defaultDateSearch() {
		var form = elem('js-search-form');
		if(form) {
			form.addEventListener("submit", function() {
				dateInputs = byClass('js-zero-fill');
				for(var i=0; i<dateInputs.length;i++) if(dateInputs[i].value!=='') return;
				for(var i=0; i<dateInputs.length;i++) dateInputs[i].value = '0';
			});
		}
}
defaultDateSearch();
