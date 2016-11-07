<%--
  Created by IntelliJ IDEA.
  User: ldy
  Date: 2016/11/4
  Time: 下午2:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title><spring:message code="safe.changepsd.title"/></title>
    <script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/modular/global.js"></script>
    <script type="text/javascript" src="<%=path%>/js/modular/frame.js"></script>
    <script type="text/javascript" src="<%=path%>/js/modular/eject.js"></script>
    <link href="<%=path%>/ui/css/bootstrap/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/ui/css/iconfont.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/ui/css/modular/global.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/ui/css/modular/modular.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/ui/css/modular/frame.css" rel="stylesheet" type="text/css"/>

</head>
<body>
    <nav class="wap-second-nav">
        <ul>
            <a href="javascript:"><i class="icon iconfont left" id="leftRe">&#xe626;</i></a>
            <li><spring:message code="safe.changepsd.title"/></li>
        </ul>

    </nav>

    <!--订单内容-->
    <section class="index-wrapper ">
        <div class="set-password">
            <div class="set-int">
                <ul>
                    <li>
                        <p><input type="text" class="input input-large" placeholder="<spring:message code="safe.changepsd.large_input1"/>"></p>

                    </li>
                    <li>
                        <p><input type="text" class="input input-large" placeholder="<spring:message code="safe.changepsd.large_input2"/>"></p>

                    </li>
                    <li>
                        <p><input type="text" class="input input-large" placeholder="<spring:message code="safe.changepsd.large_input3"/>"></p>
                        <label><spring:message code="safe.changepsd.tip_lable"/></label>
                    </li>
                    <li><a href="#" onclick="finishChange()"><input type="button" class="btn submit-btn btn-blue" value="<spring:message code="safe.changepsd.enter_input"/>"></a></li>
                </ul>
            </div>
        </div>
    </section>

    <!--底部-->
    <section class="footer-big">
        <section class="terminal">
            <ul>
                <li class="none">
                    <p><img src="<%=path%>/ui/images/icon-1.png"/></p>

                    <p><spring:message code="all.project.public.icon-1"/></p>
                </li>
                <li class="tow current">
                    <p><img src="<%=path%>/ui/images/icon-2.png"/></p>

                    <p><spring:message code="all.project.public.icon-2"/></p>
                </li>
                <li class="three none-ml">
                    <p><img src="<%=path%>/ui/images/icon-3.png"/></p>

                    <p><spring:message code="all.project.public.icon-3"/></p>
                </li>
            </ul>
        </section>
        <footer class="footer">
            <ul>
                <li><a hrel="#"><spring:message code="all.project.public.footer.about"/></a>|<a hrel="#"><spring:message code="all.project.public.footer.find"/></a>|<a hrel="#"><spring:message code="all.project.public.footer.idea"/></a>|<a hrel="#"><spring:message code="all.project.public.footer.language"/></a></li>
                <li class="ash"><spring:message code="all.project.public.footer.title"/></li>
            </ul>
        </footer>
    </section>
</body>
</html>
<script>
    $(document).ready(function() {
       $("#leftRe").click(function() {
            window.history.go(-1);
       });
    });
    function finishChange() {

        var tourl = "<%=path%>/safe/safesuccess?name=密码";
        window.location.href=tourl;
    }
</script>