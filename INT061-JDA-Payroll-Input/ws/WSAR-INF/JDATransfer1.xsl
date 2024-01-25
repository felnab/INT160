<?xml version='1.0'?>
<xsl:stylesheet version="2.0"
xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:xs="http://www.w3.org/2001/XMLSchema"

 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://Microsoft.LobServices.OracleDB/2007/03/SYSADM/Table/PS_GEX_SMTRK_IN">
<xsl:output method="xml" indent="yes" />

	<!--<xsl:param name="IndStores"/> -->

	<xsl:template name="FormatDT">
     <xsl:param name="DateTimeStr" />

   

     <xsl:variable name="mm">
         <xsl:value-of select="substring($DateTimeStr,6,2)" />
     </xsl:variable>

     <xsl:variable name="dd">
        <xsl:value-of select="substring($DateTimeStr,9,2)" />
     </xsl:variable>

     <xsl:variable name="yyyy">
        <xsl:value-of select="substring($DateTimeStr,1,4)" />
     </xsl:variable>

     <xsl:value-of select="concat($yyyy,$mm, $dd)" />
  </xsl:template>

   <xsl:template name="ChgDateToNum">
  <xsl:choose>
        <xsl:when test="format-date(current-date(), '[F]') ='Sunday'">
       <xsl:value-of select="1"/></xsl:when>
	   <xsl:when test="format-date(current-date(), '[F]') ='Monday'">
	    <xsl:value-of select="2"/></xsl:when>
		   <xsl:when test="format-date(current-date(), '[F]') ='Tuesday'">
	    <xsl:value-of select="3"/></xsl:when>
		   <xsl:when test="format-date(current-date(), '[F]') ='Wednesday'">
	    <xsl:value-of select="4"/></xsl:when>
		   <xsl:when test="format-date(current-date(), '[F]') ='Thursday'">
	    <xsl:value-of select="5"/></xsl:when>
		   <xsl:when test="format-date(current-date(), '[F]') ='Friday'">
	    <xsl:value-of select="6"/></xsl:when>
	   <xsl:otherwise><xsl:value-of select="0"/></xsl:otherwise>
</xsl:choose> 
  
  
</xsl:template> 
<xsl:variable name="EEdate">
	<xsl:choose> 
        <xsl:when test="format-date(current-date(), '[F]') ='Sunday'">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P57D')"/></xsl:when>
	   <xsl:when test="format-date(current-date(), '[F]') ='Monday'">
	    <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P58D')"/></xsl:when>
		        <xsl:when test="format-date(current-date(), '[F]') ='Tuesday'">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P59D')"/></xsl:when>
	   <xsl:when test="format-date(current-date(), '[F]') ='Wednesday'">
	    <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P60D')"/></xsl:when>
		        <xsl:when test="format-date(current-date(), '[F]') ='Thursday'">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P61D')"/></xsl:when>
	   <xsl:when test="format-date(current-date(), '[F]') ='Friday'">
	    <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P62D')"/></xsl:when>
		<xsl:otherwise><xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P61D')"/></xsl:otherwise>
     </xsl:choose> 
	 </xsl:variable> 
<xsl:variable name="Curdate">
<xsl:value-of select="current-date()"/>
</xsl:variable>
   <xsl:variable name="DayOfWeek">
        <xsl:call-template name="ChgDateToNum"></xsl:call-template>
     </xsl:variable>


<xsl:variable name="SDayOfWeek">
       <xsl:choose>
        <xsl:when test="$DayOfWeek = 0">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P6D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 1">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P7D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 2">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P8D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 3">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P9D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek=4">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P10D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 5">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P11D')"/>
	   </xsl:when>
	   
	   <xsl:otherwise><xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P12D')"/></xsl:otherwise> 
<!--	   
	  change for testing and Parallel <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P219D')"/>-->
