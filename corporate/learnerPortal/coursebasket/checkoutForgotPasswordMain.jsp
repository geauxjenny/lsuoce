<%@ include file="../../../restricted/common/noCache.jsp"%>
<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/srs.tld" prefix="srs" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ include file="../definitionsConfig.jsp"%>

<c:set var="isUseLegacyAccountActivationFlow" value="${false}"/>
<srs:display key="legacy.AccountActivation.flow.state" type="configField" condition="Enabled">
  <c:set var="isUseLegacyAccountActivationFlow" value="${true}"/>
</srs:display>

<tiles:insert beanName="TMain" beanScope="request" flush="true">
  <tiles:put name="pageId" value="pageCLPCheckoutForgotPassword"/>
  <c:choose>
    <c:when test="${isUseLegacyAccountActivationFlow}">
      <tiles:put name="title"><bean:message key="public.forgot_password" /></tiles:put>
      <tiles:put name="pageHeader"><bean:message key="public.forgot_password.header" /></tiles:put>
    </c:when>
    <c:otherwise>
      <tiles:put name="title"><bean:message key="public.reset_password" /></tiles:put>
      <tiles:put name="pageHeader"><bean:message key="public.reset_password.header" /></tiles:put>
    </c:otherwise>
  </c:choose>
  <tiles:put name="contextHeader"><bean:message key="public.shoppingCart.breadcrumbeHeader" /></tiles:put>
  <tiles:put name="breadcrumb" value="/restricted/checkout/checkoutBreadcrumb.jsp" />
  <tiles:put name="content1Sub1" value="/restricted/portal/student/checkoutForgotPassword.jsp" />    
</tiles:insert>
