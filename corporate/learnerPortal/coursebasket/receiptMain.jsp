<%@ include file="../../../restricted/common/noCache.jsp"%>
<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jstl/core"   prefix="c" %>
<%@ include file="../definitionsConfig.jsp"%>

<tiles:insert beanName="TMain" beanScope="request" flush="true">    
  <tiles:put name="pageId" value="pageCLPPayment"/>  
  <tiles:put name="title"><bean:message key="public.receipt" /></tiles:put>    
  <tiles:put name="contextHeader"><bean:message key="public.shoppingCart.breadcrumbeHeader" /></tiles:put>
  <tiles:put name="pageHeader"><bean:message key="public.receipt" /></tiles:put>    
  <tiles:put name="breadcrumb" value="/restricted/checkout/checkoutBreadcrumb.jsp" />    
  <tiles:put name="content1Sub1" value="/corporate/learnerPortal/coursebasket/receipt.jsp" />                                                 
  <tiles:put name="pageScriptsOnLoad" value="/restricted/checkout/receiptScriptsOnLoad.jsp" />
</tiles:insert>


