<%@ page import="com.destinyweb.srs.publicview.corporate.CorporateUtil" %>
                 
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html-el" %>

<c:set var="corporateGroupId"><%=CorporateUtil.getCorporateGroupId(request)%></c:set>

<div id="header2ContentWrapper" class="row">
  <div class="col-6 col-sm-6" id="schoolCorporateLogoWrapper">
    <c:set var="schoolLogoText"><c:out value='${schoolObject.name}'/> <bean:message key='label.corporate.landingPage.header.schoolLogo.image.alt'/></c:set>
    <html-el:link href="/corporate/landingPage.do?method=load&corporateGroupId=${corporateGroupId}" styleId="schoolCorporateLogoLink">
      <img id="schoolCorporateLogo" alt="<c:out value='${schoolLogoText}'/>" src="<c:out value='${CORPORATE_ATTRIBUTE_SCHOOL_LOGO_NAME}'/>" />
      <span class="sr-only"><c:out value="${schoolLogoText }"/></span>        
    </html-el:link>               
  </div>
  <div class="col-6 col-sm-6" id="groupCorporateLogoWrapper">
    <c:set var="groupLogoText"><bean:message key='label.corporate.landingPage.header.groupLogo.image.alt'/></c:set>
    <html-el:link href="/corporate/landingPage.do?method=load&corporateGroupId=${corporateGroupId}" styleId="groupCorporateLogoLink">
      <img id="groupCorporateLogo" alt="<c:out value='${groupLogoText}'/>" src="<c:out value='${CORPORATE_ATTRIBUTE_CORPORATE_LOGO_NAME}'/>"/>
      <span class="sr-only"><c:out value="${groupLogoText }"/></span>        
    </html-el:link>               
  </div> 
</div>

