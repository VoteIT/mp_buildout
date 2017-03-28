<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:myNS="http://voteit.se/printable"
				version="1.0">
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

			<xsl:for-each select="myNS:Root/myNS:AgendaItem">
				<xsl:element name="AgendaItem">
					<xsl:element name="Title">
						<xsl:value-of select="myNS:AgendaItem_title"/>
						<xsl:value-of select="$LB"/>
					</xsl:element>

					<xsl:element name="Ruta">
						<xsl:text>Bifall [ ]   Avslag [ ]   Besvarad [ ]</xsl:text>
						<xsl:value-of select="$LB"/>
					</xsl:element>

					<xsl:element name="MotionCreator">
						<xsl:element name="AgendaItem_motion_creator_text">Inskickad av: </xsl:element>
						<xsl:value-of select="myNS:AgendaItem_motion_creator"/>
						<xsl:value-of select="$LB"/>
					</xsl:element>

					<xsl:element name="Endorsements">
						<xsl:element name="EndorsingUsers">
							<xsl:element name="EndorsingUsers_text">Stöds av: </xsl:element>
							<xsl:for-each select="myNS:AgendaItem_endorsements/myNS:AgendaItem_endorsing_user">
								<xsl:value-of select="current()"/>
								<xsl:if test="position()!=last()">
									<xsl:value-of select="$COMMA"/>
									<xsl:value-of select="$SPACE"/>
								</xsl:if>
							</xsl:for-each>
							<xsl:value-of select="$LB"/>
						</xsl:element>
						<xsl:element name="EndorsementText">
							<xsl:value-of select="myNS:AgendaItem_endorsements_text"/>
							<xsl:value-of select="$LB"/>
						</xsl:element>
					</xsl:element>

					<xsl:element name="Body">
						<xsl:value-of select="$LB"/>
						<xsl:value-of select="myNS:AgendaItem_body"/>
						<xsl:value-of select="$LB"/>
						<xsl:value-of select="$LB"/>
					</xsl:element>

					<xsl:element name="Proposals">
						<xsl:for-each select="myNS:Proposals/myNS:Proposal">

							<xsl:element name="Proposal_text">
								<xsl:element name="Proposal_aid">
									<xsl:value-of select="myNS:Proposal_aid"/>
									<xsl:text>. </xsl:text>
								</xsl:element>
								<xsl:value-of select="myNS:Proposal_text"/>
								<xsl:value-of select="$LB"/>
							</xsl:element>

						</xsl:for-each>
					</xsl:element>

					<xsl:element name="DiscussionPosts">
						<xsl:for-each select="myNS:DiscussionPosts/myNS:DiscussionPost">

							<xsl:element name="DiscussionPost_text">
								<xsl:value-of select="myNS:DiscussionPost_text"/>
								<xsl:value-of select="$LB"/>
								<xsl:value-of select="$LB"/>
							</xsl:element>

						</xsl:for-each>
					</xsl:element>

				</xsl:element>
			</xsl:for-each>

		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
