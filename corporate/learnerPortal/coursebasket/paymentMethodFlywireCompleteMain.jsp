<%@ include file="../../../restricted/common/noCache.jsp"%>
<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ include file="../definitionsConfig.jsp"%>
<c:set var="blockClickjack" value="true" scope="request"/>

<tiles:insert beanName="TMain" beanScope="request" flush="true">
  <tiles:put name="pageId" value="pageCLPPaymentFlywireCompleted"/>
  <tiles:put name="robots" value="noindex,nofollow" />
  <tiles:put name="title"><bean:message key="public.flywire.payment.initiated.header" /></tiles:put>
  <tiles:put name="pageHeader"><bean:message key="public.flywire.payment.initiated.header" /></tiles:put>
  <tiles:put name="content1Sub1" value="/restricted/checkout/paymentMethodFlywireComplete.jsp" />
  <srs:display key="publicView.checkout.receipt.googleAnalytics.state" type="configField" condition="Enabled">
    <tiles:put name="pageScriptsOnLoad" value="/restricted/checkout/receiptScriptsOnLoad.jsp" />
  </srs:display>
</tiles:insert>