<%@ include file="../restricted/common/noCache.jsp"%>
<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ include file="../definitionsConfig.jsp"%>

<tiles:insert beanName="TMain" beanScope="request" flush="true">    
    <tiles:put name="pageId" value="pageCLPPayment"/>    
    <tiles:put name="title"><bean:message key="public.pay_by" /> <bean:message key="publicview.payment.directBillingAccountPayment" /></tiles:put>    
    <tiles:put name="contextHeader"><bean:message key="public.shoppingCart.breadcrumbeHeader" /></tiles:put>
    <tiles:put name="pageHeader"><bean:message key="public.pay_by" /> <bean:message key="publicview.payment.directBillingAccountPayment" /></tiles:put>    
    <tiles:put name="breadcrumb" value="/restricted/checkout/checkoutBreadcrumb.jsp" />    
    <tiles:put name="content1Sub1" value="/restricted/checkout/directBillingPayment.jsp" />
    <tiles:put name="pageScriptsDelayLoad" value="/restricted/checkout/paymentDelayLoadScript.jsp" />
</tiles:insert>
