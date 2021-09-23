<%@ page language="java"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
         
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>Form Elements Example</title>

	<meta http-equiv="content-type" content="text/html;charset=utf-8" />	
	<meta name="robots" content="noindex, nofollow" />
	<meta http-equiv="Content-Style-Type" content="text/css" />


</head>

<body>
<div class="iewrapper">
	<div class="wrapper"> <a href="#Heading" class="access">Go to main content</a>
		<div class="printlogo"> <img src="directGov/dg/images/printlogo.gif" alt="Directgov logo" />
			<p>Public services all in one place</p>
		</div>
		<div class="innerwrapper">
			<div class="twocolfloat">
<!-- Include the Top Bar here -->
		<div id="TopBar">
			<div class="holder"> <span class="tl"></span><span class="tr"><span></span></span> <a href="#" tabindex="1"><img src="directGov/dg/images/logo.png" alt="Link to Directgov homepage" /></a>
				<p>Public services all in one place</p>
		  </div>
		</div>				
<!-- End of Top Bar -->
				
        <div class="onecolblock">
					<div id="Section">
						<div id="TextSize"> <a href="http://www.direct.gov.uk/en/Hl1/Help/Accessibility/index.htm" class="nojs">Resize text help</a> </div>
						<div id="Heading">
							<h1>Unclaimed Balance Index</h1>
						</div>
					</div>
					
					     <tiles:insert attribute="content" />              	
             	
          <div id="Footer">
			<div class="holder">
				<ul>
					<li><a href="#" class="first">About <acronym title="Any Department">Any Dept</acronym></a></li>
					<li><a href="start-bldg-comb.html">Linking to Directgov</a></li>
					<li><a href="#" class="newwindow">Terms and conditions</a></li>
					<li><a href="#">Your privacy</a></li>
					<li><a href="#">&copy; Crown copyright</a></li>
				</ul>
			</div>				
		</div>

		<div class="pfooter">
			<p>Service provided by <acronym title="Any Department">Any Dept</acronym>: <span class="clear"></span>http://AnyDept.co.uk/</p>
			<p>Published: 2008/01/07 16:20:37 <abbr title="Greenwich Meridian Time">GMT</abbr></p>
			<p>&copy; DVLA</p>
		</div>
	</div>
</div>

<!--BEGIN_EXCLUDE-->
<script type="text/javascript" src="/dg_scripts/ProphetInsert.js"></script>
<noscript><div><img src='http://directgov.stcllctrs.com/OWCPZPDTRUV/noScript.bmp' alt="Scipt is not enabled" /></div></noscript>
<!--END_EXCLUDE-->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-37377084-49', 'auto');
  ga('send', 'pageview');

</script>
</body>
</html>