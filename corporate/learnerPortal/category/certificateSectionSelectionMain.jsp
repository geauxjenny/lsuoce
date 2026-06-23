<%@ include file="../../../restricted/common/noCache.jsp"%>
<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/srs.tld" prefix="srs" %>
<%@ include file="../definitionsConfig.jsp"%>

<tiles:insert beanName="TMain" beanScope="request" flush="true">   
  <tiles:put name="pageId" value="pageCLPCertificateSectionSelection"/>
  <tiles:put name="title"><bean:message key="enrolmentManager.bundles.section_selection.header" /> <c:out value="${publicCourseCategoryCertificateProfileForm.certificates[0].name}" /></tiles:put>
  <tiles:put name="pageHeader">
    <bean:message key="enrolmentManager.bundles.section_selection.header" /> <c:out value="${publicCourseCategoryCertificateProfileForm.certificates[0].name}" escapeXml="false"/>
  </tiles:put>    
  <tiles:put name="content1Sub1" value="/restricted/curriculum/certificate/certificateBundleSectionSelection.jsp" />
  <tiles:put name="pageScriptsDelayLoad" value="/restricted/curriculum/certificate/learnerPortalCertificateBundleSectionSelectionDelayLoadScript.jsp" />
</tiles:insert>
