<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean-el" %>

<%@ page import="com.destinyweb.srs.common.Constants,
                 com.destinyweb.srs.publicview.corporate.CorporateUtil"%>
                 

<%
    CorporateUtil.setupCorporateAttribute(request);
%>

<c:set var="isCorporateLearnerPortal" value="true" scope="request"/>
<c:set var="streamlineCheckout" scope="request"><%= CorporateUtil.isStreamlinedCheckout(request) %></c:set>
<c:set var="useGroupSpecificNavigationElements" scope="request"><%= CorporateUtil.isUseGroupNavigationElements(request) %></c:set>

<tiles:definition id="TMain" page="/TMAIN.jsp">
    <tiles:put name="title"><c:out value="${schoolName}"/></tiles:put>
    <tiles:put name="metaTitle"><c:out value="${pvConfigManager.metaTitle }"/></tiles:put>
    <tiles:put name="subject"><c:out value="${pvConfigManager.metaSubject }"/></tiles:put>
    <tiles:put name="description"><c:out value="${pvConfigManager.metaDescription }"/></tiles:put>
    <tiles:put name="keywords"><c:out value="${pvConfigManager.metaKeywords }"/></tiles:put>
    <tiles:put name="robots" value="noindex,nofollow" />
    <tiles:put name="formAction" value="" />
    <tiles:put name="pageScriptsOnLoad" value="" />
    <tiles:put name="pageScriptsDelayLoad" value="" />
    <tiles:put name="pageClass" value="" />

    <c:choose>
      <c:when test="${!useGroupSpecificNavigationElements}">
        <tiles:put name="header0" value="/navigation/languageBar.jsp" />
        <tiles:put name="header1" value="/corporate/learnerPortal/topHeader.jsp" />
        <tiles:put name="header2Sub1" value="/corporate/learnerPortal/headerBanner.jsp" />
        <tiles:put name="header2Sub2" value="" />
        <tiles:put name="header2Sub3" value="" />
        <tiles:put name="header3Sub1" value="" />
        <tiles:put name="header3Sub2" value="" />
        <tiles:put name="header3Sub3" value="" />
        
        <tiles:put name="sidebar1Sub1" value="" />
        <tiles:put name="sidebar2Sub1" value="" />
        
        <tiles:put name="bottomNavigation" value="" />
    
        <tiles:put name="footer1Sub1" value="/corporate/learnerPortal/bottomNavigation.jsp" />
        <tiles:put name="footer1Sub2" value="" />                
        <tiles:put name="footer2Sub1" value="/utilityTiles/copyright.jsp" />
        <tiles:put name="footer2Sub2" value="/restricted/utilityTiles/poweredBy.jsp" />
        <tiles:put name="footer2Sub3" value="" />       
      </c:when>
      <c:otherwise>
        <tiles:put name="header1" value="" />
        <tiles:put name="header2Sub1" value="" />
        <tiles:put name="header2Sub2" value="" />
        <tiles:put name="header2Sub3" value="" />
        <tiles:put name="header3Sub1" value="" />
        <tiles:put name="header3Sub2" value="" />
        <tiles:put name="header3Sub3" value="" />
        
        <tiles:put name="sidebar1Sub1" value="" />
        <tiles:put name="sidebar2Sub1" value="" />
        
        <tiles:put name="bottomNavigation" value="" />
    
        <tiles:put name="footer1Sub1" value="" />
        <tiles:put name="footer1Sub2" value="" />
        <tiles:put name="footer2Sub1" value="" />
        <tiles:put name="footer2Sub2" value="" />
        <tiles:put name="footer2Sub3" value="" />       
      </c:otherwise>
    </c:choose>

    <tiles:put name="contextHeader" value=""  />
    <tiles:put name="pageHeader" value=""  />
    <tiles:put name="pageHeaderPage" value=""  />
    <tiles:put name="pageHeaderSub2" value=""  />
    <tiles:put name="pageHeaderSub2Page" value=""  />
    <tiles:put name="breadcrumb" value=""  />
    
    <tiles:put name="content1Sub1" value="" />
    <tiles:put name="content2Sub1" value="" />
    <tiles:put name="content2Sub2" value="" />
    <tiles:put name="content3Sub1" value="" />
    <tiles:put name="content3Sub2" value="" />
    <tiles:put name="content4Sub1" value="" />
    <tiles:put name="content4Sub2" value="" />
    <tiles:put name="content5Sub1" value="" />
    <tiles:put name="content5Sub2" value="" />
    <tiles:put name="content5Sub3" value="" />
    <tiles:put name="content6Sub1" value="" />
    <tiles:put name="content6Sub2" value="" />
    <tiles:put name="content6Sub3" value="" />
    <tiles:put name="content6Sub4" value="" />
    <tiles:put name="content7Sub1" value="" />

    
</tiles:definition>

