<%@ include file="../../../restricted/common/noCache.jsp"%>
<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean-el" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ include file="../definitionsConfig.jsp"%>
<%@ include file="../../../restricted/common/cartHeader.jsp" %>

<tiles:insert beanName="TMain" beanScope="request" flush="true">   
  <tiles:put name="pageId" value="pageCLPBasketPage"/>
  <tiles:put name="title"><bean:message key="public_course_basket.label.shopping_cart_items" /></tiles:put>
  <tiles:put name="pageHeader"><bean-el:message key="public.shoppingCart.pageHeader.count" arg0="${numItemsInCartMessage}" /></tiles:put>  
  <tiles:put name="content1Sub1" value="/restricted/checkout/shoppingCart.jsp" />
  <tiles:put name="pageScriptsDelayLoad" value="/restricted/checkout/shoppingCartDelayLoadScripts.jsp" />  
</tiles:insert>
