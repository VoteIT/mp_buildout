<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:myNS="http://voteit.se/printable"
				xmlns:AgendaItem="http://voteit.se/printable/AgendaItem"
				xmlns:DiscussionPost="http://voteit.se/printable/DiscussionPost"
				xmlns:Proposal="http://voteit.se/printable/Proposal"
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
						<xsl:value-of select="AgendaItem:title"/>
						<xsl:value-of select="$LB"/>
					</xsl:element>

					<xsl:element name="AgendaItemTag">
						<xsl:element name="AgendaItemTag_text">Motionens ID: </xsl:element>
						<xsl:value-of select="AgendaItem:hashtag"/>
						<xsl:value-of select="$LB"/>
					</xsl:element>
					<xsl:element name="Body">
						<xsl:value-of select="AgendaItem:body"/>
						<xsl:value-of select="$LB"/>
					</xsl:element>

					<xsl:element name="Endorsements">
						<xsl:element name="EndorsingUsers">
							<xsl:element name="EndorsingUsers_text">Stöds av:</xsl:element>
							<xsl:value-of select="$LB"/>

							<xsl:for-each select="myNS:AgendaItem:endorsements/myNS:AgendaItem:endorsing_user">
								<xsl:value-of select="current()"/>
								<xsl:value-of select="$LB"/>

							</xsl:for-each>
						</xsl:element>
						<xsl:element name="EndorsementText">
							<xsl:value-of select="AgendaItem:endorsements_text"/>
							<xsl:value-of select="$LB"/>
						</xsl:element>
					</xsl:element>

					<xsl:element name="Proposals">
						<xsl:element name="Proposals_heading">Förslag</xsl:element>
						<xsl:value-of select="$LB"/>

						<xsl:for-each select="myNS:AgendaItem/myNS:Proposal">
							---

							<xsl:element name="Proposal_creator">
								<xsl:value-of select="Proposal:creator"/>
								<xsl:value-of select="$LB"/>
							</xsl:element>

							<xsl:element name="Proposal_text">
								<xsl:value-of select="Proposal:text"/>
								<xsl:value-of select="$LB"/>
							</xsl:element>

							<xsl:element name="Proposal_aid">
								FörslagsID:
								#<xsl:value-of select="Proposal:aid"/>
								<xsl:value-of select="$LB"/>
							</xsl:element>

						</xsl:for-each>
					</xsl:element>

					<xsl:element name="DiscussionPosts">
						<xsl:element name="DiscussionPosts_heading">Yttranden</xsl:element>
						<xsl:value-of select="$LB"/>

						<xsl:for-each select="myNS:AgendaItem/myNS:DiscussionPost">
							---

							<xsl:element name="DiscussionPost_creator">
								<xsl:value-of select="DiscussionPost:creator"/>
								<xsl:value-of select="$LB"/>
							</xsl:element>

							<xsl:element name="DiscussionPost_text">
								<xsl:value-of select="DiscussionPost:text"/>
								<xsl:value-of select="$LB"/>
							</xsl:element>

						</xsl:for-each>
					</xsl:element>

				</xsl:element>
			</xsl:for-each>

		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
