<%@ page import="com.destinyweb.srs.publicview.corporate.CorporateUtil" %>
                 
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html-el" %>

<style>
  body {
    color: black !important;
  }
  #landingPageContent {
    padding-bottom: .5em !important;
  }

  #landingPageContent h2 {
      line-height: 1.5 !important;
      padding-bottom: .25em !important;
      font-size: 1.8em !important;
      @media (max-width: 768px) {
        font-size: 1.4em !important;
      }
    }
  #landingPageContent h3 {
    color: #461d7c !important;
    font-weight: 700 !important;
  }
  #landingPageContent big a {
    display: inline-block !important;
    background-color: #461d7c !important;
    color: #fff !important;
    text-transform: uppercase !important;
    letter-spacing: 0.1em !important;
    font-size: 14px !important;
    font-weight: 700 !important;
    padding: 1em 1.4em !important;
    border-radius: 0 !important;
    text-decoration: none !important;
    border: 2px solid #461d7c !important;
    border-radius: 4px !important;
    transition: background-color 0.2s, color 0.2s !important;
    margin-top: 1em !important;
    text-align: center !important;
  }
  #landingPageContent big a:hover,
  #landingPageContent big a:focus {
    background-color: #5a2499 !important;
    border-color: #5a2499 !important;
    color: #fff !important;
    text-decoration: none !important;
  }
  #landingPageContent ul {
    list-style: none !important;
    padding-left: 1.25em !important;
  }
  #landingPageContent ul li {
    position: relative !important;
    padding-left: 1.1em !important;
  }
  #landingPageContent ul li::before {
    content: "" !important;
    position: absolute !important;
    left: 0 !important;
    top: 0.45em !important;
    width: 0.5em !important;
    height: 0.5em !important;
    background-color: #eebd02 !important;
    flex-shrink: 0 !important;
  }
.ns-test-header{
  background-color: #461d7c !important;
  display: flex !important;
  flex-direction: row !important;
  align-items: center !important;
  justify-content: space-between !important;
  padding: 20px !important;
}
.ns-test-header-logo img{
  width: auto !important;
  height: 40px !important;
  margin-left: 20px !important;
}
@media (max-width: 768px) {
  .ns-test-header-logo img {
    height: 28px !important;
    margin-left: 10px !important;
  }
}
@media (max-width: 480px) {
  .ns-test-header-logo img {
    height: 22px !important;
    margin-left: 8px !important;
  }
}
.ns-test-header-nav{
  /* outline: 1px solid red !important; */
  display: flex !important;
  flex-direction: row !important;
  align-items: center !important;
  justify-content: end !important;
  gap: 30px !important;
  padding: 20px !important;

}
#cartInfo .glyphicon-shopping-cart:before {
    content: "\f07a";
    color: #fff !important;
}
.ns-page-header {
  position: relative !important;
  width: 100% !important;
  height: 350px !important;
  overflow: hidden !important;
  display: none !important;
  align-items: flex-end !important;
  justify-content: center !important;
  padding: 40px 15px !important;
  box-sizing: border-box !important;
  background-image: url("https://lsuonlinetestsv.destinyone.moderncampus.net/srs/upload/nextsource-header.jpg") !important;
  background-size: cover !important;
  background-position: center 30% !important;
  background-repeat: no-repeat !important;
}
.ns-page-header::after {
  content: "" !important;
  position: absolute !important;
  top: 0 !important;
  left: 0 !important;
  width: 100% !important;
  height: 100% !important;
  pointer-events: none !important;
  z-index: 1 !important;
  background:
    linear-gradient(
      to right,
      rgba(0, 0, 0, 0) 0%,
      rgba(0, 0, 0, 0) 40%,
      rgba(0, 0, 0, 0.45) 65%,
      rgba(0, 0, 0, 0.75) 82%,
      rgba(0, 0, 0, 0.9) 100%
    ),
    linear-gradient(
      to bottom,
      rgba(70, 29, 124, 0) 40%,
      rgba(70, 29, 124, 0.7) 65%,
      rgba(70, 29, 124, 1) 100%
    ) !important;
}
.ns-header-container {
  width: 100% !important;
  max-width: 1430px !important;
  margin: 0 auto !important;
  padding: 0 15px !important;
  position: relative !important;
  z-index: 2 !important;
}
.ns-page-header h1 {
  position: relative !important;
  z-index: 2 !important;
  color: #fff !important;
  margin: 0 !important;
  font-size: 3.5rem !important;
  font-weight: 700 !important;
  border-bottom: none !important;
  padding-bottom: 0 !important;
}
@media (max-width: 767px) {
  .ns-header-container h1 {
    font-size: 2rem !important;
  }
}

