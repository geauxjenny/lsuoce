<%@ include file="../../../restricted/common/noCache.jsp"%>
<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ include file="../definitionsConfig.jsp"%>

<tiles:insert beanName="TMain" beanScope="request" flush="true">    
  <tiles:put name="pageId" value="pageCLPCheckoutProfile"/>    
  <tiles:put name="pageHeader"><bean:message key="public.my_profile" /></tiles:put>
  <tiles:put name="contextHeader"><bean:message key="public.shoppingCart.breadcrumbeHeader" /></tiles:put>
  <tiles:put name="pageHeader"><bean:message key="public.my_profile" /></tiles:put>
  <tiles:put name="breadcrumb" value="/restricted/checkout/checkoutBreadcrumb.jsp" />
  <tiles:put name="content1Sub1" value="/restricted/portal/common/remoteUser.jsp" />
  <tiles:put name="content7Sub1" value="/restricted/portal/student/checkoutProfile.jsp" />    
  <tiles:put name="pageScriptsDelayLoad" value="/restricted/portal/student/checkoutProfileDelayLoadScripts.jsp" />
</tiles:insert>
