<?xml version='1.0' encoding='UTF-8'?>
<!-- Format query results for display --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i18n="http://apache.org/cocoon/i18n/2.1" version="1.0">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" doctype-public="-//UIT//DTD Corpus V1.0//EN" doctype-system="http://giellatekno.uit.no/dtd/corpus.dtd"/>

    <!-- Add the metainformation manually -->
    <!-- variable filename contains the original name of the file (from submitter)-->
    <xsl:variable name="filename" select="'http://samediggi.no/content/download/914/8853/version/2/file/Sametingets+budsjett+2012.pdf'"/>
    <xsl:variable name="text_encoding" select="''"/>
    <xsl:variable name="title" select="'Sametingets budsjett 2012'"/>
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
    <xsl:variable name="year" select="'2011'"/>
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
    <xsl:variable name="license_type" select="'free'"/>
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
    <parallel_text location="sa_medikki_2012_bua_eahtta.pdf" xml:lang="sme"/>
</xsl:variable>


    <!--
        For pdf documents, mark which pages should be ignored.
        The format for this is a comma separated list of page number that
        should be skipped. It is also possible to use ranges.
        Examples:
        1, 2, 3, 4
        1, 6-10, 15, 20, 25-30
    -->
    <xsl:variable name="skip_pages" select="'1-9,149-151'"/>
        
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
    <xsl:variable name="top_margin" select="'23=30,25=74,27=29,30=21,35=22,36=21,37=39,40=45,41=21,45=20,51=21,61=26,69=23,71=28,76=20,80=21,83=24,89=48,90=25'"/>
    <xsl:variable name="bottom_margin" select="'13=63,17=21,20=30,22=34,27=29,30=50,32=26,40=25,43=23,52=35,57=26,60=30,64=30,68=31,77=35,79=20,86=21'"/>

    <xsl:variable name="inner_right_margin" select="'12=0,14=0,18=0,19=0,20=0,21=0,22=0,26=0,28=0,29=0,31=0,32=0,33=0,34=0,36=0,41=0,42=0,43=0,44=0,45=0,46=0,47=0,49=0,50=0,51=0,53=0,54=0,56=0,58=0,59=0,62=0,63=0,64=0,66=0,67=0,69=0,70=0,71=0,73=0,74=0,75=0,76=0,80=0,81=0,82=0,83=0,84=0,85=0,86=0,87=0,88=0,89=0,90=0,91=0,92=0,95=0'"/>
    <xsl:variable name="inner_left_margin" select="'12=0,14=0,18=0,19=0,20=0,21=0,22=0,26=0,28=0,29=0,31=0,32=0,33=0,34=0,36=0,41=0,42=0,43=0,44=0,45=0,46=0,47=0,49=0,50=0,51=0,53=0,54=0,56=0,58=0,59=0,62=0,63=0,64=0,66=0,67=0,69=0,70=0,71=0,73=0,74=0,75=0,76=0,80=0,81=0,82=0,83=0,84=0,85=0,86=0,87=0,88=0,89=0,90=0,91=0,92=0,95=0'"/>
    <xsl:variable name="inner_top_margin" select="'12=17,14=14,18=25,19=22,20=11,21=19,22=17,26=26,28=42,29=18,31=35,32=17,33=48,34=17,36=61,41=52,42=46,43=21,44=24,45=70,46=41,47=17,49=44,50=33,51=35,53=47,54=40,56=11,58=11,59=21,62=35,63=49,64=17,66=17,67=55,69=56,70=31,71=71,73=11,74=10,75=21,76=53,80=47,81=11,82=38,83=60,84=21,85=13,86=36,87=30,88=18,89=60,90=55,91=11,92=13,95=13'"/>
    <xsl:variable name="inner_bottom_margin" select="'12=63,14=36,18=37,19=58,20=63,21=67,22=44,26=48,28=31,29=54,31=49,32=70,33=39,34=69,36=23,41=14,42=42,43=68,44=44,45=17,46=45,47=55,49=41,50=53,51=48,53=43,54=50,56=64,58=79,59=69,62=51,63=41,64=74,66=50,67=37,69=30,70=45,71=18,73=58,74=80,75=46,76=35,80=43,81=77,82=37,83=30,84=69,85=31,86=53,87=22,88=70,89=30,90=33,91=78,92=54,95=73'"/>


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