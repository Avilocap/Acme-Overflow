<%--
  ~ Copyright � 2017. All information contained here included the intellectual and technical concepts are property of Null Point Software.
  --%>

<%@ tag language="java" body-content="empty" %>

<%-- Taglibs --%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<%-- Attributes --%>

<%@ attribute name="name" required="true" %>
<%@ attribute name="code" required="true" %>

<%-- Definition --%>

<button type="submit" name="${name}" class="button2">
    <spring:message code="${code}"/>
</button>