</xsl:choose> 
<xsl:value-of  select="fn:current-date() - xs:dayTimeDuration('P213D')"/>
     </xsl:variable>
	 <xsl:variable name="EDayOfWeek">
        <xsl:choose>
        <xsl:when test="$DayOfWeek = 0">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P7D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 1">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P1D') "/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 2">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P2D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 3">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P3D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 4">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P4D')"/>
	   </xsl:when>
	    <xsl:when test="$DayOfWeek = 5">
       <xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P5D')"/>
	   </xsl:when>
	   
	   <xsl:otherwise><xsl:value-of select="fn:current-date() - xs:dayTimeDuration('P6D')"/></xsl:otherwise>
</xsl:choose> 
     
	<!-- <xsl:value-of  select="fn:current-date() - xs:dayTimeDuration('P213D')"/>-->
	 </xsl:variable>

<xsl:variable name="Ind" select="fn:tokenize('1635 0687 0607 0617 0619 0621 0625 0632 0643 0645 0646 0664 0665 0670 0675 0678 0681 0682 0683 0688 0695 0697 0698 1041 1219 1602 1603 1633 1670 3384 6384 0648', '\s+')" />


  
<xsl:variable name="Cdate">
        <xsl:value-of select="concat(substring($Curdate,1,4),substring($Curdate,6,2),substring($Curdate,9,2))" />
     </xsl:variable>

<xsl:variable name="FEdate">
      <xsl:value-of select="concat(substring($EDayOfWeek,1,4),substring($EDayOfWeek,6,2),substring($EDayOfWeek,9,2))" />
      <!--<xsl:value-of select="'20190209'"/>-->
	 </xsl:variable>

<xsl:variable name="FSdate">
        <xsl:value-of select="concat(substring($SDayOfWeek,1,4),substring($SDayOfWeek,6,2),substring($SDayOfWeek,9,2))" />
    <!--<xsl:value-of select="'20190203'"/>-->
	 </xsl:variable>
	 <xsl:variable name="GLPdate">
      
    <xsl:value-of select="'20191229'"/>
	 </xsl:variable>
	
	<xsl:variable name="NEdate">
       <xsl:value-of select="normalize-space(concat(substring($EDayOfWeek,1,4),'-',substring($EDayOfWeek,6,2),'-',substring($EDayOfWeek,9,2),'T00:00:00'))" /> 
      <!--<xsl:value-of select="'2019-02-09T00:00:00'"/>-->
	 </xsl:variable>
	 <xsl:variable name="NSdate">
       <xsl:value-of select="normalize-space(concat(substring($SDayOfWeek,1,4),'-',substring($SDayOfWeek,6,2),'-',substring($SDayOfWeek,9,2),'T00:00:00'))" /> 
     <!-- <xsl:value-of select="'2019-02-03T00:00:00'"/>-->
	 </xsl:variable>
	 <xsl:variable name="SEEdate">
        <xsl:value-of select="concat(substring($EEdate,1,4),substring($EEdate,6,2),substring($EEdate,9,2)) "/>
     </xsl:variable> 
 
 	<xsl:variable name="list" select="fn:tokenize('501 502 503 504 505 513 514 515 519 522 523 563 539 HOL', '\s+')" />
 	 <xsl:template name="WeekType">
	   <xsl:param name="JDADateStrIN" />
  <xsl:choose>
        <xsl:when test="$JDADateStrIN &gt;$FEdate">F</xsl:when>
     <xsl:when test="$JDADateStrIN &lt;$FSdate">P</xsl:when>
	   <xsl:otherwise>C</xsl:otherwise>
	   </xsl:choose> 
  
  </xsl:template>
	
