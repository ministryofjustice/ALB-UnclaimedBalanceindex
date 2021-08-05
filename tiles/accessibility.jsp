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

            <div class="banner">
              <h2>Your feedback matters to us</h2>
              <p>We'd love to know how your experience was today and how we can improve things
                 <br><a href="https://eu.surveymonkey.com/r/GB7LJPD" target="_blank">Take our 2 minute survey.</a></p>
            </div>
            <style>
              .banner { border: 4px solid rgb(29, 112, 184); width: 80%; margin-left: 1em; margin-bottom: 1rem; }
              .banner h2 { background: rgb(29, 112, 184); color: white; font-size: 15px; padding: 1rem; margin: 0; }
              .banner p { padding: 1rem; }
            </style>
		

					     <h2 style="margin-top: 0.83in;margin-bottom: 0in;line-height: 110%;text-align: left;background: #ffffff;font-size:21px;font-weight: normal;border: none;padding: 0in;"><strong>Accessibility statement for Unclaimed Balance Index</strong></h2>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">This accessibility statement applies to the <strong>Unclaimed Balance Index&nbsp;</strong>service. The service begins after you click <a href="https://ubi.courtfunds.gov.uk/unclaimedbalancesindex"><u>Search online for unclaimed court accounts</u></a> from the &lsquo;Find and claim money in a court account page&rsquo;.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">The service provides a database search to check whether you are entitled to any unclaimed funds at court.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">This website is run by the Ministry of Justice. We want as many people as possible to be able to use this website. For example, that means you should be able to:</p>
<ul>
    <li>
        <p style="margin-top: 0.42in;margin-bottom: 0in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">resize text without assistive technology up to 200 percent without loss of content or functionality</p>
    </li>
    <li>
        <p style="margin-bottom: 0in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">zoom in up to 300 percent without the text spilling off the screen</p>
    </li>
    <li>
        <p style="margin-bottom: 0in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">navigate most of the website using just a keyboard</p>
    </li>
    <li>
        <p style="margin-bottom: 0in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">navigate most of the website using speech recognition software</p>
    </li>
    <li>
        <p style="margin-bottom: 0.47in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">listen to most of the website using a screen reader (including the most recent versions of JAWS, NVDA and VoiceOver)</p>
    </li>
</ul>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">We&rsquo;ve also made the website text as simple as possible to understand.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;"><a href="https://mcmw.abilitynet.org.uk/"><u>AbilityNet</u></a> has advice on making your device easier to use if you have a disability.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;"><strong>How accessible this website is</strong></p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">We know some parts of this website are not fully accessible:</p>
<ul>
    <li>
        <p style="margin-top: 0.42in;margin-bottom: 0in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">There are several missing and/or incomplete headings which may not work well with screen readers</p>
    </li>
    <li>
        <p style="margin-bottom: 0in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">The font of the text throughout the site is small and may cause some discomfort to users with visual impairments</p>
    </li>
    <li>
        <p style="margin-bottom: 0in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">There are several contrast errors on different pages</p>
    </li>
    <li>
        <p style="margin-bottom: 0.47in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">The footer links do not direct users to the correct place</p>
    </li>
</ul>
<h3 style="margin-top: 0.83in;margin-bottom: 0in;color: #434343;line-height: 110%;text-align: left;background: #ffffff;font-size:19px;font-weight: normal;border: none;padding: 0in;"><strong>Reporting accessibility problems with this website</strong></h3>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">We&rsquo;re always looking to improve the accessibility of this website.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">If you find any problems not listed on this page or think we&rsquo;re not meeting accessibility requirements, contact:</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;"><a href="mailto:DEX-Engage@digital.justice.gov.uk"><u>DEX-Engage@digital.justice.gov.uk</u></a></p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;"><br>&nbsp;</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;"><strong>Enforcement procedure</strong></p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">The Equality and Human Rights Commission (EHRC) is responsible for enforcing the Public Sector Bodies (Websites and Mobile Applications) (No. 2) Accessibility Regulations 2018 (the &lsquo;accessibility regulations&rsquo;). If you&rsquo;re not happy with how we respond to your complaint, <a href="https://www.equalityadvisoryservice.com/"><u>contact the Equality Advisory and Support Service (EASS)</u></a>.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;"><strong>Contacting us by phone or visiting us in person</strong></p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">If you need information on this website in a different format like accessible PDF, large print, easy read, audio recording or braille;</p>
<ul>
    <li>
        <p style="margin-top: 0.32in;margin-bottom: 0in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">Email the Court Funds Office at <a href="mailto:enquiries@cfo.gov.uk"><u>enquiries@cfo.gov.uk</u></a></p>
    </li>
    <li>
        <p style="margin-bottom: 0in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">Telephone: 0300 0200 199 Monday to Friday, 9am to 5pm</p>
    </li>
    <li>
        <p style="margin-bottom: 0.53in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">You can also write to: Court Funds Office, Sunderland, SR43 3AB</p>
    </li>
