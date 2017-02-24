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
                                <td align="center"><a href="<c:url value="/delete/${user.userId}"/>">Delete </a> </td>
                                <td align="center"><a href="<c:url value="/edit/${user.userId}"/>"> Edit </a> </td>
                            </tr>
                        </c:forEach>
                    </table>

                </c:if>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <f:form method="post" commandName="user" action="/addUser">
                <table>
                    <c:if test="${!empty user.userName}">
                        <tr>
                            <td>
                                <i>ID</i>
                            </td>
                            <td>
                                <f:input path="userId"/>
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
            <f:form method="post" action="/">
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