<xsl:template match="/">
	
	<JDAPAY>
	<OFFC>
	<xsl:for-each select="ns0:Insert/ns0:RECORDSET/ns0:PS_GEX_SMTRK_INRECORDINSERT">
 


 <xsl:variable name="OffStrDate">
       <xsl:call-template name="FormatDT">
                    <xsl:with-param name="DateTimeStr" select="ns0:PAY_END_DT"/>
                </xsl:call-template>
 </xsl:variable>
 <!--go live and parallel logic
 <xsl:variable name="OffStrDate2">
     <xsl:choose> 
     <xsl:when test="$OffStrDate &lt;$FSdate"><xsl:value-of select="$FEdate"/></xsl:when>
	   <xsl:otherwise><xsl:value-of select="$OffStrDate"/></xsl:otherwise>
	   </xsl:choose> 
 </xsl:variable> -->

  <xsl:variable name="DateNum">
       <xsl:call-template name="ChgDateToNum">
                    
                </xsl:call-template>
 </xsl:variable>

  <xsl:variable name="Wtype">
       <xsl:call-template name="WeekType">
                    <xsl:with-param name="JDADateStrIN" select="$OffStrDate"/>
                </xsl:call-template>
 </xsl:variable>
  <xsl:variable name="GLiveB">
        <xsl:choose>  
        <xsl:when test="$OffStrDate &gt;=$GLPdate">N</xsl:when>
          <xsl:otherwise>Y</xsl:otherwise>
	   </xsl:choose>      
 </xsl:variable>
 <Pay>
 


 
<xsl:if test="((
( (ns0:SEPCHK ='1') and (ns0:ERNCD =('502','505', '513', '514', '515', '519', '522', '523', '563', '501', '503', '504','539', 'HOL')) and (($Wtype='P') or($Wtype='F') ) and((ns0:REG_HRS)&gt;=0) ) or (
 (ns0:SEPCHK ='1') and (ns0:ERNCD =('512','610')))or ( (ns0:SEPCHK ='1') and (ns0:ERNCD =( '178','179','180','181')) and ($Wtype='F') )or 
 (
 (ns0:ERNCD =('502','505', '513', '514', '515', '519', '522', '523', '563', '501', '503', '504','539', 'HOL')) and ($Wtype='F')and (string-length(ns0:SEPCHK) =0))
 
 ) and ($GLiveB='N'))">

<Batch_ID>
<xsl:value-of select="concat(ns0:DEPTID_HOME,'-',$Cdate)"/>
</Batch_ID>

<action>
 <xsl:choose>
        <xsl:when test="(ns0:SEPCHK = '1') and (ns0:ERNCD =('512')) ">Bonus</xsl:when>
        
         <xsl:when test="ns0:ERNCD =( '502', '505', '513', '514', '515', '519', '522', '523', '563', '501', '503', '504','539', 'HOL') and ($Wtype='P')">Vacation/Time Off</xsl:when>
         <xsl:when test="(ns0:ERNCD =('501','503','504','HOL','513','515','519','522','523','502','514','539','178','179','181','180','563','505','178','179','180') and ($Wtype='F'))">Vacation Advance</xsl:when>

    
</xsl:choose>   
</action>




<emp> 

<xsl:value-of select="normalize-space(ns0:EMPLID)"/>
</emp>
<emprcd>
<xsl:choose>
        <xsl:when test="string-length(normalize-space(ns0:EMPLID)) = 8 ">
       <xsl:value-of select="substring (normalize-space(ns0:EMPLID),8,1)"/></xsl:when>
	   <xsl:otherwise>0</xsl:otherwise>
</xsl:choose> 

 </emprcd>
