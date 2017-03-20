<?xml version='1.0' encoding='UTF-8'?>
<!-- Format query results for display --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i18n="http://apache.org/cocoon/i18n/2.1" version="1.0">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" doctype-public="-//UIT//DTD Corpus V1.0//EN" doctype-system="http://giellatekno.uit.no/dtd/corpus.dtd"/>

    <!-- Add the metainformation manually -->

    <!--
        The original name of the file that comes from the
        submitter of the document or the URL where the document has been fetched.
        These days it is automatically added by the add_files_to_corpus tool.
        http://divvun.no/doc/ling/CorpusTools.html#add_files_to_corpus
    -->
    <xsl:variable name="filename" select="'http://samediggi.no/content/download/6590/60881/version/1/file/Sametingets+budsjett+2015+-+Vedtatt+5.12.2014+-+norsk.pdf'"/>
    <xsl:variable name="text_encoding" select="''"/>
    <xsl:variable name="title" select="'Sametingets budsjett 2015'"/>
    <!--
        Information of the first author: first name, last name,
        date or year of birth, nationality.
    -->
    <xsl:variable name="author1_fn" select="''"/>
    <xsl:variable name="author1_ln" select="''"/>
    <!-- m, f or unknown -->
    <xsl:variable name="author1_gender" select="'unknown'"/>
    <!--
        The country where the author is from. It should be written as
        an ISO_3166-1 code.
        https://no.wikipedia.org/wiki/ISO_3166-1
    -->
    <xsl:variable name="author1_nat" select="''"/>
    <!-- Either YYYY or YYYYMMDD. Examples: 1954 or 19451224 -->
    <xsl:variable name="author1_born" select="''"/>
    <!--
        Information of the second author: first name, last name,
        date or year of birth, nationality.
    -->
    <xsl:variable name="author2_fn" select="''"/>
    <xsl:variable name="author2_ln" select="''"/>
    <xsl:variable name="author2_gender" select="'unknown'"/>
    <xsl:variable name="author2_nat" select="''"/>
    <xsl:variable name="author2_born" select="''"/>

    <!--
        Information of the third author: first name, last name,
        date or year of birth, nationality.
    -->
    <xsl:variable name="author3_fn" select="''"/>
    <xsl:variable name="author3_ln" select="''"/>
    <xsl:variable name="author3_gender" select="'unknown'"/>
    <xsl:variable name="author3_nat" select="''"/>
    <xsl:variable name="author3_born" select="''"/>

    <!--
        Information of the fourth author: first name, last name,
        date or year of birth, nationality.
    -->
    <xsl:variable name="author4_fn" select="''"/>
    <xsl:variable name="author4_ln" select="''"/>
    <xsl:variable name="author4_gender" select="'unknown'"/>
    <xsl:variable name="author4_nat" select="''"/>
    <xsl:variable name="author4_born" select="''"/>

    <!--
        Information of the fourth author: first name, last name,
        date or year of birth, nationality.
    -->
    <xsl:variable name="author5_fn" select="''"/>
    <xsl:variable name="author5_ln" select="''"/>
    <xsl:variable name="author5_gender" select="'unknown'"/>
    <xsl:variable name="author5_nat" select="''"/>
    <xsl:variable name="author5_born" select="''"/>

    <xsl:variable name="publisher" select="''"/>
    <!-- The values are either: published or unpublished -->
    <xsl:variable name="publChannel" select="''"/>
    <!-- Publication year -->
    <xsl:variable name="year" select="'2014'"/>
    <xsl:variable name="ISBN" select="''"/>
    <xsl:variable name="ISSN" select="''"/>
    <xsl:variable name="place" select="''"/>

    <!-- Automatically filled in by CorpusTools -->
    <xsl:variable name="genre" select="'admin'"/>
    <xsl:variable name="collection" select="''"/>
    <!--
        Three letter language code.
        https://no.wikipedia.org/wiki/Liste_over_ISO_639-1-koder
    -->
    <xsl:variable name="translated_from" select="''"/>
    <!-- Translator variables have the same format as the author ones -->
    <xsl:variable name="translator_fn" select="''"/>
    <xsl:variable name="translator_ln" select="''"/>
    <xsl:variable name="translator_gender" select="'unknown'"/>
    <xsl:variable name="translator_born" select="''"/>
    <xsl:variable name="translator_nat" select="''"/>
    <!-- select license type: free, standard or other -->
    <xsl:variable name="license_type" select="'free'"/>
    <!-- The name and email of the submitter -->
    <xsl:variable name="sub_name" select="''"/>
    <xsl:variable name="sub_email" select="''"/>
    <!-- Keep empty, this is automatically filled in by CorpusTools -->
    <xsl:variable name="wordcount" select="''"/>
    <!-- This variable can have the following values:
        * ocr:          ocr'ed document, should usually not be converted
        * goldstandard: part of the goldstandard corpus, should not be converted
        * correct:      a goldstandard document containing corrected typos,
        * image:        documents consisting of images, should be possible to
                        ocr, then do conversion on it
        * standard:     a usual doc, meant to be used as part of the standard corpus
        * unsupported:  document that cannot be converted by our conversion tools
    -->
    <xsl:variable name="conversion_status" select="'standard'"/>
    <!-- Valid values are complete and uncomplete -->
    <xsl:variable name="metadata" select="'uncomplete'"/>
    <!-- Automatically filled in by CorpusTools -->
    <xsl:variable name="template_version" select="'$Revision$'"/>
    <!-- Automatically filled in by CorpusTools -->
    <xsl:variable name="current_version" select="'Revision'"/>
    <!-- Free text field for notes -->
    <xsl:variable name="note" select="''"/>

    <!-- Automatically filled in by CorpusTools -->
    <xsl:variable name="mainlang" select="'nob'"/>

    <!--
        In the case of a multilingual document, we may want to check for
        other languages. Set the variable monolingual to '1' to turn off
        language recognition (treating everything as mainlang)
    -->
    <xsl:variable name="monolingual" select="''"/>

    <!--
        If monolingual is not set, the document is multilingual.
        Uncomment the languages you want to check for (or add new lines
        with the right ISO-639-3 language codes).

        If *no* languages are uncommented (and monolingual is not 1),
        then the document is checked for all supported languages.
    -->
    <xsl:variable name="mlangs">
        <!-- <language xml:lang="dan"/> -->
    </xsl:variable>

    <!--
        This is automatically added by add_files_to_corpus if a parallel file
        is given on the command line when a document is added to the corpus.

        If manually correcting these values:
        If the document has parallel texts, uncomment the correct languages
        (or add new lines with the correct ISO-639-3 language codes) and
        add the filename of the parallel files to the 'location'
        variables.

        Don't write the full directory; we expect the file to be in the
        parallel directory of this file, with only the language code and
        filename changed.
    -->
    <xsl:variable name="parallels">
        <parallel_text xml:lang="dan" location=""/>
        <parallel_text xml:lang="eng" location=""/>
        <parallel_text xml:lang="fin" location=""/>
        <parallel_text xml:lang="fit" location=""/>
        <parallel_text xml:lang="fkv" location=""/>
        <parallel_text xml:lang="ger" location=""/>
        <parallel_text xml:lang="isl" location=""/>
        <parallel_text xml:lang="kal" location=""/>
        <parallel_text xml:lang="kpv" location=""/>
        <parallel_text xml:lang="nno" location=""/>
        <parallel_text xml:lang="nob" location=""/>
        <parallel_text xml:lang="rus" location=""/>
        <parallel_text xml:lang="sma" location=""/>
        <parallel_text xml:lang="sme" location="sametingets_budsjett_2015_-_vedtatt_5.12.2014_-_nordsamisk.pdf"/>
        <parallel_text xml:lang="smj" location=""/>
        <parallel_text xml:lang="smn" location=""/>
        <parallel_text xml:lang="sms" location=""/>
        <parallel_text xml:lang="swe" location=""/>
    </xsl:variable>

    <!--
        For pdf documents, mark which pages should be ignored.
        The format for this is a comma separated list of page numbers
        that should be skipped. It is also possible to use ranges.
        Examples:
        1, 2, 3, 4
        1, 6-10, 15, 20, 25-30
    -->
    <xsl:variable name="skip_pages" select="'1-8,67,121,122,142'"/>

    <!--
        For txt documents, mark which lines should be ignored.
        The format for this is a comma separated list of line numbers
        that should be skipped. It is also possible to use ranges.
        Examples:
        1, 2, 3, 4
        1, 6-10, 15, 20, 25-30
    -->
    <xsl:variable name="skip_lines" select="''"/>

    <!--
        Margin of a page in a pdf document expressed as a percentage of
        the page width and height.

        The default for all margins are 7

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
    <xsl:variable name="top_margin" select="'21=20,33=46,40=35,45=24,46=38,50=60,52=22,57=38,62=34,63=24,66=24,70=41,76=23,81=27,82=21,88=23,94=13,95=30,116=25,119=45,124=21,126=21,132=26'"/>
    <xsl:variable name="bottom_margin" select="'14=89,19=32,25=22,29=25,46=39,53=27,58=75,89=27,90=73,93=32,119=27,120=30,126=51,127=31,129=42'"/>

    <!--
        Cut out a part from a page in pdf documents. Has the same format
        as *_margin above. For a given page, all four margins
        must be defined.
    -->
    <xsl:variable name="inner_right_margin" select="'13=0,15=0,22=0,24=0,26=0,27=0,29=0,30=0,31=0,34=0,37=0,41=0,42=0,43=0,44=0,47=0,48=0,51=0,52=0,53=0,54=0,55=0,56=0,57=0,60=0,62=0,63=0,64=0,65=0,66=0,69=0,71=0,72=0,73=0,74=0,75=0,78=0,79=0,82=0,83=0,84=0,87=0,92=0,93=0,102=0,104=0,105=0,107=0,108=0,111=0,112=0,113=0,114=0,115=0,116=0,117=0,118=0,123=0,124=0,128=0,129=0,131=0,132=0,133=0,134=0,136=0,138=0,139=0,140=0'"/>
    <xsl:variable name="inner_left_margin" select="'13=0,15=0,22=0,24=0,26=0,27=0,29=0,30=0,31=0,34=0,37=0,41=0,42=0,43=0,44=0,47=0,48=0,51=0,52=0,53=0,54=0,55=0,56=0,57=0,60=0,62=0,63=0,64=0,65=0,66=0,69=0,71=0,72=0,73=0,74=0,75=0,78=0,79=0,82=0,83=0,84=0,87=0,92=0,93=0,102=0,104=0,105=0,107=0,108=0,111=0,112=0,113=0,114=0,115=0,116=0,117=0,118=0,123=0,124=0,128=0,129=0,131=0,132=0,133=0,134=0,136=0,138=0,139=0,140=0'"/>
    <xsl:variable name="inner_top_margin" select="'13=11,15=14,22=18,24=15,26=47,27=27,29=11,30=26,31=17,34=54,37=27,41=23,42=23,43=13,44=61,47=42,48=39,51=16,52=53,53=18,54=50,55=62,56=24,57=49,60=14,62=61,63=64,64=18,65=45,66=48,69=14,71=29,72=42,73=39,74=48,75=28,78=14,79=58,82=47,83=52,84=45,87=41,92=14,93=27,102=41,104=22,105=47,107=35,108=15,111=14,112=37,113=71,114=29,115=60,116=53,117=68,118=40,123=37,124=43,128=42,129=32,131=18,132=58,133=28,134=12,136=23,138=12,139=14,140=24'"/>
    <xsl:variable name="inner_bottom_margin" select="'13=59,15=51,22=69,24=67,26=39,27=25,29=75,30=50,31=28,34=31,37=50,41=40,42=58,43=50,44=24,47=40,48=28,51=45,52=34,53=52,54=26,55=23,56=63,57=37,60=63,62=25,63=22,64=68,65=41,66=38,69=70,71=56,72=40,73=47,74=37,75=57,78=70,79=28,82=38,83=33,84=35,87=24,92=70,93=55,102=42,104=28,105=38,107=50,108=70,111=69,112=50,113=16,114=56,115=26,116=27,117=17,118=25,123=48,124=42,128=37,129=47,131=32,132=27,133=25,134=37,136=57,138=68,139=48,140=47'"/>

    <!--
        This variable is used for epub or html files.

        select contains comma separated xpath path pairs.
        A path pair is separated by a semicolon.
        Each path should start with .//body

        Examples of valid pairs:
        * .//body/div[1]/h2[1];.//body/div[3]/div[1]/h3[1]
        * .//body/div[5];.//body/div[8]/div[3]/h1[1], .//body/div[11]/div[2];.//body/div[11]/div[5]
    -->
    <xsl:variable name="skip_elements" select="''"/>

    <!--
        The default is set to all=1.5.

        The format for linespacing is:
        [all|odd|even|pagenumber]=float (where float is written as integer.integer,
        not integer,integer).

        linespacing lines *must* contain the keywords all, even, odd or a page
        number followed by a = sign and a floating point number. Pages with the
        same linespacing may be separated with ;.

        If there are several values, they are divided by commas.
        Setting different linespacing for odd and even pages is done by writing
        e.g. odd=8, even=15
        It is also possible to set linespacing for particular pages:
        8=8, 10=12
        It is also possible to set linespacing for odd and even pages and
        exceptions from those rules on particular pages.

        Examples on how the select part could look:
        odd=5, even=8, 8=15, 11=3
        all=9, 8=12
        1;3;8=20, 4;5;7=10
    -->
    <xsl:variable name="linespacing" select="''"/>

    <!--
        Information about what is normal text size in pdf documents.
    -->
    <xsl:variable name="main_sizes" select="''"/>

    <!--
        Information about what is title sizes in pdf documents.
    -->
    <xsl:variable name="title_sizes" select="''"/>

    <!--
        Information about what styles titles have in pdf document.
    -->
    <xsl:variable name="title_styles" select="''"/>
    <!--
        Add all paragraphs that should have xml:lang=X
        Uncomment the following and add the paths, for example:
    -->
    <!--
    <xsl:template match="//body/p[5]">
        <xsl:element name="p">
            <xsl:attribute name="xml:lang">sme</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    -->

    <!--
        Change or remove problematic characters from the text.
        Specify the elements to match (here all p's within
        //body, that do contain text, but do NOT contain em and
        span elements), and specify the characters
        to be replaced and the replacements. If needed,
        copy this template and target several different elements,
        but don't make several templates that match the same set
        of elements - then only one of them will apply. Also try
        to restrict the template to nodes that do not contain
        other markup, as such markup otherwise will be removed.
    -->

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
