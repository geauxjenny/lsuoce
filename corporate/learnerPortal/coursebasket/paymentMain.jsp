<%@ include file="../../../restricted/common/noCache.jsp"%>
<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ include file="../definitionsConfig.jsp"%>

<tiles:insert beanName="TMain" beanScope="request" flush="true">    
  <tiles:put name="pageId" value="pageCLPPayment"/>  
  <tiles:put name="title"><c:out value="${paymentPageHeader}"/></tiles:put>
  <tiles:put name="contextHeader"><bean:message key="public.shoppingCart.breadcrumbeHeader" /></tiles:put>
  <tiles:put name="pageHeader"><c:out value="${paymentPageHeader}"/></tiles:put>
  <tiles:put name="breadcrumb" value="/restricted/checkout/checkoutBreadcrumb.jsp" />
  <tiles:put name="content1Sub1" value="/restricted/corporate/learnerPortal/coursebasket/payment.jsp" />                                            
  <tiles:put name="pageScriptsOnLoad" value="/restricted/checkout/paymentOnLoadScript.jsp" />
  <tiles:put name="pageScriptsDelayLoad" value="/restricted/checkout/paymentDelayLoadScript.jsp" />
</tiles:insert>
 

