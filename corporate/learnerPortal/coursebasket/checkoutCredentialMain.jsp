<%@ include file="../../../restricted/common/noCache.jsp"%>
<%@ taglib uri="http://www.destinysolutions.com/tiles" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ include file="../definitionsConfig.jsp"%>

<tiles:insert beanName="TMain" beanScope="request" flush="true">    
    <tiles:put name="pageId" value="pageCLPStudentCredential"/>    
    <tiles:put name="title"><bean:message key="public.change_my_credential" /></tiles:put>    
    <tiles:put name="pageHeader"><bean:message key="public.change_my_credential" /></tiles:put>                          
    <tiles:put name="content1Sub1" value="/restricted/portal/student/checkoutStudentCredential.jsp" />    
    <tiles:put name="pageScriptsDelayLoad" value="/restricted/portal/student/studentCredentialDelayLoadScripts.jsp" />
</tiles:insert>