<erncd>		
		

	<xsl:choose>
	 <xsl:when test="( normalize-space(ns0:ERNCD) ='501' ) ">501A</xsl:when>
	 <xsl:when test="( normalize-space(ns0:ERNCD) ='502' ) ">502A</xsl:when>
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='503' ) ">503A</xsl:when>
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='505') ">505A</xsl:when>
	   <xsl:when test="( normalize-space(ns0:ERNCD) ='504') ">504A</xsl:when>
	 <xsl:when test="( normalize-space(ns0:ERNCD) ='513') ">513A</xsl:when>
	  <xsl:when test="( normalize-space(ns0:ERNCD) ='514' ) ">514A</xsl:when>
	   <xsl:when test="( normalize-space(ns0:ERNCD) ='515') ">515A</xsl:when>
	   <xsl:when test="( normalize-space(ns0:ERNCD) ='519') ">519A</xsl:when>
	   <xsl:when test="( normalize-space(ns0:ERNCD) ='522') ">522A</xsl:when>
	   	<xsl:when test="( normalize-space(ns0:ERNCD) ='523')">523A</xsl:when>
	   	<xsl:when test="( normalize-space(ns0:ERNCD) ='563')">563A</xsl:when>
		<xsl:when test="( normalize-space(ns0:ERNCD) ='HOL')">HOLA</xsl:when>
	
	 <xsl:otherwise>
	<xsl:value-of select="substring (ns0:ERNCD,1,3)"/>
	  </xsl:otherwise>
	 </xsl:choose>  
</erncd>
<jobcd><xsl:value-of select="normalize-space(ns0:JOBCODE)"/></jobcd>
<acccd><xsl:value-of select="concat('ACCT',normalize-space(ns0:ACCT_CD))"/></acccd>

<DID>
 <xsl:choose>
         <xsl:when test="normalize-space(ns0:DEPTID)='W018'">FRP</xsl:when>
		 <xsl:when test="normalize-space(ns0:DEPTID)='W012'">FRW</xsl:when>
		  <xsl:when test="normalize-space(ns0:DEPTID)='P099'">FPPA</xsl:when>
		 <xsl:when test="normalize-space(ns0:DEPTID)='P199'">FPYT</xsl:when>
		  <xsl:when test="normalize-space(ns0:DEPTID)='P299'">FPAK</xsl:when>
		 <xsl:when test="normalize-space(ns0:DEPTID)='P399'">FPMC</xsl:when>
		  <xsl:when test="normalize-space(ns0:DEPTID)='P499'">FPCO</xsl:when>
		   <xsl:when test="normalize-space(ns0:DEPTID)='M003'">FFM</xsl:when>
	<xsl:otherwise>
	<xsl:value-of select="ns0:DEPTID"/>
	  </xsl:otherwise>
		  </xsl:choose>

</DID>


	

<!-- change go lile and parallele -->
<PayStartDate><xsl:value-of select="ns0:PAY_BEGIN_DT"/>

	   </PayStartDate>
<PayEndDate>
  <xsl:choose>
	<xsl:when test="ns0:ERNCD =('512')"><xsl:value-of select="$NEdate"/></xsl:when>
	
	<xsl:when test="((ns0:ERNCD =('502', '505', '513', '514', '515', '519', '522', '523', '563', '501', '503', '504','512','539', 'HOL','178','179','180','181')) and ($Wtype='F' ))"><xsl:value-of select="ns0:PAY_END_DT"/></xsl:when>
	
	 <xsl:otherwise><xsl:value-of select="$NEdate"/></xsl:otherwise>
	 </xsl:choose> 
</PayEndDate>
		
		<amount>
		<xsl:choose>
          <xsl:when test="normalize-space(ns0:REG_HRS) ='0'"><xsl:value-of select="ns0:HOURLY_RT"/></xsl:when>
		
         <xsl:otherwise>0</xsl:otherwise>
       </xsl:choose>
		  </amount>
		 <HourlyRt>
		<xsl:value-of select="ns0:HOURLY_RT"/>
		 </HourlyRt>
		    <Hours>
		  
                   <xsl:value-of select="ns0:REG_HRS"/>
         
		  </Hours>
		  <SepCheck>	<xsl:value-of select="ns0:SEPCHK"/> </SepCheck>
		  <shift><xsl:value-of select="ns0:SHIFT"/></shift>
		  <category>Integration File Separate Check</category>  
		      
			<!--   <xsl:choose>
			   <xsl:when test="(ns0:ERNCD =('513','515','519','522','523','502','514','178','179','180','563','505') and ($OffStrDate  &gt; $FEdate))">Advanced Vacation</xsl:when>
	
	 
	 <xsl:otherwise>Regular</xsl:otherwise>
	 </xsl:choose> -->
			 
		  
		  
		  </xsl:if>
		  </Pay>
		
		  </xsl:for-each>
		</OFFC>
	 <ONC>
	 <xsl:for-each select="ns0:Insert/ns0:RECORDSET/ns0:PS_GEX_SMTRK_INRECORDINSERT">
