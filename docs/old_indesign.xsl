<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:myNS="http://www.filemaker.com/fmpdsoresult" version="1.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no"/>
	<xsl:variable name="LB">
		<xsl:text>&#13;</xsl:text>
	</xsl:variable>
	<xsl:variable name="TAB">
		<xsl:text>	</xsl:text>
	</xsl:variable>
	<xsl:variable name="SPACE">
		<xsl:text>&#32;</xsl:text>
	</xsl:variable>
	<xsl:variable name="COMMA">
		<xsl:text>&#44;</xsl:text>
	</xsl:variable>
	<xsl:template match="/">
		<xsl:element name="Root">
			<xsl:element name="Motioner">
				<!-- Motioner -->
				<xsl:for-each select="myNS:FMPDSORESULT/myNS:ROW">
					<!-- Varje motion -->
					<xsl:element name="Motion">
						<!-- Rubrik -->
						<xsl:element name="Rubrik">
							<xsl:value-of select="myNS:xml_motionsrubrik"/>
						</xsl:element>
						<!-- Motionsnr -->
						<xsl:element name="Motionsnr">
							<xsl:value-of select="myNS:xml_motionnr"/>
						</xsl:element>
						<!-- Motionärer -->
						<xsl:element name="Motionärer">
							<xsl:value-of select="myNS:xml_motionärer"/>
							<xsl:value-of select="$LB"/>
							<xsl:value-of select="$LB"/>
						</xsl:element>
						<!-- Stöd -->
						<xsl:if test="myNS:xml_stöd != '' ">
							<xsl:element name="Stöd">
								<xsl:value-of select="myNS:xml_stöd"/>
								<xsl:value-of select="$LB"/>
							</xsl:element>
						</xsl:if>
						<!-- Motionstext -->
						<xsl:element name="Motionstext">
							<xsl:value-of select="myNS:xml_motionstext"/>
						</xsl:element>

						<!-- Attsatser -->
						<xsl:element name="Attsatser">
							<xsl:for-each select="myNS:xml_attsats/myNS:DATA">
								<!-- Attsats -->
								<xsl:element name="Attsats">
									<xsl:value-of select="current()"/>
								</xsl:element>
							</xsl:for-each>
							<xsl:value-of select="$LB"/>
						</xsl:element>
						<!-- psYttrande -->
						<xsl:if test="myNS:xml_psYttrande !=  '' ">
							<xsl:element name="Yttrande_lbl">Partistyrelsens yttrande</xsl:element>
							<xsl:element name="Yttrande">
								<xsl:value-of select="$LB"/>
								<xsl:value-of select="myNS:xml_psYttrande"/>
								<xsl:value-of select="$LB"/>
								<xsl:value-of select="$LB"/>
							</xsl:element>
						</xsl:if>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
