<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ include file="definitionsConfig.jsp"%>

<tiles:insert beanName="TMain" beanScope="request" flush="true">   
  <tiles:put name="pageId" value="pageCorporateLandingPage"/>
  <tiles:put name="title"><c:out value="${schoolName}"/></tiles:put>     
  <tiles:put name="content1Sub1" value="/restricted/corporate/learnerPortal/landingPage.jsp" />
  <tiles:put name="pageScriptsDelayLoad" value="/restricted/corporate/common/browseOfferingCommonDelayLoadScripts.jsp" /> 
</tiles:insert>