<xsl:variable name="OnDate">
       <xsl:call-template name="FormatDT">
                    <xsl:with-param name="DateTimeStr" select="ns0:PAY_END_DT"/>
                </xsl:call-template>
 </xsl:variable>


  <!--go live and parallel logic -->
<!-- <xsl:variable name="OnDate2">
     <xsl:choose> 
     <xsl:when test="$OnDate &lt;$GLPdate"><xsl:value-of select="$FEdate"/></xsl:when>
	   <xsl:otherwise><xsl:value-of select="$OnDate"/></xsl:otherwise>
	   </xsl:choose> 
 </xsl:variable>-->

   <xsl:variable name="GLiveBON">
        <xsl:choose>  
        <xsl:when test="$OnDate &gt;=$GLPdate">N</xsl:when>
          <xsl:otherwise>Y</xsl:otherwise>
	   </xsl:choose>      
 </xsl:variable>

<!--   <xsl:variable name="OWtype">
       <xsl:call-template name="WeekType">
                    <xsl:with-param name="JDADateStrIN" select="$OnDate2"/>
                </xsl:call-template>
 </xsl:variable>-->
    <xsl:variable name="OWtype">
       <xsl:call-template name="WeekType">
                    <xsl:with-param name="JDADateStrIN" select="$OnDate"/>
                </xsl:call-template>
 </xsl:variable>
 <Pay>




<xsl:if test="
((((
((string(fn:index-of($Ind, normalize-space(ns0:DEPTID)))!='') and (string(fn:index-of($list, normalize-space(ns0:ERNCD)))!='') and ($OWtype =('C')))
or (string(fn:index-of($list, normalize-space(ns0:ERNCD)))=''))
and  ((string-length(normalize-space(ns0:SEPCHK)) =0)or ((string-length(normalize-space(ns0:SEPCHK)) =1 ) and (ns0:ERNCD ='REG')) or 
 
((string-length(normalize-space(ns0:SEPCHK)) =1 ) and (ns0:ERNCD =('178','179','180','181')) and 
(($OWtype='P') or($OWtype='C') ))
or( (string(fn:index-of($Ind, normalize-space(ns0:DEPTID)))!='') and (string(fn:index-of($list, normalize-space(ns0:ERNCD)))!='') and ($OWtype =('C')) and (string-length(normalize-space(ns0:SEPCHK)) =1 )))


) or ((string(fn:index-of($Ind, normalize-space(ns0:DEPTID)))!='') and (string(fn:index-of($list, normalize-space(ns0:ERNCD)))!='') and ($OWtype =('P' )) and (string-length(normalize-space(ns0:SEPCHK)) =0 ))
 or ((string(fn:index-of($Ind, normalize-space(ns0:DEPTID)))!='') and (string(fn:index-of($list, normalize-space(ns0:ERNCD)))!='') and ($OWtype =('F','P' )) and (string-length(normalize-space(ns0:SEPCHK)) =1 ) and ((ns0:REG_HRS)&lt;0))
)
or ($GLiveBON='Y')) ">

<Batch_ID>
<xsl:value-of select="concat(ns0:DEPTID_HOME,'-',$Cdate)"/>
</Batch_ID>
<action></action>
<emp> 

