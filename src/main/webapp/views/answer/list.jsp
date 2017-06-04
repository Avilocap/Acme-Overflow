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

<%--
  ~ Copyright � 2017. All information contained here included the intellectual and technical concepts are property of Null Point Software.
  --%>

<security:authorize access="hasAnyRole('TEACHER','USER')">
    <div>
        <H5>
            <a href="answer/create.do"> <spring:message
                    code="general.create"/>
            </a>
        </H5>
    </div>
</security:authorize>

<!-- Listing grid -->
<display:table pagesize="5" class="displaytag" keepStatus="true"
               name="answers" requestURI="${requestURI}" id="row">


    <!-- Attributes -->

    <security:authorize access="hasAnyRole('TEACHER','USER')">
        <display:column>
            <a href="answer/edit.do?answerId=${row.id}"> <spring:message
                    code="general.edit"/>
            </a>
        </display:column>
    </security:authorize>
    <security:authorize access="hasAnyRole('ADMIN','MODERATOR')">
        <display:column>
            <jstl:if test="${not row.banned}">
                <a href="answer/ban.do?answerId=${row.id}"> <spring:message
                        code="user.ban"/>
                </a>
            </jstl:if>
        </display:column>
    </security:authorize>
    <spring:message code="answer.title" var="title"/>
    <display:column property="title" title="${title}" sortable="true"/>
    <spring:message code="answer.description" var="description"/>
    <display:column property="description" title="${description}" sortable="true"/>
    <spring:message code="answer.likes" var="originAddress"/>
    <display:column property="likes" title="${originAddress}" sortable="true"/>
    <spring:message code="answer.dislikes" var="destinationAddress"/>
    <display:column property="dislikes" title="${destinationAddress}" sortable="true"/>


</display:table>