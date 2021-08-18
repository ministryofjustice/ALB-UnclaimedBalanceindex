
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>


					<div id="Content">
						<div class="holder">
							<div class="steps">
								<h2>Information summary</h2>
							</div>
							<div class="formtext first">
								
								<p>"When conducting a search, please insert either an account number (if known) and/or the name(s) of the case. It may aid your search to complete an approximate date the Court Order was made.</p>
 
								<p>	i.e. with account number - 27891234P (9 characters)</p> 
     								<p>with name - Smith v Jones Insurance</p>
 
									<p>Please note the more information completed the narrower the results will be"</p>
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
							
							
							

							<html:form  styleClass="accessible" action="searchResults.do" method="get">
								<div class="formwrap"> <span class="tl"></span> <span class="tr"><span></span></span>
									<div class="formcon">
										<div class="formblock contact first">
											<fieldset>
											<legend><span>Find results</span></legend>
											
											<div>
												<div class="odd">
													<label for="phrase"><span>* Key word (eg., name, location, case type, company/organisation etc)</span></label>
												</div>
												<div class="even">
													<html:text property="name"></html:text>
												</div>
											</div>
											<div>
												<div class="odd">
													<label for="words"><span>With account number</span></label>
												</div>
												<div class="even">
													<html:text property="case_number"/>
												</div>
											</div>
											
											</fieldset>
										</div>
										
										
										
							
										<div class="formblock">
											<div>
												<h3>Search within a date range</h3>
											</div>
											<fieldset class="selectset">
											<legend><span class="access">Warning 2: Please enter a valid date for the from date range</span> <span>From date</span></legend>
											<div>
							
												<label for="day"><span>Day</span></label>
												<html:select styleId="day" property="from_day" styleClass="daymonth">
													<html:option value="0"></html:option>
													<html:option value="01">01</html:option>
													<html:option value="02">02</html:option>
													<html:option value="03">03</html:option>
													<html:option value="04">04</html:option>
													<html:option value="05">05</html:option>
													<html:option value="06">06</html:option>
													<html:option value="07">07</html:option>
													<html:option value="08">08</html:option>
													<html:option value="09">09</html:option>
													<html:option value="10">10</html:option>
													<html:option value="11">11</html:option>
													<html:option value="12">12</html:option>
													<html:option value="13">13</html:option>
													<html:option value="14">14</html:option>
													<html:option value="15">15</html:option>
													<html:option value="16">16</html:option>
													<html:option value="17">17</html:option>
													<html:option value="18">18</html:option>
													<html:option value="19">19</html:option>
													<html:option value="20">20</html:option>
													<html:option value="21">21</html:option>
													<html:option value="22">22</html:option>
													<html:option value="23">23</html:option>
													<html:option value="24">24</html:option>
													<html:option value="25">25</html:option>
													<html:option value="26">26</html:option>
													<html:option value="27">27</html:option>
													<html:option value="28">28</html:option>
													<html:option value="29">29</html:option>
													<html:option value="30">30</html:option>
													<html:option value="31">31</html:option>
												
												</html:select>
												
												
												<label for="month"><span>Month</span></label>
												<html:select styleId="month" property="from_month" styleClass="daymonth">
													<html:option value="0"></html:option>
													<html:option value="01">01</html:option>
													<html:option value="02">02</html:option>
													<html:option value="03">03</html:option>
													<html:option value="04">04</html:option>
													<html:option value="05">05</html:option>
													<html:option value="06">06</html:option>
													<html:option value="07">07</html:option>
													<html:option value="08">08</html:option>
													<html:option value="09">09</html:option>
													<html:option value="10">10</html:option>
													<html:option value="11">11</html:option>
													<html:option value="12">12</html:option>
												</html:select>
												
												<label for="year"><span>Year</span></label>
												<html:select styleId="year" property="from_year" styleClass="year">
													<html:option value="0"></html:option>
													
													
													<% String j="";
													for(Integer i=new java.util.Date().getYear()+1900;i>=2011;i--){ 
 														//System.out.println("Year is >>>>>>>>"+new java.util.Date().getYear()+1900);
 														if(i==(new java.util.Date().getYear()+1900)){  
 													%>
 														<optgroup label="<%=i.toString()%> to 2011 ">
 														<% }%>
          
													
													 
                                                    <html:option value="<%=i.toString() %>"><%=i.toString() %></html:option>
													<%
														} %>
													</optgroup>
													<optgroup label="2010 to 2000">
													<html:option value="2010">2010</html:option>
													<html:option value="2009">2009</html:option>
													<html:option value="2008">2008</html:option>
													<html:option value="2007">2007</html:option>
													<html:option value="2006">2006</html:option>
													<html:option value="2005">2005</html:option>
													<html:option value="2004">2004</html:option>
													<html:option value="2003">2003</html:option>
													<html:option value="2002">2002</html:option>
													<html:option value="2001">2001</html:option>
													<html:option value="2000">2000</html:option>
													</optgroup>
													
													<optgroup label="1999 to 1991">
													<html:option value="1999">1999</html:option>
													<html:option value="1998">1998</html:option>
													<html:option value="1997">1997</html:option>
													<html:option value="1996">1996</html:option>
													<html:option value="1995">1995</html:option>
													<html:option value="1994">1994</html:option>
													<html:option value="1993">1993</html:option>
													<html:option value="1992">1992</html:option>
													<html:option value="1991">1991</html:option>
													</optgroup>
													<optgroup label="1990 to 1981">
													<html:option value="1990">1990</html:option>
													<html:option value="1989">1989</html:option>
													<html:option value="1988">1988</html:option>
													<html:option value="1987">1987</html:option>
													<html:option value="1986">1986</html:option>
													<html:option value="1985">1985</html:option>
													<html:option value="1984">1984</html:option>
													<html:option value="1983">1983</html:option>
													<html:option value="1982">1982</html:option>
													<html:option value="1981">1981</html:option>
													</optgroup>
													<optgroup label="1980 to 1971">
													<html:option value="1980">1980</html:option>
													<html:option value="1979">1979</html:option>
													<html:option value="1978">1978</html:option>
													<html:option value="1977">1977</html:option>
													<html:option value="1976">1976</html:option>
													<html:option value="1975">1975</html:option>
													<html:option value="1974">1974</html:option>
													<html:option value="1973">1973</html:option>
													<html:option value="1972">1972</html:option>
													<html:option value="1971">1971</html:option>
													</optgroup>
													<optgroup label="1970 to 1961">
													<html:option value="1970">1970</html:option>
													<html:option value="1969">1969</html:option>
													<html:option value="1968">1968</html:option>
													<html:option value="1967">1967</html:option>
													<html:option value="1966">1966</html:option>
													<html:option value="1965">1965</html:option>
													<html:option value="1964">1964</html:option>
													<html:option value="1963">1963</html:option>
													<html:option value="1962">1962</html:option>
													<html:option value="1961">1961</html:option>
													</optgroup>
													<optgroup label="1960 to 1951">
													<html:option value="1960">1960</html:option>
													<html:option value="1959">1959</html:option>
													<html:option value="1958">1958</html:option>
													<html:option value="1957">1957</html:option>
													<html:option value="1956">1956</html:option>
													<html:option value="1955">1955</html:option>
													<html:option value="1954">1954</html:option>
													<html:option value="1953">1953</html:option>
													<html:option value="1952">1952</html:option>
													<html:option value="1951">1951</html:option>
													</optgroup>
													<optgroup label="1950 to 1941">
													<html:option value="1950">1950</html:option>
													<html:option value="1949">1949</html:option>
													<html:option value="1948">1948</html:option>
													<html:option value="1947">1947</html:option>
													<html:option value="1946">1946</html:option>
													<html:option value="1945">1945</html:option>
													<html:option value="1944">1944</html:option>
													<html:option value="1943">1943</html:option>
													<html:option value="1942">1942</html:option>
													<html:option value="1941">1941</html:option>
													</optgroup>
													<optgroup label="1940 to 1931">
													<html:option value="1940">1940</html:option>
													<html:option value="1939">1939</html:option>
													<html:option value="1938">1938</html:option>
													<html:option value="1937">1937</html:option>
													<html:option value="1936">1936</html:option>
													<html:option value="1935">1935</html:option>
													<html:option value="1934">1934</html:option>
													<html:option value="1933">1933</html:option>
													<html:option value="1932">1932</html:option>
													<html:option value="1931">1931</html:option>
													</optgroup>
													<optgroup label="1930 to 1921">
													<html:option value="1930">1930</html:option>
													<html:option value="1929">1929</html:option>
													<html:option value="1928">1928</html:option>
													<html:option value="1927">1927</html:option>
													<html:option value="1926">1926</html:option>
													<html:option value="1925">1925</html:option>
													<html:option value="1924">1924</html:option>
													<html:option value="1923">1923</html:option>
													<html:option value="1922">1922</html:option>
													<html:option value="1921">1921</html:option>
													</optgroup>
													<optgroup label="1920 to 1911">
													<html:option value="1920">1920</html:option>
													<html:option value="1919">1919</html:option>
													<html:option value="1918">1918</html:option>
													<html:option value="1917">1917</html:option>
													<html:option value="1916">1916</html:option>
													<html:option value="1915">1915</html:option>
													<html:option value="1914">1914</html:option>
													<html:option value="1913">1913</html:option>
													<html:option value="1912">1912</html:option>
													<html:option value="1911">1911</html:option>
													</optgroup>
													<optgroup label="1910 to 1900">
													<html:option value="1920">1910</html:option>
													<html:option value="1909">1909</html:option>
													<html:option value="1908">1908</html:option>
													<html:option value="1907">1907</html:option>
													<html:option value="1906">1906</html:option>
													<html:option value="1905">1905</html:option>
													<html:option value="1904">1904</html:option>
													<html:option value="1903">1903</html:option>
													<html:option value="1902">1902</html:option>
													<html:option value="1901">1901</html:option>
													<html:option value="1900">1900</html:option>
													</optgroup>
													
													
													
													
													<optgroup label="1899 to 1891">
													<html:option value="1899">1899</html:option>
													<html:option value="1898">1898</html:option>
													<html:option value="1897">1897</html:option>
													<html:option value="1896">1896</html:option>
													<html:option value="1895">1895</html:option>
													<html:option value="1894">1894</html:option>
													<html:option value="1893">1893</html:option>
													<html:option value="1892">1892</html:option>
													<html:option value="1891">1891</html:option>
													</optgroup>
													<optgroup label="1890 to 1881">
													<html:option value="1890">1890</html:option>
													<html:option value="1889">1889</html:option>
													<html:option value="1888">1888</html:option>
													<html:option value="1887">1887</html:option>
													<html:option value="1886">1886</html:option>
													<html:option value="1885">1885</html:option>
													<html:option value="1884">1884</html:option>
													<html:option value="1883">1883</html:option>
													<html:option value="1882">1882</html:option>
													<html:option value="1881">1881</html:option>
													</optgroup>
													<optgroup label="1880 to 1871">
													<html:option value="1880">1880</html:option>
													<html:option value="1879">1879</html:option>
													<html:option value="1878">1878</html:option>
													<html:option value="1877">1877</html:option>
													<html:option value="1876">1876</html:option>
													<html:option value="1875">1875</html:option>
													<html:option value="1874">1874</html:option>
													<html:option value="1873">1873</html:option>
													<html:option value="1872">1872</html:option>
													<html:option value="1871">1871</html:option>
													</optgroup>
													<optgroup label="1870 to 1861">
													<html:option value="1870">1870</html:option>
													<html:option value="1869">1869</html:option>
													<html:option value="1868">1868</html:option>
													<html:option value="1867">1867</html:option>
													<html:option value="1866">1866</html:option>
													<html:option value="1865">1865</html:option>
													<html:option value="1864">1864</html:option>
													<html:option value="1863">1863</html:option>
													<html:option value="1862">1862</html:option>
													<html:option value="1861">1861</html:option>
													</optgroup>
													<optgroup label="1860 to 1851">
													<html:option value="1860">1860</html:option>
													<html:option value="1859">1859</html:option>
													<html:option value="1858">1858</html:option>
													<html:option value="1857">1857</html:option>
													<html:option value="1856">1856</html:option>
													<html:option value="1855">1855</html:option>
													<html:option value="1854">1854</html:option>
													<html:option value="1853">1853</html:option>
													<html:option value="1852">1852</html:option>
													<html:option value="1851">1851</html:option>
													</optgroup>
													<optgroup label="1850 to 1841">
													<html:option value="1850">1850</html:option>
													<html:option value="1849">1849</html:option>
													<html:option value="1848">1848</html:option>
													<html:option value="1847">1847</html:option>
													<html:option value="1846">1846</html:option>
													<html:option value="1845">1845</html:option>
													<html:option value="1844">1844</html:option>
													<html:option value="1843">1843</html:option>
													<html:option value="1842">1842</html:option>
													<html:option value="1841">1841</html:option>
													</optgroup>
													<optgroup label="1840 to 1831">
													<html:option value="1840">1840</html:option>
													<html:option value="1839">1839</html:option>
													<html:option value="1838">1838</html:option>
													<html:option value="1837">1837</html:option>
													<html:option value="1836">1836</html:option>
													<html:option value="1835">1835</html:option>
													<html:option value="1834">1834</html:option>
													<html:option value="1833">1833</html:option>
													<html:option value="1832">1832</html:option>
													<html:option value="1831">1831</html:option>
													</optgroup>
													<optgroup label="1830 to 1821">
													<html:option value="1830">1830</html:option>
													<html:option value="1829">1829</html:option>
													<html:option value="1828">1828</html:option>
													<html:option value="1827">1827</html:option>
													<html:option value="1826">1826</html:option>
													<html:option value="1825">1825</html:option>
													<html:option value="1824">1824</html:option>
													<html:option value="1823">1823</html:option>
													<html:option value="1822">1822</html:option>
													<html:option value="1821">1821</html:option>
													</optgroup>
													<optgroup label="1820 to 1811">
													<html:option value="1820">1820</html:option>
													<html:option value="1819">1819</html:option>
													<html:option value="1818">1818</html:option>
													<html:option value="1817">1817</html:option>
													<html:option value="1816">1816</html:option>
													<html:option value="1815">1815</html:option>
													<html:option value="1814">1814</html:option>
													<html:option value="1813">1813</html:option>
													<html:option value="1812">1812</html:option>
													<html:option value="1811">1811</html:option>
													</optgroup>
													<optgroup label="1810 to 1800">
													<html:option value="1810">1810</html:option>
													<html:option value="1809">1809</html:option>
													<html:option value="1808">1808</html:option>
													<html:option value="1807">1807</html:option>
													<html:option value="1806">1806</html:option>
													<html:option value="1805">1805</html:option>
													<html:option value="1804">1804</html:option>
													<html:option value="1803">1803</html:option>
													<html:option value="1802">1802</html:option>
													<html:option value="1801">1801</html:option>
													<html:option value="1800">1800</html:option>
													</optgroup>
													
													<optgroup label="1799 to 1791">
													<html:option value="1799">1799</html:option>
													<html:option value="1798">1798</html:option>
													<html:option value="1797">1797</html:option>
													<html:option value="1796">1796</html:option>
													<html:option value="1795">1795</html:option>
													<html:option value="1794">1794</html:option>
													<html:option value="1793">1793</html:option>
													<html:option value="1792">1792</html:option>
													<html:option value="1791">1791</html:option>
													</optgroup>
													<optgroup label="1790 to 1781">
													<html:option value="1790">1790</html:option>
													<html:option value="1789">1789</html:option>
													<html:option value="1788">1788</html:option>
													<html:option value="1787">1787</html:option>
													<html:option value="1786">1786</html:option>
													<html:option value="1785">1785</html:option>
													<html:option value="1784">1784</html:option>
													<html:option value="1783">1783</html:option>
													<html:option value="1782">1782</html:option>
													<html:option value="1781">1781</html:option>
													</optgroup>
													<optgroup label="1780 to 1771">
													<html:option value="1780">1780</html:option>
													<html:option value="1779">1779</html:option>
													<html:option value="1778">1778</html:option>
													<html:option value="1777">1777</html:option>
													<html:option value="1776">1776</html:option>
													<html:option value="1775">1775</html:option>
													<html:option value="1774">1774</html:option>
													<html:option value="1773">1773</html:option>
													<html:option value="1772">1772</html:option>
													<html:option value="1771">1771</html:option>
													</optgroup>
													<optgroup label="1770 to 1761">
													<html:option value="1770">1770</html:option>
													<html:option value="1769">1769</html:option>
													<html:option value="1768">1768</html:option>
													<html:option value="1767">1767</html:option>
													<html:option value="1766">1766</html:option>
													<html:option value="1765">1765</html:option>
													<html:option value="1764">1764</html:option>
													<html:option value="1763">1763</html:option>
													<html:option value="1762">1762</html:option>
													<html:option value="1761">1761</html:option>
													</optgroup>
													<optgroup label="1760 to 1751">
													<html:option value="1760">1760</html:option>
													<html:option value="1759">1759</html:option>
													<html:option value="1758">1758</html:option>
													<html:option value="1757">1757</html:option>
													<html:option value="1756">1756</html:option>
													<html:option value="1755">1755</html:option>
													<html:option value="1754">1754</html:option>
													<html:option value="1753">1753</html:option>
													<html:option value="1752">1752</html:option>
													<html:option value="1751">1751</html:option>
													</optgroup>
													<optgroup label="1750 to 1741">
													<html:option value="1750">1750</html:option>
													<html:option value="1749">1749</html:option>
													<html:option value="1748">1748</html:option>
													<html:option value="1747">1747</html:option>
													<html:option value="1746">1746</html:option>
													<html:option value="1745">1745</html:option>
													<html:option value="1744">1744</html:option>
													<html:option value="1743">1743</html:option>
													<html:option value="1742">1742</html:option>
													<html:option value="1741">1741</html:option>
													</optgroup>
													<optgroup label="1740 to 1731">
													<html:option value="1740">1740</html:option>
													<html:option value="1739">1739</html:option>
													<html:option value="1738">1738</html:option>
													<html:option value="1737">1737</html:option>
													<html:option value="1736">1736</html:option>
													<html:option value="1735">1735</html:option>
													<html:option value="1734">1734</html:option>
													<html:option value="1733">1733</html:option>
													<html:option value="1732">1732</html:option>
													<html:option value="1731">1731</html:option>
													</optgroup>
													<optgroup label="1730 to 1721">
													<html:option value="1730">1730</html:option>
													<html:option value="1729">1729</html:option>
													<html:option value="1728">1728</html:option>
													<html:option value="1727">1727</html:option>
													<html:option value="1726">1726</html:option>
													<html:option value="1725">1725</html:option>
													<html:option value="1724">1724</html:option>
													<html:option value="1723">1723</html:option>
													<html:option value="1722">1722</html:option>
													<html:option value="1721">1721</html:option>
													</optgroup>
													<optgroup label="1720 to 1711">
													<html:option value="1720">1720</html:option>
													<html:option value="1719">1719</html:option>
													<html:option value="1718">1718</html:option>
													<html:option value="1717">1717</html:option>
													<html:option value="1716">1716</html:option>
													<html:option value="1715">1715</html:option>
													<html:option value="1714">1714</html:option>
													<html:option value="1713">1713</html:option>
													<html:option value="1712">1712</html:option>
													<html:option value="1711">1711</html:option>
													</optgroup>
													<optgroup label="1710 to 1700">
													<html:option value="1710">1710</html:option>
													<html:option value="1709">1709</html:option>
													<html:option value="1708">1708</html:option>
													<html:option value="1707">1707</html:option>
													<html:option value="1706">1706</html:option>
													<html:option value="1705">1705</html:option>
													<html:option value="1704">1704</html:option>
													<html:option value="1703">1703</html:option>
													<html:option value="1702">1702</html:option>
													<html:option value="1701">1701</html:option>
													<html:option value="1700">1700</html:option>
													</optgroup>
												</html:select>
											</div>
											</fieldset>
											<fieldset class="selectset">
											<legend><span>To date</span></legend>
											<div>
												<label for="today"><span>Day</span></label>
												<html:select styleId="day" property="to_day" styleClass="daymonth">
													<html:option value="0"></html:option>
													<html:option value="01">01</html:option>
													<html:option value="02">02</html:option>
													<html:option value="03">03</html:option>
													<html:option value="04">04</html:option>
													<html:option value="05">05</html:option>
													<html:option value="06">06</html:option>
													<html:option value="07">07</html:option>
													<html:option value="08">08</html:option>
													<html:option value="09">09</html:option>
													<html:option value="10">10</html:option>
													<html:option value="11">11</html:option>
													<html:option value="12">12</html:option>
													<html:option value="13">13</html:option>
													<html:option value="14">14</html:option>
													<html:option value="15">15</html:option>
													<html:option value="16">16</html:option>
													<html:option value="17">17</html:option>
													<html:option value="18">18</html:option>
													<html:option value="19">19</html:option>
													<html:option value="20">20</html:option>
													<html:option value="21">21</html:option>
													<html:option value="22">22</html:option>
													<html:option value="23">23</html:option>
													<html:option value="24">24</html:option>
													<html:option value="25">25</html:option>
													<html:option value="26">26</html:option>
													<html:option value="27">27</html:option>
													<html:option value="28">28</html:option>
													<html:option value="29">29</html:option>
													<html:option value="30">30</html:option>
													<html:option value="31">31</html:option>
												</html:select>
												<label for="tomonth"><span>Month</span></label>
												<html:select styleId="month" property="to_month" styleClass="daymonth">
												<html:option value="0"></html:option>	<html:option value="01">01</html:option>
													<html:option value="02">02</html:option>
													<html:option value="03">03</html:option>
													<html:option value="04">04</html:option>
													<html:option value="05">05</html:option>
													<html:option value="06">06</html:option>
													<html:option value="07">07</html:option>
													<html:option value="08">08</html:option>
													<html:option value="09">09</html:option>
													<html:option value="10">10</html:option>
													<html:option value="11">11</html:option>
													<html:option value="12">12</html:option>
												</html:select>
												<label for="toyear"><span>Year</span></label>
												<html:select styleId="year" property="to_year" styleClass="year">
													<html:option value="0"></html:option>
													<% String j="";
													for(Integer i=new java.util.Date().getYear()+1900;i>=2011;i--){ 
 														//System.out.println("Year is >>>>>>>>"+new java.util.Date().getYear()+1900);
 														if(i==(new java.util.Date().getYear()+1900)){  
 													%>
 														<optgroup label="<%=i.toString()%> to 2011 ">
 														<% }%>
          
													
													 
                                                    <html:option value="<%=i.toString() %>"><%=i.toString() %></html:option>
													<%
														} %>
													</optgroup>
													<optgroup label="2010 to 2000">
													<html:option value="2010">2010</html:option>
													<html:option value="2009">2009</html:option>
													<html:option value="2008">2008</html:option>
													<html:option value="2007">2007</html:option>
													<html:option value="2006">2006</html:option>
													<html:option value="2005">2005</html:option>
													<html:option value="2004">2004</html:option>
													<html:option value="2003">2003</html:option>
													<html:option value="2002">2002</html:option>
													<html:option value="2001">2001</html:option>
													<html:option value="2000">2000</html:option>
													</optgroup>
													
													<optgroup label="1999 to 1991">
													<html:option value="1999">1999</html:option>
													<html:option value="1998">1998</html:option>
													<html:option value="1997">1997</html:option>
													<html:option value="1996">1996</html:option>
													<html:option value="1995">1995</html:option>
													<html:option value="1994">1994</html:option>
													<html:option value="1993">1993</html:option>
													<html:option value="1992">1992</html:option>
													<html:option value="1991">1991</html:option>
													</optgroup>
													<optgroup label="1990 to 1981">
													<html:option value="1990">1990</html:option>
													<html:option value="1989">1989</html:option>
													<html:option value="1988">1988</html:option>
													<html:option value="1987">1987</html:option>
													<html:option value="1986">1986</html:option>
													<html:option value="1985">1985</html:option>
													<html:option value="1984">1984</html:option>
													<html:option value="1983">1983</html:option>
													<html:option value="1982">1982</html:option>
													<html:option value="1981">1981</html:option>
													</optgroup>
													<optgroup label="1980 to 1971">
													<html:option value="1980">1980</html:option>
													<html:option value="1979">1979</html:option>
													<html:option value="1978">1978</html:option>
													<html:option value="1977">1977</html:option>
													<html:option value="1976">1976</html:option>
													<html:option value="1975">1975</html:option>
													<html:option value="1974">1974</html:option>
													<html:option value="1973">1973</html:option>
													<html:option value="1972">1972</html:option>
													<html:option value="1971">1971</html:option>
													</optgroup>
													<optgroup label="1970 to 1961">
													<html:option value="1970">1970</html:option>
													<html:option value="1969">1969</html:option>
													<html:option value="1968">1968</html:option>
													<html:option value="1967">1967</html:option>
													<html:option value="1966">1966</html:option>
													<html:option value="1965">1965</html:option>
													<html:option value="1964">1964</html:option>
													<html:option value="1963">1963</html:option>
													<html:option value="1962">1962</html:option>
													<html:option value="1961">1961</html:option>
													</optgroup>
													<optgroup label="1960 to 1951">
													<html:option value="1960">1960</html:option>
													<html:option value="1959">1959</html:option>
													<html:option value="1958">1958</html:option>
													<html:option value="1957">1957</html:option>
													<html:option value="1956">1956</html:option>
													<html:option value="1955">1955</html:option>
													<html:option value="1954">1954</html:option>
													<html:option value="1953">1953</html:option>
													<html:option value="1952">1952</html:option>
													<html:option value="1951">1951</html:option>
													</optgroup>
													<optgroup label="1950 to 1941">
													<html:option value="1950">1950</html:option>
													<html:option value="1949">1949</html:option>
													<html:option value="1948">1948</html:option>
													<html:option value="1947">1947</html:option>
													<html:option value="1946">1946</html:option>
													<html:option value="1945">1945</html:option>
													<html:option value="1944">1944</html:option>
													<html:option value="1943">1943</html:option>
													<html:option value="1942">1942</html:option>
													<html:option value="1941">1941</html:option>
													</optgroup>
													<optgroup label="1940 to 1931">
													<html:option value="1940">1940</html:option>
													<html:option value="1939">1939</html:option>
													<html:option value="1938">1938</html:option>
													<html:option value="1937">1937</html:option>
													<html:option value="1936">1936</html:option>
													<html:option value="1935">1935</html:option>
													<html:option value="1934">1934</html:option>
													<html:option value="1933">1933</html:option>
													<html:option value="1932">1932</html:option>
													<html:option value="1931">1931</html:option>
													</optgroup>
													<optgroup label="1930 to 1921">
													<html:option value="1930">1930</html:option>
													<html:option value="1929">1929</html:option>
													<html:option value="1928">1928</html:option>
													<html:option value="1927">1927</html:option>
													<html:option value="1926">1926</html:option>
													<html:option value="1925">1925</html:option>
													<html:option value="1924">1924</html:option>
													<html:option value="1923">1923</html:option>
													<html:option value="1922">1922</html:option>
													<html:option value="1921">1921</html:option>
													</optgroup>
													<optgroup label="1920 to 1911">
													<html:option value="1920">1920</html:option>
													<html:option value="1919">1919</html:option>
													<html:option value="1918">1918</html:option>
													<html:option value="1917">1917</html:option>
													<html:option value="1916">1916</html:option>
													<html:option value="1915">1915</html:option>
													<html:option value="1914">1914</html:option>
													<html:option value="1913">1913</html:option>
													<html:option value="1912">1912</html:option>
													<html:option value="1911">1911</html:option>
													</optgroup>
													<optgroup label="1910 to 1900">
													<html:option value="1920">1910</html:option>
													<html:option value="1909">1909</html:option>
													<html:option value="1908">1908</html:option>
													<html:option value="1907">1907</html:option>
													<html:option value="1906">1906</html:option>
													<html:option value="1905">1905</html:option>
													<html:option value="1904">1904</html:option>
													<html:option value="1903">1903</html:option>
													<html:option value="1902">1902</html:option>
													<html:option value="1901">1901</html:option>
													<html:option value="1900">1900</html:option>
													</optgroup>
													
													
													
													
													<optgroup label="1899 to 1891">
													<html:option value="1899">1899</html:option>
													<html:option value="1898">1898</html:option>
													<html:option value="1897">1897</html:option>
													<html:option value="1896">1896</html:option>
													<html:option value="1895">1895</html:option>
													<html:option value="1894">1894</html:option>
													<html:option value="1893">1893</html:option>
													<html:option value="1892">1892</html:option>
													<html:option value="1891">1891</html:option>
													</optgroup>
													<optgroup label="1890 to 1881">
													<html:option value="1890">1890</html:option>
													<html:option value="1889">1889</html:option>
													<html:option value="1888">1888</html:option>
													<html:option value="1887">1887</html:option>
													<html:option value="1886">1886</html:option>
													<html:option value="1885">1885</html:option>
													<html:option value="1884">1884</html:option>
													<html:option value="1883">1883</html:option>
													<html:option value="1882">1882</html:option>
													<html:option value="1881">1881</html:option>
													</optgroup>
													<optgroup label="1880 to 1871">
													<html:option value="1880">1880</html:option>
													<html:option value="1879">1879</html:option>
													<html:option value="1878">1878</html:option>
													<html:option value="1877">1877</html:option>
													<html:option value="1876">1876</html:option>
													<html:option value="1875">1875</html:option>
													<html:option value="1874">1874</html:option>
													<html:option value="1873">1873</html:option>
													<html:option value="1872">1872</html:option>
													<html:option value="1871">1871</html:option>
													</optgroup>
													<optgroup label="1870 to 1861">
													<html:option value="1870">1870</html:option>
													<html:option value="1869">1869</html:option>
													<html:option value="1868">1868</html:option>
													<html:option value="1867">1867</html:option>
													<html:option value="1866">1866</html:option>
													<html:option value="1865">1865</html:option>
													<html:option value="1864">1864</html:option>
													<html:option value="1863">1863</html:option>
													<html:option value="1862">1862</html:option>
													<html:option value="1861">1861</html:option>
													</optgroup>
													<optgroup label="1860 to 1851">
													<html:option value="1860">1860</html:option>
													<html:option value="1859">1859</html:option>
													<html:option value="1858">1858</html:option>
													<html:option value="1857">1857</html:option>
													<html:option value="1856">1856</html:option>
													<html:option value="1855">1855</html:option>
													<html:option value="1854">1854</html:option>
													<html:option value="1853">1853</html:option>
													<html:option value="1852">1852</html:option>
													<html:option value="1851">1851</html:option>
													</optgroup>
													<optgroup label="1850 to 1841">
													<html:option value="1850">1850</html:option>
													<html:option value="1849">1849</html:option>
													<html:option value="1848">1848</html:option>
													<html:option value="1847">1847</html:option>
													<html:option value="1846">1846</html:option>
													<html:option value="1845">1845</html:option>
													<html:option value="1844">1844</html:option>
													<html:option value="1843">1843</html:option>
													<html:option value="1842">1842</html:option>
													<html:option value="1841">1841</html:option>
													</optgroup>
													<optgroup label="1840 to 1831">
													<html:option value="1840">1840</html:option>
													<html:option value="1839">1839</html:option>
													<html:option value="1838">1838</html:option>
													<html:option value="1837">1837</html:option>
													<html:option value="1836">1836</html:option>
													<html:option value="1835">1835</html:option>
													<html:option value="1834">1834</html:option>
													<html:option value="1833">1833</html:option>
													<html:option value="1832">1832</html:option>
													<html:option value="1831">1831</html:option>
													</optgroup>
													<optgroup label="1830 to 1821">
													<html:option value="1830">1830</html:option>
													<html:option value="1829">1829</html:option>
													<html:option value="1828">1828</html:option>
													<html:option value="1827">1827</html:option>
													<html:option value="1826">1826</html:option>
													<html:option value="1825">1825</html:option>
													<html:option value="1824">1824</html:option>
													<html:option value="1823">1823</html:option>
													<html:option value="1822">1822</html:option>
													<html:option value="1821">1821</html:option>
													</optgroup>
													<optgroup label="1820 to 1811">
													<html:option value="1820">1820</html:option>
													<html:option value="1819">1819</html:option>
													<html:option value="1818">1818</html:option>
													<html:option value="1817">1817</html:option>
													<html:option value="1816">1816</html:option>
													<html:option value="1815">1815</html:option>
													<html:option value="1814">1814</html:option>
													<html:option value="1813">1813</html:option>
													<html:option value="1812">1812</html:option>
													<html:option value="1811">1811</html:option>
													</optgroup>
													<optgroup label="1810 to 1800">
													<html:option value="1810">1810</html:option>
													<html:option value="1809">1809</html:option>
													<html:option value="1808">1808</html:option>
													<html:option value="1807">1807</html:option>
													<html:option value="1806">1806</html:option>
													<html:option value="1805">1805</html:option>
													<html:option value="1804">1804</html:option>
													<html:option value="1803">1803</html:option>
													<html:option value="1802">1802</html:option>
													<html:option value="1801">1801</html:option>
													<html:option value="1800">1800</html:option>
													</optgroup>
													
													<optgroup label="1799 to 1791">
													<html:option value="1799">1799</html:option>
													<html:option value="1798">1798</html:option>
													<html:option value="1797">1797</html:option>
													<html:option value="1796">1796</html:option>
													<html:option value="1795">1795</html:option>
													<html:option value="1794">1794</html:option>
													<html:option value="1793">1793</html:option>
													<html:option value="1792">1792</html:option>
													<html:option value="1791">1791</html:option>
													</optgroup>
													<optgroup label="1790 to 1781">
													<html:option value="1790">1790</html:option>
													<html:option value="1789">1789</html:option>
													<html:option value="1788">1788</html:option>
													<html:option value="1787">1787</html:option>
													<html:option value="1786">1786</html:option>
													<html:option value="1785">1785</html:option>
													<html:option value="1784">1784</html:option>
													<html:option value="1783">1783</html:option>
													<html:option value="1782">1782</html:option>
													<html:option value="1781">1781</html:option>
													</optgroup>
													<optgroup label="1780 to 1771">
													<html:option value="1780">1780</html:option>
													<html:option value="1779">1779</html:option>
													<html:option value="1778">1778</html:option>
													<html:option value="1777">1777</html:option>
													<html:option value="1776">1776</html:option>
													<html:option value="1775">1775</html:option>
													<html:option value="1774">1774</html:option>
													<html:option value="1773">1773</html:option>
													<html:option value="1772">1772</html:option>
													<html:option value="1771">1771</html:option>
													</optgroup>
													<optgroup label="1770 to 1761">
													<html:option value="1770">1770</html:option>
													<html:option value="1769">1769</html:option>
													<html:option value="1768">1768</html:option>
													<html:option value="1767">1767</html:option>
													<html:option value="1766">1766</html:option>
													<html:option value="1765">1765</html:option>
													<html:option value="1764">1764</html:option>
													<html:option value="1763">1763</html:option>
													<html:option value="1762">1762</html:option>
													<html:option value="1761">1761</html:option>
													</optgroup>
													<optgroup label="1760 to 1751">
													<html:option value="1760">1760</html:option>
													<html:option value="1759">1759</html:option>
													<html:option value="1758">1758</html:option>
													<html:option value="1757">1757</html:option>
													<html:option value="1756">1756</html:option>
													<html:option value="1755">1755</html:option>
													<html:option value="1754">1754</html:option>
													<html:option value="1753">1753</html:option>
													<html:option value="1752">1752</html:option>
													<html:option value="1751">1751</html:option>
													</optgroup>
													<optgroup label="1750 to 1741">
													<html:option value="1750">1750</html:option>
													<html:option value="1749">1749</html:option>
													<html:option value="1748">1748</html:option>
													<html:option value="1747">1747</html:option>
													<html:option value="1746">1746</html:option>
													<html:option value="1745">1745</html:option>
													<html:option value="1744">1744</html:option>
													<html:option value="1743">1743</html:option>
													<html:option value="1742">1742</html:option>
													<html:option value="1741">1741</html:option>
													</optgroup>
													<optgroup label="1740 to 1731">
													<html:option value="1740">1740</html:option>
													<html:option value="1739">1739</html:option>
													<html:option value="1738">1738</html:option>
													<html:option value="1737">1737</html:option>
													<html:option value="1736">1736</html:option>
													<html:option value="1735">1735</html:option>
													<html:option value="1734">1734</html:option>
													<html:option value="1733">1733</html:option>
													<html:option value="1732">1732</html:option>
													<html:option value="1731">1731</html:option>
													</optgroup>
													<optgroup label="1730 to 1721">
													<html:option value="1730">1730</html:option>
													<html:option value="1729">1729</html:option>
													<html:option value="1728">1728</html:option>
													<html:option value="1727">1727</html:option>
													<html:option value="1726">1726</html:option>
													<html:option value="1725">1725</html:option>
													<html:option value="1724">1724</html:option>
													<html:option value="1723">1723</html:option>
													<html:option value="1722">1722</html:option>
													<html:option value="1721">1721</html:option>
													</optgroup>
													<optgroup label="1720 to 1711">
													<html:option value="1720">1720</html:option>
													<html:option value="1719">1719</html:option>
													<html:option value="1718">1718</html:option>
													<html:option value="1717">1717</html:option>
													<html:option value="1716">1716</html:option>
													<html:option value="1715">1715</html:option>
													<html:option value="1714">1714</html:option>
													<html:option value="1713">1713</html:option>
													<html:option value="1712">1712</html:option>
													<html:option value="1711">1711</html:option>
													</optgroup>
													<optgroup label="1710 to 1700">
													<html:option value="1710">1710</html:option>
													<html:option value="1709">1709</html:option>
													<html:option value="1708">1708</html:option>
													<html:option value="1707">1707</html:option>
													<html:option value="1706">1706</html:option>
													<html:option value="1705">1705</html:option>
													<html:option value="1704">1704</html:option>
													<html:option value="1703">1703</html:option>
													<html:option value="1702">1702</html:option>
													<html:option value="1701">1701</html:option>
													<html:option value="1700">1700</html:option>
													</optgroup>
											</html:select>
											</div>
											
											
											<span class="pagelinks"><a onclick="resetDate();">Reset date</a></span>
											</fieldset>
											
										</div>
									</div>
									<span class="bl"></span> <span class="br"></span> </div>
								<div class="submitc">
									<div class="function next right"> <span class="tl"></span> <span class="tr"><span></span></span> <html:submit>Next </html:submit> <span class="bl"></span> <span class="br"></span> </div>
								</div>
							</html:form>
						</div>
					</div>
					
