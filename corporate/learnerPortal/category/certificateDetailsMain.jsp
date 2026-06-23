<%@ include file="../../../restricted/common/noCache.jsp"%>
<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ include file="../definitionsConfig.jsp"%>
<%@ include file="/restricted/constants.jsp"%>

<%@ include file="/restricted/curriculum/certificate/certificateProfileCommon.jsp"%>


<tiles:insert beanName="TMain" beanScope="request" flush="true">   
  <tiles:put name="pageId" value="pageCLPCertificateProfile"/>
  <tiles:put name="title"><c:out value="${publicCourseCategoryCertificateProfileForm.certificate.name}" /></tiles:put>
  <tiles:put name="metaTitle"><c:out value='${publicCourseCategoryCertificateProfileForm.certificate.code}' /> <c:out value='${publicCourseCategoryCertificateProfileForm.certificate.name}' /></tiles:put>
  <tiles:put name="subject"><c:out value='${publicCourseCategoryCertificateProfileForm.certificate.webPageMetaSubject}'/></tiles:put>
  <tiles:put name="description"><c:out value='${publicCourseCategoryCertificateProfileForm.certificate.webPageMetaDescription}'/></tiles:put>
  <tiles:put name="pageHeader"><c:out value="${publicCourseCategoryCertificateProfileForm.certificate.name}" /></tiles:put>
  <tiles:put name="content1Sub1" value="/restricted/curriculum/certificate/certificateProfileInfo.jsp" />
  <tiles:put name="content2Sub1" value="/restricted/curriculum/certificate/certificateProfileCertificate.jsp" />
  <tiles:put name="content2Sub2" value="/restricted/curriculum/certificate/certificateProfileAssociations.jsp" />
  <tiles:put name="content8Sub1" value="/restricted/common/pageVariableContentBlocks.jsp" />
  <tiles:put name="pageScriptsDelayLoad" value="/restricted/curriculum/certificate/certificateProfileDelayLoadScripts.jsp" />
</tiles:insert>
