//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.1-b02-fcs 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2007.06.07 at 07:44:18 下午 CST 
//


package org.hi.metadata.hsc.context.environment;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element ref="{}appName"/>
 *         &lt;element ref="{}orgPackage"/>
 *         &lt;element ref="{}templetDir"/>
 *         &lt;element ref="{}srcOutput"/>
 *         &lt;element ref="{}standardOutput"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "appName",
    "orgPackage",
    "templetDir",
    "srcOutput",
    "standardOutput"
})
@XmlRootElement(name = "generate")
public class Generate {

    @XmlElement(required = true)
    protected String appName;
    @XmlElement(required = true)
    protected String orgPackage;
    @XmlElement(required = true)
    protected String templetDir;
    @XmlElement(required = true)
    protected String srcOutput;
    @XmlElement(required = true)
    protected String standardOutput;

    /**
     * Gets the value of the appName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAppName() {
        return appName;
    }

    /**
     * Sets the value of the appName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAppName(String value) {
        this.appName = value;
    }

    /**
     * Gets the value of the orgPackage property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getOrgPackage() {
        return orgPackage;
    }

    /**
     * Sets the value of the orgPackage property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setOrgPackage(String value) {
        this.orgPackage = value;
    }

    /**
     * Gets the value of the templetDir property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTempletDir() {
        return templetDir;
    }

    /**
     * Sets the value of the templetDir property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTempletDir(String value) {
        this.templetDir = value;
    }

    /**
     * Gets the value of the srcOutput property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSrcOutput() {
        return srcOutput;
    }

    /**
     * Sets the value of the srcOutput property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSrcOutput(String value) {
        this.srcOutput = value;
    }

    /**
     * Gets the value of the standardOutput property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getStandardOutput() {
        return standardOutput;
    }

    /**
     * Sets the value of the standardOutput property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setStandardOutput(String value) {
        this.standardOutput = value;
    }

}
