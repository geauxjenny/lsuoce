<%@ include file="../../../restricted/common/noCache.jsp"%>
<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ include file="../definitionsConfig.jsp"%>
<%@ include file="/restricted/corporate/learnerPortal/common/clpCourseProfileHeader.jsp"%>

<tiles:insert beanName="TMain" beanScope="request" flush="true">   
  <tiles:put name="pageId" value="pageCLPCourseProfile"/>
  <tiles:put name="title"><c:out value="${courseDetailsForm.helper.courseSearchHelper.courseList[0].code}"/> <c:out value="${courseDetailsForm.helper.courseSearchHelper.courseList[0].name}"/></tiles:put>
  <tiles:put name="metaTitle"><c:out value="${courseDetailsForm.helper.courseSearchHelper.courseList[0].code}"/> <c:out value="${courseDetailsForm.helper.courseSearchHelper.courseList[0].name}"/></tiles:put>
  <tiles:put name="keywords"><c:out value='${courseDetailsForm.helper.courseSearchHelper.courseList[0].keywords}'/></tiles:put>
  <tiles:put name="subject"><c:out value='${courseDetailsForm.helper.courseSearchHelper.courseList[0].webPageMetaSubject}'/></tiles:put>
  <tiles:put name="description"><c:out value='${courseDetailsForm.helper.courseSearchHelper.courseList[0].webPageMetaDescription}'/></tiles:put>
  <tiles:put name="pageHeader"><c:out value="${pageHeader}" escapeXml="false" /></tiles:put>  
  <tiles:put name="content1Sub1" value="/restricted/curriculum/course/courseProfileMessages.jsp" />
  <tiles:put name="content2Sub1" value="/restricted/curriculum/course/courseProfileCourse.jsp" />
  <tiles:put name="content2Sub2" value="/restricted/curriculum/course/courseProfileSections.jsp" />
  <tiles:put name="content8Sub1" value="/restricted/common/pageVariableContentBlocks.jsp" />
  <tiles:put name="pageScriptsDelayLoad" value="/restricted/curriculum/course/courseProfileDelayLoadScripts.jsp" />
</tiles:insert>
