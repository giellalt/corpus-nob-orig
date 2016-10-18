<?xml version='1.0' encoding='UTF-8'?>
<!-- Format query results for display --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i18n="http://apache.org/cocoon/i18n/2.1" version="1.0">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" doctype-public="-//UIT//DTD Corpus V1.0//EN" doctype-system="http://giellatekno.uit.no/dtd/corpus.dtd"/>

    <!-- Add the metainformation manually -->
    <!-- variable filename contains the original name of the file (from submitter)-->
    <xsl:variable name="filename" select="'http://samediggi.no/content/download/4629/42654/version/4/file/Sametingets+budsjett+2014+-+norsk.pdf'"/>
    <xsl:variable name="text_encoding" select="''"/>
    <xsl:variable name="title" select="''"/>
    <xsl:variable name="author1_fn" select="''"/>
    <xsl:variable name="author1_ln" select="''"/>
    <xsl:variable name="author1_gender" select="'unknown'"/>
    <xsl:variable name="author1_nat" select="''"/>
    <xsl:variable name="author1_born" select="''"/>
    <xsl:variable name="author2_fn" select="''"/>
    <xsl:variable name="author2_ln" select="''"/>
    <xsl:variable name="author2_gender" select="'unknown'"/>
    <xsl:variable name="author2_nat" select="''"/>
    <xsl:variable name="author2_born" select="''"/>
    <xsl:variable name="author3_fn" select="''"/>
    <xsl:variable name="author3_ln" select="''"/>
    <xsl:variable name="author3_gender" select="'unknown'"/>
    <xsl:variable name="author3_nat" select="''"/>
    <xsl:variable name="author3_born" select="''"/>
    <xsl:variable name="author4_fn" select="''"/>
    <xsl:variable name="author4_ln" select="''"/>
    <xsl:variable name="author4_gender" select="'unknown'"/>
    <xsl:variable name="author4_nat" select="''"/>
    <xsl:variable name="author4_born" select="''"/>
    <xsl:variable name="publisher" select="''"/>
    <xsl:variable name="publChannel" select="''"/>
    <xsl:variable name="year" select="''"/>
    <xsl:variable name="ISBN" select="''"/>
    <xsl:variable name="ISSN" select="''"/>
    <xsl:variable name="place" select="''"/>
    <xsl:variable name="genre" select="'admin'"/>
    <xsl:variable name="collection" select="''"/>
    <xsl:variable name="translated_from" select="''"/>
    <xsl:variable name="translator_fn" select="''"/>
    <xsl:variable name="translator_ln" select="''"/>
    <xsl:variable name="translator_gender" select="'unknown'"/>
    <xsl:variable name="translator_born" select="''"/>
    <xsl:variable name="translator_nat" select="''"/>
    <!-- select license type: free, standard or other -->
    <xsl:variable name="license_type" select="''"/>
    <xsl:variable name="sub_name" select="''"/>
    <xsl:variable name="sub_email" select="''"/>
    <xsl:variable name="wordcount" select="''"/>
    <!-- Set this variable to 1 if the source for this doc is OCR -->
    <!-- Those docs typically contain lots of orthographic errors and need special treatment -->
    <xsl:variable name="conversion_status" select="'standard'"/>
    <xsl:variable name="metadata" select="'uncomplete'"/>
    <xsl:variable name="template_version" select="'$Revision$'"/>
    <xsl:variable name="current_version" select="'Revision'"/>
    <!-- Free text field for notes -->
    <xsl:variable name="note" select="''"/>

    <!-- The main language of the document -->
    <xsl:variable name="mainlang" select="'nob'"/>

    <!-- In the case of a multilingual document, we may want to check for
         other languages. Set the variable monolingual to '1' to turn off
         language recognition (treating everything as mainlang) -->
    <xsl:variable name="monolingual" select="''"/>

    <!-- If monolingual is not set, the document is multilingual.
         Uncomment the languages you want to check for (or add new lines
         with the right ISO-639-3 language codes).

         If *no* languages are uncommented (and monolingual is not 1),
         then the document is checked for all supported languages.
         -->
    <xsl:variable name="mlangs">
        <!-- <language xml:lang="dan"/> -->
        <!-- <language xml:lang="eng"/> -->
        <!-- <language xml:lang="fin"/> -->
        <!-- <language xml:lang="fit"/> -->
        <!-- <language xml:lang="fkv"/> -->
        <!-- <language xml:lang="ger"/> -->
        <!-- <language xml:lang="isl"/> -->
        <!-- <language xml:lang="kal"/> -->
        <!-- <language xml:lang="kpv"/> -->
        <!-- <language xml:lang="nno"/> -->
        <!-- <language xml:lang="nob"/> -->
        <!-- <language xml:lang="rus"/> -->
        <!-- <language xml:lang="sma"/> -->
        <!-- <language xml:lang="sme"/> -->
        <!-- <language xml:lang="smj"/> -->
        <!-- <language xml:lang="smn"/> -->
        <!-- <language xml:lang="sms"/> -->
        <!-- <language xml:lang="swe"/> -->
    </xsl:variable>

    <!-- If the document has parallel texts, uncomment the right languages
         (or add new lines with the right ISO-639-3 language codes) and
         add the filename of the parallel files to the 'location'
         variables.

         Don't write the full directory; we expect the file to be in the
         same directory as this file, with only the language code and
         filename changed.
        -->
    <xsl:variable name="parallels">
        <!-- <parallel_text xml:lang="dan" location=""/> -->
        <!-- <parallel_text xml:lang="eng" location=""/> -->
        <!-- <parallel_text xml:lang="fin" location=""/> -->
        <!-- <parallel_text xml:lang="fit" location=""/> -->
        <!-- <parallel_text xml:lang="fkv" location=""/> -->
        <!-- <parallel_text xml:lang="ger" location=""/> -->
        <!-- <parallel_text xml:lang="isl" location=""/> -->
        <!-- <parallel_text xml:lang="kal" location=""/> -->
        <!-- <parallel_text xml:lang="kpv" location=""/> -->
        <!-- <parallel_text xml:lang="nno" location=""/> -->
        <!-- <parallel_text xml:lang="nob" location=""/> -->
        <!-- <parallel_text xml:lang="rus" location=""/> -->
        <!-- <parallel_text xml:lang="sma" location=""/> -->
        <!-- <parallel_text xml:lang="sme" location=""/> -->
        <!-- <parallel_text xml:lang="smj" location=""/> -->
        <!-- <parallel_text xml:lang="smn" location=""/> -->
        <!-- <parallel_text xml:lang="sms" location=""/> -->
        <!-- <parallel_text xml:lang="swe" location=""/> -->
    <parallel_text location="sametingets_budsjett_2014_-_nordsamisk.pdf" xml:lang="sme"/>
