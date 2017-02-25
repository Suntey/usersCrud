<%--
  Created by IntelliJ IDEA.
  User: Suntey
  Date: 17.02.2017
  Time: 0:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>


<html>
<head>
    <title>MyPain</title>

</head>

<body bgcolor="#ffffe0">
    <h1>User's List</h1>
    <br/>

    <table>

        <tr>
            <td valign="top">
                <img alt="vjuh" width="500" src="<spring:url value="/resourses/vjuh.png"/>"/>
            </td>
            <td>
                <c:if test = "${!empty listUsers}">

                    <table border="5" width="900" cellspacing = "0">
                        <tr  height="30" bgcolor="gray">
                            <th>ID</th>
                            <th>Name</th>
                            <th>Age</th>
                            <th>isAdmin</th>
                            <th>createDate</th>
                            <th colspan = "2">Delete/Edit</th>
                        </tr>
                        <c:forEach var="user" items="${listUsers}">
                            <tr  height="30">
                                <td align="center"> ${user.userId}</td>
                                <td> ${user.userName}</td>
                                <td align="center"> ${user.age}</td>
                                <td align="center"> ${user.admin}</td>
                                <td align="center"> ${user.createdDate}</td>
                                <td align="center"><a href="<c:url value="/${page}/delete/${user.userId}"/>">Delete </a> </td>
                                <td align="center"><a href="<c:url value="/${page}/edit/${user.userId}"/>"> Edit </a> </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
                <div id="pagination">

                    <c:url value="/" var="prev">
                        <c:param name="page" value="${page-1}"/>
                    </c:url>
                    <c:if test="${page > 1}">
                        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
                    </c:if>

                    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                        <c:choose>
                            <c:when test="${page == i.index}">
                                <span>${i.index}</span>
                            </c:when>
                            <c:otherwise>
                                <c:url value="/" var="url">
                                    <c:param name="page" value="${i.index}"/>
                                </c:url>
                                <a href='<c:out value="${url}" />'>${i.index}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:url value="/" var="next">
                        <c:param name="page" value="${page + 1}"/>
                    </c:url>
                    <c:if test="${page + 1 <= maxPages}">
                        <a href='<c:out value="${next}" />' class="pn next">Next</a>
                    </c:if>
                </div>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <f:form method="post" commandName="user" action="/${page}/addUser">
                <table>
                    <c:if test="${!empty user.userName}">
                        <tr>
                            <td>
                                <i>ID</i>
                            </td>
                            <td>
                                <f:input path="userId" readonly="true"/>
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <td>
                            <i>Name</i>
                        </td>
                        <td>
                            <f:input path="userName"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <i>Age</i>
                        </td>
                        <td>
                            <f:input path="age"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <i>isAdmin</i>
                        </td>
                        <td>
                            <f:input path="admin"/>
                        </td>
                    </tr>
                    <c:if test="${empty user.userName}">
                        <tr>
                            <td><input type="submit" value="и ты создал User(a)"></td>
                        </tr>
                    </c:if>
                    <c:if test="${!empty user.userName}">
                        <tr>
                            <td><input type="submit" value="и ты отредактировал User(a)"></td>
                        </tr>
                    </c:if>

                    </f:form>

                </table>
            </td>
        </tr>
        <tr valign="top">
            <f:form method="post" action="/searchUser">
                <table>
                    <tr>
                        <i> Введите имя для поиска</i>
                        <td>
                            <input type="text" name="j_userName" />

                        </td>
                    </tr>
                </table>
            </f:form>
        </tr>
    </table>





</body>
</html>
