<%--
  Created by IntelliJ IDEA.
  User: mruwzum
  Date: 1/3/17
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1" %>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security"
          uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="display" uri="http://displaytag.sf.net" %>


<spring:message code="mezzage.subject" var="subject1"/>
<h3><jstl:out value="${subject1}"/></h3>
<jstl:out value="${subject}"/>


<spring:message code="mezzage.body" var="body1"/>
<h3><jstl:out value="${body1}"/></h3>
<jstl:out value="${body}"/>


<spring:message code="mezzage.sendDate" var="sendDate1"/>
<h3><jstl:out value="${sendDate1}"/></h3>
<jstl:out value="${sendDate}"/>

<spring:message code="mezzage.sender" var="sender1"/>
<h3><jstl:out value="${sender1}"/></h3>
<jstl:out value="${sender}"/>


<spring:message code="mezzage.priority" var="priority11"/>
<h3><jstl:out value="${priority11}"/></h3>

<spring:message code="mezzage.priority" var="priority1"/>
<h3><jstl:out value="${priority1}"/></h3>
<jstl:out value="${priority}"/>