</xsl:variable>


    <!--
        For pdf documents, mark which pages should be ignored.
        The format for this is a comma separated list of page number that
        should be skipped. It is also possible to use ranges.
        Examples:
        1, 2, 3, 4
        1, 6-10, 15, 20, 25-30
    -->
    <xsl:variable name="skip_pages" select="'1-8,115,116,132'"/>

    <!--
        Text outside these margins will be ignored.

        The format for margin line is:
        [all|odd|even|pagenumber]=integer

        Margin lines *must* contain the keywords all, even, odd or a page
        number followed by a = sign and an integer. Pages with the same margin
        may be separated with ;.

        The integer must be between 0 and 100.

        If there are several values, they are divided by commas.
        Setting different margins for odd and even pages is done by writing
        e.g. odd=8, even=15
        It is also possible to set margins for particular pages:
        8=8, 10=12
        It is also possible to set margins for odd and even pages and
        exceptions from those rules on particular pages.

        Examples on how the select part could look:
        odd=5, even=8, 8=15, 11=3
        all=9, 8=12
        1;3;8=20, 4;5;7=10
    -->
    <xsl:variable name="right_margin" select="''"/>
    <xsl:variable name="left_margin" select="''"/>
    <xsl:variable name="top_margin" select="'28=24,30=23,32=62,35=46,42=41,43=24,50=53,52=24,57=35,69=25,70=22,71=22,76=22,79=23,85=48,111=25,114=22,118=22,120=33,122=53,123=22'"/>
    <xsl:variable name="bottom_margin" select="'17=52,29=26,35=26,64=26,66=22,68=33,71=30,88=23,95=24,106=21,110=41,111=60,114=70,117=30'"/>

    <xsl:variable name="inner_right_margin" select="'16=0,18=0,22=0,23=0,25=0,26=0,27=0,28=0,29=0,30=0,31=0,33=0,38=0,40=0,44=0,45=0,46=0,47=0,48=0,51=0,52=0,53=0,54=0,55=0,56=0,60=0,61=0,67=0,72=0,74=0,77=0,78=0,80=0,81=0,84=0,89=0,90=0,97=0,99=0,100=0,103=0,104=0,106=0,108=0,112=0,119=0,120=0,121=0,122=0,123=0,124=0,126=0,128=0,129=0,130=0'"/>
    <xsl:variable name="inner_left_margin" select="'16=0,18=0,22=0,23=0,25=0,26=0,27=0,28=0,29=0,30=0,31=0,33=0,38=0,40=0,44=0,45=0,46=0,47=0,48=0,51=0,52=0,53=0,54=0,55=0,56=0,60=0,61=0,67=0,72=0,74=0,77=0,78=0,80=0,81=0,84=0,89=0,90=0,97=0,99=0,100=0,103=0,104=0,106=0,108=0,112=0,119=0,120=0,121=0,122=0,123=0,124=0,126=0,128=0,129=0,130=0'"/>
    <xsl:variable name="inner_top_margin" select="'16=42,18=14,22=53,23=59,25=22,26=33,27=35,28=70,29=43,30=62,31=11,33=49,38=14,40=55,44=18,45=35,46=14,47=51,48=11,51=40,52=30,53=13,54=39,55=58,56=16,60=22,61=11,67=51,72=59,74=69,77=59,78=41,80=38,81=11,84=45,89=44,90=52,97=66,99=28,100=21,103=14,104=11,106=50,108=32,112=21,119=41,120=58,121=23,122=63,123=41,124=14,126=11,128=14,129=14,130=33'"/>
    <xsl:variable name="inner_bottom_margin" select="'16=28,18=55,22=32,23=28,25=28,26=52,27=49,28=14,29=43,30=24,31=74,33=38,38=65,40=24,44=42,45=50,46=57,47=22,48=32,51=18,52=58,53=30,54=36,55=30,56=73,60=63,61=73,67=22,72=27,74=15,77=18,78=45,80=51,81=67,84=42,89=43,90=34,97=20,99=59,100=65,103=69,104=77,106=36,108=21,112=65,119=47,120=22,121=26,122=27,123=29,124=38,126=65,128=74,129=48,130=27'"/>

    <!-- Add all paragraphs that should have xml:lang=X           -->
    <!-- Uncomment the following and add the paths, for example:  -->
    <!-- <xsl:template match="/root/section[2]/paragraph[5] |
                        /root/section[3]/paragraph[2] ">        -->
    <!--
    <xsl:template match="//body/p[5]">
            <xsl:element name="p">
            <xsl:attribute name="xml:lang">sme</xsl:attribute>
            <xsl:apply-templates/>
    </xsl:element>
    </xsl:template>
    -->

    <!-- Change or remove problematic characters from the text.   -->
    <!-- Specify the elements to match (here all p's within       -->
    <!-- //body, that do contain text, but do NOT contain em and  -->
    <!-- span elements), and specify the characters               -->
    <!-- to be replaced and the replacements. If needed,          -->
    <!-- copy this template and target several different elements,-->
    <!-- but don't make several templates that match the same set -->
    <!-- of elements - then only one of them will apply. Also try -->
    <!-- to restrict the template to nodes that do not contain    -->
    <!-- other markup, as such markup otherwise will be removed.  -->
    <!--
    <xsl:template match="p[parent::body][not(./em | ./span)][text()]">
        <xsl:variable name="text" select='current()' />
        <xsl:variable name="type" select='@type' />
        <xsl:variable name="lang" select='@xml:lang' />
        <xsl:element name="p">
            <xsl:if test="$type">
                <xsl:attribute name="type">
                    <xsl:value-of select="$type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="$lang">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="$lang"/>
                </xsl:attribute>
            </xsl:if>

            <xsl:call-template name="globalTextReplace">
                <xsl:with-param name="inputString" select="$text"/>
                <xsl:with-param name="target" select="'str1/str2/str3/'"/>
                <xsl:with-param name="replacement" select="'rpl1/rpl2/rpl3/'"/>
                <xsl:with-param name="continue" select="0"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>
    -->

</xsl:stylesheet>
