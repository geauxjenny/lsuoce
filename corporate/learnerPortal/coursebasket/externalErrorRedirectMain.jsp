<%@ include file="../../../restricted/common/noCache.jsp"%>
<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<%@ include file="../../../restricted/constants.jsp"%>
<%@ include file="../definitionsConfig.jsp"%>

<tiles:insert beanName="TMain" beanScope="request" flush="true">   
  <tiles:put name="pageId" value="pageCLPBasketPage"/>
  <tiles:put name="title"><c:out value="${schoolName}"/></tiles:put>
  <tiles:put name="pageHeader"><bean:message key="public_course_basket.label.shopping_cart_items" /></tiles:put>  
  <tiles:put name="content1Sub1" value="/restricted/corporate/learnerPortal/coursebasket/externalErrorRedirect.jsp" />   
</tiles:insert>
