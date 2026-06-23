<%--
  ~ Copyright (c) Modern Campus Inc. 2017 - All right reserved
  ~ This software is the confidential and proprietary information of Modern Campus, Inc. ("Confidential Information").
  ~ You shall not disclose such confidential information and shall use it only in accordance with the terms of the license agreement you entered into with Modern Campus.
  --%>

<%@ include file="../../restricted/common/noCache.jsp"%>
<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ include file="../../definitionsConfig.jsp"%>

<tiles:insert beanName="TMain" beanScope="request" flush="true">
  <tiles:put name="pageId" value="pageAbbreviatedStudentProfile"/>
  <tiles:put name="robots" value="noindex,nofollow" />
  <tiles:put name="title"><bean:message key="publicview.personal.contactInformation" /></tiles:put>
  <tiles:put name="pageHeader"><bean:message key="publicview.personal.contactInformation" /></tiles:put>
  <tiles:put name="content1Sub1" value="/restricted/common/pubRegExternalPersonal.jsp" />
</tiles:insert>


