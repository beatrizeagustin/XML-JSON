<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:stock = "http://www.ineasysteps.com/xsd">
<xsl:output method = "html" encoding="UTF-8"/>

<xsl:template match = "/">
<html>
    <head>
        <title>Stock Prices</title>
        <style>
            .cyan {background: cyan}
            .lightgray {background: lightgray}
        </style>
    </head>
    <body>
        <xsl:for-each select = "/stock:doc/stock:item">
        <xsl:if test = "stock:price &gt; 70">
        <table>
        <tr style="color:#fff;background:#000;">
            <th>Symbol</th>
            <th>Price</th>
            <th>CEO</th>
        </tr>
        
        <xsl:variable name="alternate-colors">
        <xsl:choose>
        <xsl:when test="position() mod 2 = 0">cyan</xsl:when>
        <xsl:otherwise>lightgray</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <tr class="{$alternate-colors}">
            <td><xsl:value-of select="stock:symbol" /></td>
            <td><xsl:value-of select="./stock:price" /></td>
            <td><xsl:value-of select="stock:ceo" /></td>
        </tr> 
       
        </table>
        <div>The total of stocks that cost more than $70.00 is
        $<xsl:value-of select="sum(/stock:doc/stock:item/stock:price)" />
        </div>
         </xsl:if>
        </xsl:for-each>
    </body>
    </html>
</xsl:template>   

</xsl:stylesheet>