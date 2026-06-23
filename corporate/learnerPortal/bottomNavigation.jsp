<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/srs.tld" prefix="srs" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html-el"%>
<style>
  #footer {
    padding: 40px 15px !important;
  }
  #footerNav h5 {
    letter-spacing: 0.05em;
  }
  #footerNav .glyphicon {
    color: #fdd023 !important;
  }
  #footerNav .social a,
  #footerNav .social .fa,
  #footerNav .social [class^="fa-"],
  #footerNav .social span[class*="glyphicon"] {
    color: #fdd023 !important;
  }
  #footerNav .footer-newsletter {
    display: flex !important;
    flex-direction: column !important;
    align-items: stretch !important;
    gap: 0.75rem !important;
  }
  #footerNav .footer-newsletter input[type="text"],
  #footerNav .footer-newsletter input[type="email"],
  #footerNav .footer-newsletter input[type="search"],
  #footerNav .footer-newsletter select,
  #footerNav .footer-newsletter textarea {
    width: 100% !important;
    max-width: 100% !important;
    box-sizing: border-box !important;
  }
  #footerNav .input-group {
    flex-direction: column !important;
    gap: 0.75rem !important;
  }
  #footerNav .footer-newsletter table {
    width: 100% !important;
  }
  #footerNav .footer-newsletter table input[type="text"],
  #footerNav .footer-newsletter table input[type="email"] {
    width: 100% !important;
    box-sizing: border-box !important;
  }
  #footerNav .footer-newsletter button,
  #footerNav .footer-newsletter input[type="submit"],
  #footerNav .footer-newsletter input[type="button"],
  #footerNav .footer-newsletter .btn {
    background-color: #fdd023 !important;
    color: #461d7c !important;
    border-color: #fdd023 !important;
    box-sizing: border-box !important;
  }
  #footerNav .footer-newsletter button:hover,
  #footerNav .footer-newsletter input[type="submit"]:hover,
  #footerNav .footer-newsletter .btn:hover {
    background-color: #ffe066 !important;
    color: #461d7c !important;
    border-color: #ffe066 !important;
  }
</style>
<div id="footerNav" class="footerNav">
  <div class="row">
    <div class="col-lg-5">      
      <div class="footerContact schoolInfoList">
        <c:if test="${schoolObject != null && ! empty schoolObject.name}"><h5><c:out value="${schoolObject.name}" /></h5></c:if>                
        <ul class="list-unstyled">          
          <c:if test="${schoolObject != null }">            
            <li><span class="glyphicon glyphicon-map-marker"></span><c:out value="${schoolObject.address1 }" escapeXml="false"/><br/>
              <c:if test="${not empty schoolObject.address2 }">
                <c:out value="${schoolObject.address2 }" escapeXml="false"/><br/>
              </c:if>
              <c:if test="${! empty schoolObject.city || ! empty schoolObject.provinceCode }">
                <c:if test="${! empty schoolObject.city}"><c:out value="${schoolObject.city }"/><c:if test="${! empty schoolObject.provinceCode}">,</c:if></c:if> <c:out value="${schoolObject.provinceCode }"/><br/>
              </c:if>
              <c:if test="${! empty schoolObject.zip}"><c:out value="${schoolObject.zip}" escapeXml="false" /><br></c:if></li>                        
          </c:if>                      
        </ul>
      </div>
    </div>
    <div class="col-lg-2">
      <c:if test="${schoolObject != null && ! empty schoolObject.name}"><h5>&nbsp;</h5></c:if>
      <ul class="list-unstyled">          
          <c:if test="${schoolObject != null }">                        
            <c:if test="${! empty schoolObject.phoneArea || ! empty schoolObject.phoneNumber || ! empty schoolObject.phoneExt}">
              <li><span class="glyphicon glyphicon-earphone"></span><c:out value="${schoolObject.phoneArea }"/>-<c:out value="${schoolObject.phoneNumber }"/> <c:if test="${not empty schoolObject.phoneExt }">x<c:out value="${schoolObject.phoneExt }"/></c:if></li>
            </c:if>
            <li><span class="glyphicon glyphicon-envelope"></span><html-el:link href="mailto:${schoolObject.registrationEmail }"><c:out value="${schoolObject.registrationEmail }"/></html-el:link></li>            
          </c:if>                      
        </ul>
    </div>    
    <div class="col-lg-2">
      <div class="social">
        <%@ include file="../../utilityTiles/socialMedia.jsp"%>
      </div>
    </div>
    <div class="col-lg-3">
      <div class="footerConnect">
        <h5><bean:message key="public.label.joinMailingList"/></h5>
        <div class="newsletter footer-newsletter">
          <%@ include file="../../restricted/utilityTiles/joinMailingListForm.jsp"%>
        </div>        
      </div>
    </div>
  </div>
</div>
        