<xsl:value-of select="normalize-space(ns0:EMPLID)"/>
</emp>
<emprcd>
<xsl:choose>
        <xsl:when test="string-length(normalize-space(ns0:EMPLID)) = 8 ">
       <xsl:value-of select="substring (normalize-space(ns0:EMPLID),8,1)"/></xsl:when>
	   <xsl:otherwise>0</xsl:otherwise>
</xsl:choose> 

 </emprcd>
<erncd>	<xsl:value-of select="substring (ns0:ERNCD,1,3)"/></erncd>	
		
<jobcd><xsl:value-of select="normalize-space(ns0:JOBCODE)"/></jobcd>
<acccd><xsl:value-of select="concat('ACCT',normalize-space(ns0:ACCT_CD))"/></acccd>

<DID>
 <xsl:choose>
         <xsl:when test="normalize-space(ns0:DEPTID)='W018'">FRP</xsl:when>
		 <xsl:when test="normalize-space(ns0:DEPTID)='W012'">FRW</xsl:when>
		  <xsl:when test="normalize-space(ns0:DEPTID)='P099'">FPPA</xsl:when>
		 <xsl:when test="normalize-space(ns0:DEPTID)='P199'">FPYT</xsl:when>
		  <xsl:when test="normalize-space(ns0:DEPTID)='P299'">FPAK</xsl:when>
		 <xsl:when test="normalize-space(ns0:DEPTID)='P399'">FPMC</xsl:when>
		  <xsl:when test="normalize-space(ns0:DEPTID)='P499'">FPCO</xsl:when>
		   <xsl:when test="normalize-space(ns0:DEPTID)='M003'">FFM</xsl:when>
	<xsl:otherwise>
	<xsl:value-of select="ns0:DEPTID"/>
	  </xsl:otherwise>
		  </xsl:choose>

</DID>

	
	 <PayStartDate>
<xsl:choose><xsl:when test="($OWtype =('C'))"><xsl:value-of select="$NSdate"/></xsl:when>
<xsl:when test="($OWtype =('F') and (ns0:ERNCD =('502','505','512', '513', '514', '515', '519', '522', '523', '563', '501', '503', '504','178', '179', '180','181','610','539', 'HOL')) )"><xsl:value-of select="$NSdate"/></xsl:when>
	 <xsl:otherwise><xsl:value-of select="ns0:PAY_END_DT"/></xsl:otherwise>
	 </xsl:choose> </PayStartDate>
<PayEndDate>

  <xsl:choose>
	 
	
	<xsl:when test="($OWtype =('C'))"><xsl:value-of select="$NEdate"/></xsl:when>
	<xsl:when test="($OWtype =('F') and (ns0:ERNCD =('502','505','512', '513', '514', '515', '519', '522', '523', '563', '501', '503', '504','178', '179', '180','181','610','539', 'HOL')) )"><xsl:value-of select="$NEdate"/></xsl:when>
	 <xsl:otherwise><xsl:value-of select="ns0:PAY_END_DT"/></xsl:otherwise>
	 </xsl:choose> 
	</PayEndDate>	
	
	
	

 		
		<amount>
		

				      <xsl:choose>
          <xsl:when test="normalize-space(ns0:REG_HRS) ='0'"><xsl:value-of select="ns0:HOURLY_RT"/></xsl:when>
		
         <xsl:otherwise>0</xsl:otherwise>
       </xsl:choose>
		  </amount>
		  <HourlyRt>
		<xsl:value-of select="ns0:HOURLY_RT"/>
		 </HourlyRt>
		    <Hours>
		
                   <xsl:value-of select="ns0:REG_HRS"/>
         
		  </Hours>
		  <SepCheck>	<xsl:value-of select="ns0:SEPCHK"/></SepCheck>
		  <shift><xsl:value-of select="ns0:SHIFT"/></shift> 
		    <category></category>
		  </xsl:if>
		    
		  </Pay>
		
		  </xsl:for-each>
		</ONC>
</JDAPAY>


</xsl:template>
</xsl:stylesheet>