</ul>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;"><strong>Technical information about this website&rsquo;s accessibility</strong></p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">The Ministry of Justice is committed to making its website accessible, in accordance with the Public Sector Bodies (Websites and Mobile Applications) (No. 2) Accessibility Regulations 2018.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;"><strong>Compliance status</strong></p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">This website is partially compliant with the <a href="https://www.w3.org/TR/WCAG21/"><u>Web Content Accessibility Guidelines version 2.1</u></a> AA standard, due to the non-compliances listed below.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;"><br>&nbsp;</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;"><strong>Non-accessible content</strong></p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">The content listed below is non-accessible for the following reasons.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;"><strong>Non-compliance with the accessibility regulations</strong></p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">There is 1 empty heading and 1 heading requiring content.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">There are multiple alerts for small text fonts being used throughout the site.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">When tabbing is used to navigate through the site, the &lsquo;reset date&rsquo; option of the search is skipped.</p>
<p style="line-height: 115%;margin-bottom: 0in;border: none;padding: 0in;background: rgb(255, 255, 255);text-align: left;">There are 2 instances where colour contrast does not meet the requirements and may hinder low vision / colour blind users.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">There is no Welsh language version of the site.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">The footer links do not direct users to a satisfactory destination, they only take the user to a contact section.</p>
<p style="line-height: 115%;margin-bottom: 0in;border: none;padding: 0in;background: rgb(255, 255, 255);text-align: left;"><br></p>
<h2 style="margin-top: 0.25in;margin-bottom: 0.08in;line-height: 100%;text-align: left;background: #ffffff;font-size:21px;font-weight: normal;border: none;padding: 0in;"><strong>What we&apos;re doing to improve accessibility</strong></h2>
<p style="line-height: 115%;margin-bottom: 0in;border: none;padding: 0in;background: rgb(255, 255, 255);text-align: left;"><br></p>
<p style="line-height: 115%;margin-bottom: 0in;border: none;padding: 0in;background: rgb(255, 255, 255);text-align: left;">We are already working on accessibility issues that are highlighted in an internal accessibility test.</p>
<p style="line-height: 115%;margin-bottom: 0in;border: none;padding: 0in;background: rgb(255, 255, 255);text-align: left;"><br></p>
<p style="line-height: 115%;margin-bottom: 0in;border: none;padding: 0in;background: rgb(255, 255, 255);text-align: left;">We have referred this service for an independent third party accessibility audit.</p>
<p style="line-height: 115%;margin-bottom: 0in;border: none;padding: 0in;background: rgb(255, 255, 255);text-align: left;"><br></p>
<p style="line-height: 115%;margin-bottom: 0in;border: none;padding: 0in;background: rgb(255, 255, 255);text-align: left;">Our aim is to have all of these non-compliant issues rectified by the end of December 2021 at the latest.</p>
<p style="line-height: 115%;margin-bottom: 0in;border: none;padding: 0in;background: rgb(255, 255, 255);text-align: left;"><br></p>
<h1 style="margin-top: 0.28in;margin-bottom: 0.08in;font-size:27px;line-height: 100%;text-align: left;background: #ffffff;border: none;padding: 0in;"><strong>How we tested this website</strong></h1>
<p style="line-height: 115%;margin-bottom: 0in;border: none;padding: 0in;background: rgb(255, 255, 255);text-align: left;"><br></p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">This website was last tested on 29 July 2021. The test was carried out by a member of the MoJ&rsquo;s Digital &amp; Technology team.</p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">A basic accessibility test for all 3 pages of the website was conducted.</p>
<p style="line-height: 115%;margin-bottom: 0in;border: none;padding: 0in;background: rgb(255, 255, 255);text-align: left;"><br></p>
<p style="line-height: 115%;margin-bottom: 0in;border: none;padding: 0in;background: rgb(255, 255, 255);text-align: left;"><strong>Preparation of this accessibility statement</strong></p>
<p style="margin-top: 0.21in;margin-bottom: 0.21in;border: none;padding: 0in;line-height: 131%;background: rgb(255, 255, 255);text-align: left;">This statement was prepared on 2 August 2021. It was last reviewed on 2 August 2021.</p>
<p style="line-height: 115%;background: transparent;margin-bottom: 0in;text-align: left;"><br></p>

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