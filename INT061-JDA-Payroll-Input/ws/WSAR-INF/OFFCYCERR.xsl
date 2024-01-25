<?xml version='1.0'?>
<xsl:stylesheet version="2.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wd="urn:com.workday/bsvc">

<xsl:output method="xml"  omit-xml-declaration="yes"/>
<xsl:template match="/">
<file>
	<xsl:for-each select="env:Envelope/env:Body/wd:Get_Import_Process_Messages_Response/wd:Response_Data/wd:Import_Process_Message">
<error>
<xsl:value-of select="replace (wd:Import_Process_Message_Data/wd:Message_Summary/text(),',',' ')"/></error>
	
	</xsl:for-each>
	</file>

</xsl:template>




</xsl:stylesheet>