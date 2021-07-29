<%@ page language="java"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
         
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>Court Funds Office</title>

<title> 
      Court Funds Office - Offices of Court Funds, Official Solicitor and Public Trustee
    </title> 
    <meta name="DC.title" content="Court Funds Office - Offices of Court Funds, Official Solicitor and Public Trustee" /> 
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" /> 
    <meta name="Keywords" content="Court funds, Official Solicitor, Public Trustee, Court Funds Office, CFO, payments into court, Court of Protection, Investment and Banking" /> 
    <meta name="DC.subject.keyword" content="Court funds, Official Solicitor, Public Trustee, Court Funds Office, CFO, payments into court, Court of Protection, Investment and Banking" /> 
    <meta name="Description" content="Court Funds Office homepage. The Court Funds Office provides an Investment and Banking service to Courts throughout England and Wales." /> 
    <meta name="DC.description" content="Court Funds Office homepage. The Court Funds Office provides an Investment and Banking service to Courts throughout England and Wales." /> 
    <meta name="author" content="Offices of Court Funds, Official Solicitor and Public Trustee" /> 
    <meta name="DC.creator" content="Offices of Court Funds, Official Solicitor and Public Trustee" /> 
    <meta name="DC.contributor" content="Offices of Court Funds, Official Solicitor and Public Trustee" /> 
    <meta name="DC.identifier" content="/cfo/cfo.htm" /> 
    <meta name="DC.date.created" content="2007-03-06" /> 
    <meta name="DC.date.modified" content="2011-07-26" /> 
    <meta name="DC.publisher" content="Offices of Court Funds, Official Solicitor and Public Trustee" /> 
    <meta name="DC.format" content="Text/HTML" /> 
    <meta name="DC.language" content="eng" /> 
    <meta name="DC.rights.copyright" content="Crown Copyright" /> 
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />	
	<meta name="robots" content="noindex, nofollow" />
	<meta http-equiv="Content-Style-Type" content="text/css" />


<link rel="stylesheet" type="text/css" href="directGov/dg/css/dg.css" />
<!--[if lte IE 7]>
		<link href="directGov/common/css/dgie.css" rel="stylesheet" type="text/css" media="screen" />
	<![endif]-->
<!--[if IE 6]>
		<link href="directGov/common/css/dgie6.css" rel="stylesheet" type="text/css" media="screen" />
	<![endif]-->
<link rel="alternate stylesheet" type="text/css" href="directGov/common/css/standard.css" title="Standard" />
<link rel="alternate stylesheet" type="text/css" href="directGov/common/css/larger.css" title="Larger" />
<link rel="alternate stylesheet" type="text/css" href="directGov/common/css/largest.css" title="Largest" />	
<link rel="stylesheet" type="text/css" href="directGov/common/css/complex_table.css" />	

<script type="text/javascript" src="directGov/common/js/jquery.js"></script>
<script type="text/javascript" src="directGov/common/js/dg.js"></script>
<script type="text/javascript" src="directGov/common/js/complextable.js"></script>	

<!-- CSS for banner -->
<style type="text/css">
#moj-header {width: 100%; background-color: #fff; padding: 0; margin: 14px 0 0 0; border: 0;}
#moj-header #moj-logo {display:block; width: 170px; float:left; border: 0; background-color: #fff; margin: 0 0 0 20px; padding: 0}
#moj-header #moj-logo img.moj-image {padding: 0; margin: 0 0 15px 0; border: 0; background-color: #fff;}
#moj-header #service-provider {display:block; float:right; margin: 0 0 15px 0; padding: 0; width: 460px;}
#moj-header #service-provider #sp-text {float: left; padding: 0; margin: 0; border: 0; background-color: #fff; text-align: right; width: 171px;}
#moj-header #service-provider #sp-text p {color: #6e6e6e; font-size: 1.1em; padding: 0; margin: 0; text-align: right;}
#moj-header #service-provider #sp-logo {float: right; padding: 0; margin: 0 45px 0 0; border: 0; background-color: #fff; width: 239px;}
#moj-header #service-provider #sp-logo img.moj-image {padding: 0; margin: 0; border: 0; background-color: #fff;}
.moj-clear {clear: both; padding: 0; margin: 0 47px 0 20px; border-top: 28px solid #7d7d7d; border-bottom: 3px solid #007ce6;}
#Section {border-top: 0;}
</style>
 
<!--[if IE 7]>
   <style type="text/css">
     #moj-header #moj-logo img.moj-image {margin: 0 0 23px 0;}
     #moj-header #service-provider {margin: 0 47px 23px 0; width: 415px;}
     #moj-header #service-provider #sp-text {float: left; padding: 0; margin: 0; border: 0; background-color: #fff; text-align: right;}
     #moj-header #service-provider #sp-logo {float: right; padding: 0; margin: 0; border: 0; background-color: #fff;}
   </style>
<![endif]-->
</head>

<body>
<div class="iewrapper">
	<div class="wrapper"> <a href="#Heading" class="access">Go to main content</a>
		
		<div class="innerwrapper">
			<div class="twocolfloat">

<div id="TopBar">
    <!-- Start banner -->
    <div id="moj-header">
        <div id="moj-logo"><a href="http://www.justice.gov.uk/index.htm"><img src="directGov/dg/images/logo-blue-banner.gif" class="moj-image" alt="Justice homepage" /></a></div>
        <div id="service-provider"> 
            <div id="sp-text"><p>Service provided by:</p></div>
            <div id="sp-logo"><a href="http://www.justice.gov.uk/about/cfo/index.htm"><img src="directGov/dg/images/logo-cfo.gif" alt="About the Court Funds Office" class="moj-image" /></a></div>
        </div>
        <div class="moj-clear"></div>
    </div>
   <!-- End banner -->
</div>                          
				
        <div class="onecolblock">
					<div id="Section">
						<div id="TextSize"> </div>
						<div id="Heading">
							<h1>Unclaimed Balance Index</h1>
						</div>
						</div>
						
						<div> <Strong>&nbsp; &nbsp; &nbsp; &nbsp; We'd love to know how your experience was today and how can we improve things <a href="https://eu.surveymonkey.com/r/GBKT5HM">Take our 2 minute survey.</a></Strong>
					 </div>
						
					     <tiles:insert attribute="content" />              	
        
             	<div id="LHC">
				<div class="holder"> </div>
			</div>
		</div>
    
          <!-- footer starts --> 
          
          <div id="Footer">
				<div class="holder"> 
				<ul> 
					<li><a accesskey="3" class="first" href="http://www.courtfunds.gov.uk/sitemap.htm">Site map</a> </li> 
					<li> <a accesskey="0" class="" href="http://www.courtfunds.gov.uk/accessibility.htm">Accessibility</a> </li> 
					<li><a accesskey="6" class="" href="http://www.courtfunds.gov.uk/help.htm">Help</a> </li> 
					<li><a href="http://www.courtfunds.gov.uk/contact/contact.htm">Contact us</a></li> 
					<li><a accesskey="8" class="" href="http://www.courtfunds.gov.uk/copyright.htm">&#169;Crown copyright 2007. All rights reserved</a> </li> 
				</ul> 
			</div>	
		</div>
     
	</div>
</div>


</div>
</div>
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