@media (min-width: 576px) {
  .ns-header-container {
    max-width: 540px !important;
  }
}
@media (min-width: 768px) {
  .ns-header-container {
    max-width: 720px !important;
  }
  .ns-header-container h1 {
    font-size: 2.5rem !important;
  }
}
@media (min-width: 992px) {
  .ns-header-container {
    max-width: 960px !important;
  }
  .ns-header-container h1 {
    font-size: 3.5rem !important;
  }
}
@media (min-width: 1200px) {
  .ns-header-container {
    max-width: 1140px !important;
  }
}
@media (min-width: 1440px) {
  .ns-header-container {
    max-width: 1430px !important;
  }
}
.ns-test-header-nav a {
  display: flex !important;
  align-items: center !important;
  gap: 5px !important;
  font-size: 15px !important;
  line-height: 1 !important;
  text-decoration: none !important;
}
.ns-test-header-nav a:hover,
.ns-test-header-nav a:focus {
  color: #fdd023 !important;
  text-decoration: none !important;
}
.ns-test-header-nav a:hover .glyphicon,
.ns-test-header-nav a:focus .glyphicon,
.ns-test-header-nav a:hover .clpHeaderLinkText,
.ns-test-header-nav a:focus .clpHeaderLinkText {
  color: #fdd023 !important;
}
.ns-test-header-nav .glyphicon {
  font-size: 14px !important;
  line-height: 1 !important;
  vertical-align: middle !important;
}
.ns-test-header-nav #cartCount {
  font-size: 10px !important;
}
.ns-test-header-nav .clpHeaderLinkText {
  font-size: 15px !important;
  line-height: 1 !important;
  vertical-align: middle !important;
}
@media (max-width: 768px) {
  .ns-test-header-nav a {
    font-size: 11px !important;
    gap: 3px !important;
  }
  .ns-test-header-nav .glyphicon {
    font-size: 12px !important;
  }
  .ns-test-header-nav .clpHeaderLinkText {
    font-size: 11px !important;
  }
}
#cartCount {
  font-size: 12px !important;
  position: relative !important;
  margin-top: -19px !important;
  margin-left: -10px !important;
}
@media only screen and (max-width: 991px) {
  #cartCount {
    margin-bottom: 0 !important;
  }
}
.ns-test-header-nav {
  @media only screen and (max-width: 991px) {
    gap: 10px !important;
    padding: 10px !important;
  }
}

.ns-test-header-nav #loginInfo {
  @media only screen and (max-width: 991px) {
    margin-bottom: 0 !important;
  }
}
#coursesOfferingContainer .coursesOfferingPanelIconContainer span.panelHeaderIcon, #certificatesOfferingContainer .certificatesOfferingPanelIconContainer span.panelHeaderIcon {
  color: #461d7c !important;
}
</style>

<c:set var="corporateGroupId"><%=CorporateUtil.getCorporateGroupId(request)%></c:set>
<div id="clpHeader1ContentWrapper" class="row ns-test-header">
  <div class="ns-test-header-logo">
    <img src="https://lsuonlinetestsv.destinyone.moderncampus.net/srs/upload/nextsource-and-lsuonline.png" alt="LSU Continuing Education logo" class="main-logo-img">
  </div>
  <div class="ns-test-header-nav">
    <div class="" id="landingPageLinkWrapper">
      <html-el:link href="${learnerPortalHome}" styleId="landingPageLink">
        <span class="glyphicon glyphicon-home"></span>
        <span class="clpHeaderLinkText d-none d-sm-inline">
          <bean:message key="public.global_navigation.header.home"/>
        </span>
      </html-el:link>               
    </div>
    <div class="" >
      <c:set var="checkoutPageLink" value="/corporate/coursebasket/publicCourseBasket.do?method=load&corporateGroupId=${corporateGroupId }" scope="request"/>
      <jsp:include page="../../restricted/utilityTiles/cartInfo.jsp"/>
    </div>
    <div class="" id="loginInfo" >
      <html-el:link href="/portal/logon.do?method=load" styleId="landingPageLink">
        <span class="glyphicon glyphicon-log-in"></span>
        <span class="clpHeaderLinkText d-none d-sm-inline">
          <bean:message key="public.global_navigation.header.student_login" />
        </span>
      </html-el:link>       
    </div>
  </div>  
</div>
<div class="ns-page-header">
  <div class="ns-header-container">
    <h1>Advance Your Career with LSU Online</h1>
  </div>
</div>

<script>
(function() {
  var targetPath = "/corporate/landingPage.do";
  var params = new URLSearchParams(window.location.search);
  if (
    window.location.pathname === targetPath &&
    params.get("method") === "load" &&
    params.get("corporateGroupId") === "51819353"
  ) {
    document.querySelector(".ns-page-header").style.setProperty("display", "flex", "important");
  }
})();
</script>
