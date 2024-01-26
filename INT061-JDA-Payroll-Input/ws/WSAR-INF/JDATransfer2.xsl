<?xml version='1.0'?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" />
<xsl:template match="/">
	
<xsl:variable name="BatchID">

       <xsl:value-of select="(/JDAPAY/ONC/Pay[emp>0]/Batch_ID[string-length(text()) > 0])[1]"/>
       
     </xsl:variable>
	<!--<xsl:for-each selet="//Pay[generate-id(.) = generate-id(key('keyemp', emp)[1])]">-->
<JDAPay>
<xsl:for-each-group select="JDAPAY/ONC/Pay[emp>0 and amount=0]" group-by="concat(emp,'|',emprcd,'|',PayStartDate,'|',DID,'|',jobcd,'|',acccd,'|',PayEndDate,'|',HourlyRt,'|',erncd,'|',shift)">

<xsl:sort select="emp"/>


<!-- from WD studio to GIT -->

<Pay>

<Empl><xsl:value-of select="distinct-values(current-group()/emp)"/></Empl>
<EmpRCD><xsl:value-of select="distinct-values(current-group()/emprcd)"/></EmpRCD>
<Hours><xsl:value-of select="format-number(sum(current-group()/Hours),'######.00')"/></Hours>
<Rate><xsl:value-of select="distinct-values(current-group()/HourlyRt)"/></Rate>

<JobCD><xsl:value-of select="distinct-values(current-group()/jobcd)"/></JobCD>
<DeptID><xsl:value-of select=" distinct-values(current-group()/DID )"/></DeptID>
<Amount><xsl:value-of select=" format-number(sum(current-group()/amount),'######.00')"/> </Amount>
<AccCD><xsl:value-of select=" distinct-values(current-group()/acccd) "/></AccCD>
<ErnCD><xsl:value-of select=" distinct-values(current-group()/erncd) "/></ErnCD>
<PayBDT><xsl:value-of select=" distinct-values(current-group()/PayStartDate) "/></PayBDT>
<PayEDT><xsl:value-of select=" distinct-values(current-group()/PayEndDate) "/></PayEDT>
<flag>ON</flag>
<BTID><xsl:value-of select="$BatchID"/></BTID>
<shfcd><xsl:value-of select="distinct-values(current-group()/shift)"/></shfcd>
</Pay>
  </xsl:for-each-group>
<xsl:for-each-group select="JDAPAY/ONC/Pay[emp>0 and amount!=0]" group-by="concat(emp,'|',emprcd,'|',PayStartDate,'|',DID,'|',jobcd,'|',acccd,'|',PayEndDate,'|',HourlyRt,'|',erncd,'|',shift)">
<!--<xsl:for-each-group select="JDAPAY/ONC/Pay[emp>0 and amount!=0]" group-by="concat(emp,'|',emprcd,'|',PayStartDate,'|',DID,'|',jobcd,'|',acccd,'|',PayEndDate,'|',erncd,'|',shift)">-->
<xsl:sort select="emp"/>




<Pay>

<Empl><xsl:value-of select="distinct-values(current-group()/emp)"/></Empl>
<EmpRCD><xsl:value-of select="distinct-values(current-group()/emprcd)"/></EmpRCD>
<Hours><xsl:value-of select="format-number(sum(current-group()/Hours),'######.00')"/></Hours>
<Rate><xsl:value-of select="distinct-values(current-group()/HourlyRt)"/></Rate>
<JobCD><xsl:value-of select="distinct-values(current-group()/jobcd)"/></JobCD>
<DeptID><xsl:value-of select=" distinct-values(current-group()/DID )"/></DeptID>
<Amount><xsl:value-of select=" format-number(sum(current-group()/amount),'######.00')"/> </Amount>
<AccCD><xsl:value-of select=" distinct-values(current-group()/acccd) "/></AccCD>
<ErnCD><xsl:value-of select=" distinct-values(current-group()/erncd) "/></ErnCD>
<PayBDT><xsl:value-of select=" distinct-values(current-group()/PayStartDate) "/></PayBDT>
<PayEDT><xsl:value-of select=" distinct-values(current-group()/PayEndDate) "/></PayEDT>
<flag>ON</flag>
<BTID><xsl:value-of select="$BatchID"/></BTID>
<shfcd><xsl:value-of select="distinct-values(current-group()/shift)"/></shfcd>
</Pay>
  </xsl:for-each-group>

 
<xsl:for-each select="JDAPAY/OFFC/Pay[emp >0]">

<xsl:sort select="emp" order="descending" />
<xsl:sort select="emprcd" order="descending" />
<xsl:sort select="PayEndDate" order="descending" />
<xsl:sort select="action" order="descending" />
<xsl:sort select="category" order="descending" />

<Pay>
<Empl><xsl:value-of select="emp"/></Empl>
 <EmpRCD><xsl:value-of select="emprcd"/></EmpRCD>

<Hours><xsl:value-of select="format-number(Hours,'######.00')"/></Hours>
<Rate><xsl:value-of select="HourlyRt"/></Rate>
<JobCD><xsl:value-of select="jobcd"/></JobCD>
<DeptID><xsl:value-of select="DID"/></DeptID>

<Amount><xsl:value-of select="format-number(amount,'######.00')"/></Amount>
<AccCD><xsl:value-of select="acccd"/></AccCD>
<ErnCD><xsl:value-of select="erncd"/></ErnCD>
<PayBDT><xsl:value-of select="PayStartDate"/></PayBDT>
<PayEDT><xsl:value-of select="PayEndDate"/></PayEDT>
<flag>Off</flag>
<BTID><xsl:value-of select="$BatchID"/></BTID>
<act><xsl:value-of select="action"/></act>
<category><xsl:value-of select="category"/></category>
</Pay>
</xsl:for-each>

</JDAPay>
</xsl:template>

</xsl:stylesheet>