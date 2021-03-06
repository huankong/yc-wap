<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="com.ai.opt.sdk.components.ccs.CCSClientFactory" %>
<%@ page import="com.yc.wap.system.constants.Constants" %>
<%--
  Created by IntelliJ IDEA.
  User: Nozomi
  Date: 11/5/2016
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String accountEnable = "1";
    try {
        accountEnable = CCSClientFactory.getDefaultConfigClient().get(Constants.Account.CCS_PATH_ACCOUNT_ENABLE);
    } catch (Exception e) {
        //获取配置出错，直接忽略，视为开启
    }
    System.out.println("accountEnable: " + accountEnable);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title><spring:message code="pay.payment.title"/></title>
    <link href="<%=path%>/ui/css/bootstrap/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/ui/css/iconfont.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/ui/css/modular/global.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/ui/css/modular/modular.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/ui/css/modular/frame.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/modular/global.js"></script>
    <script type="text/javascript" src="<%=path%>/js/modular/frame.js"></script>
    <script type="text/javascript" src="<%=path%>/js/modular/eject.js"></script>
    <%@ include file="../common/timezone.jsp" %>
</head>
<body>
<div class="wrapper-big" id="body">
    <div class="eject-big">
        <div class="prompt" id="prompt">
            <div class="prompt-title"><spring:message code="pay.payment.titles"/></div>
            <div class="prompt-confirm">
                <ul>
                    <li id="EjectTitle"></li>
                </ul>
            </div>
            <div class="prompt-confirm-btn">
                <a href="#" id="prompt-btn"><spring:message code="pay.payment.confirm"/></a>
            </div>
        </div>
        <div class="mask" id="eject-mask"></div>
    </div>

    <div class="eject-big">
        <div class="prompt" id="password">
            <div class="prompt-title"><spring:message code="pay.payment.pay"/></div>
            <div class="prompt-confirm">
                <ul>
                    <li id="password-tip"><spring:message code="pay.payment.pass"/></li>
                    <li><input type="password" class="int-passwod" id="int-password"></li>
                </ul>
            </div>
            <div class="prompt-confirm-btn">
                <a class="btn btn-white-50" id="set-passbtn"><spring:message code="pay.payment.confirm1"/></a>
                <a class="btn btn-white-50" id="set-passbtn-close"><spring:message code="pay.payment.cancel"/></a>
            </div>
        </div>
        <%--<div class="mask" id="eject-mask"></div>--%>
    </div>

    <%--头部--%>
    <spring:message code="pay.payment.title1" var="title"/>
    <jsp:include page="/jsp/common/pophead.jsp" flush="true">
        <jsp:param name="Title" value="${title}"/>
        <jsp:param name="BackTo" value="javascript:window.history.go(-1)"/>
    </jsp:include>

    <!--订单内容-->
    <div class="confirm-list">
        <ul style="display: none">
            <li class="word">订单性质:</li>
            <li>
                <p>
                    <select class="select testing-select-big" disabled id="sel">
                        <option><spring:message code="pay.payment.person"/></option>
                    </select>
                    <span>|</span>
                </p>
            </li>
        </ul>
        <ul style="display: none">
            <li class="word"><spring:message code="pay.payment.cheap"/></li>
            <li>
                <p>
                    <select class="select testing-select-big" disabled id="sel">
                        <option><spring:message code="pay.payment.nocheap"/></option>
                    </select>
                    <span>|</span>
                    <label></label>
                </p>
            </li>
        </ul>
        <ul style="display: none">
            <li class="word"><spring:message code="pay.payment.cheap1"/><</li>
            <li>
                <p>
                    <select class="select testing-select-big" disabled id="sel">
                        <option><spring:message code="pay.payment.nocheap1"/><</option>
                    </select>
                    <span>|</span>
                </p>
            </li>
        </ul>

        <%--<ul>--%>
        <%--<li><input type="radio" name="choose" class="radio"/><spring:message code="pay.payment.after"/></li>--%>
        <%--</ul>--%>
        <% if (Constants.Account.ACCOUNT_ENABLE.equals(accountEnable)) { %>
        <ul id="balance1" style="display: none">
            <li id="imgCash1" class="word-ash">
                <img src="<%=path%>/ui/images/radio1.jpg" id="cash1" class="radio-img"/>
                <a id="balanceNumber1"></a>
            </li>
        </ul>
        <% } %>

        <ul>
            <li class="zhifb" id="imgAliPay"><img src="<%=path%>/ui/images/radio.jpg" id="alipay" class="radio-img"/>
                <img src="<%=path%>/ui/images/zhifb.png"/></li>

            <li class="unionpay" id="imgUniPay"><img src="<%=path%>/ui/images/radio1.jpg" id="unipay" class="radio-img"/>
                <img src="<%=path%>/ui/images/unionpay.png"/></li>
        </ul>

        <% if (Constants.Account.ACCOUNT_ENABLE.equals(accountEnable)) { %>
        <ul id="balance" style="display: none">
            <li id="imgCash" class="word-ash">
                <img src="<%=path%>/ui/images/radio1.jpg" id="cash" class="radio-img"/>
                <a id="balanceNumber"></a>
            </li>
            <li class="right" id="buzu" style="display: none">
                <a href="javascript:toRecharge()"><spring:message code="pay.payment.balance2"/></a>
            </li>
        </ul>
        <% } %>
    </div>
</div>

<form id="toPayForm" method="post" action="<%=path%>/pay/gotoPay">
    <input type="hidden" name="orderId" value="${OrderId}">
    <input type="hidden" name="orderAmount" value="${PriceDisplay}">
    <input type="hidden" name="currencyUnit" value="1">
    <input type="hidden" id="payType" name="payOrgCode" value="ZFB">
    <input type="hidden" id="merchantUrl" name="merchantUrl">
</form>

<form id="toBalancePay" method="post" action="<%=path%>/pay/BalancePayment">
    <input type="hidden" name="orderId" value="${OrderId}">
    <input type="hidden" name="orderAmount" value="${PriceDisplay}">
    <input type="hidden" name="password" id="passInput" value="">
    <input type="hidden" name="payCheck" id="isPayCheck" value="">
</form>

<!--底部-->
<section class="order-submit">
    <div class="left">
        <p><spring:message code="pay.payment.needpay"/>${PriceDisplay}<spring:message code="pay.payment.yuan"/></p>
        <p>
            <span><spring:message code="pay.payment.needpay1"/>${PriceDisplay}<spring:message code="pay.payment.yuan"/></span>
            <%--<span><spring:message code="pay.payment.needpay2"/>50<spring:message code="pay.payment.yuan"/></span>--%>
        </p>
    </div>
    <div class="right"><a href="javascript:void(0)" id="submit"><spring:message code="pay.payment.confirm2"/></a></div>
</section>
<jsp:include page="/jsp/common/loading.jsp" flush="true"/>

</body>
</html>

<script type="text/javascript">
    var CheckedImg = "<%=path%>/ui/images/radio.jpg";
    var UnCheckedImg = "<%=path%>/ui/images/radio1.jpg";
    var balance = "0.00";
    var balanceBuzu = false;
    var Channel = "1";
    var orderState = "";
    var payCheck = "";
    var setPassword = true;
    var getInfoFalse = false;

    $(document).ready(function () {
        GetBalance();

        $('#set-passbtn').click(function () {
            $("#passInput").val($("#int-password").val());
            $('#eject-mask').fadeOut(200);
            $('#password').slideUp(200);
            toBalancePay();
        });

        $("#set-passbtn-close").click(function () {
            $('#eject-mask').fadeOut(200);
            $('#password').slideUp(200);
        });

        $("#submit").bind("click", function () {
            if (getInfoFalse) {
                $("#EjectTitle").html("<spring:message code="pay.payment.tips1"/>");
                $('#eject-mask').fadeIn(100);
                $('#prompt').slideDown(100);
                return;
            }

            if (orderState == "20") {
                $("#EjectTitle").html("<spring:message code="pay.payment.tips2"/>");
                $('#eject-mask').fadeIn(100);
                $('#prompt').slideDown(100);
                return;
            }

            if (Channel == "1") {
                $("#payType").val("ZFB");
                $("#toPayForm").submit();
            } else if (Channel == "2") {
                $("#payType").val("YL");
                $("#toPayForm").submit();
            } else if (Channel == "3") {
                if (!balanceBuzu) {
                    BalancePay();
                } else {
                    $("#EjectTitle").html("<spring:message code="pay.payment.tips3"/>");
                    $('#eject-mask').fadeIn(100);
                    $('#prompt').slideDown(100);
                }
            }
        });

        $("#imgAliPay").bind("click", function () {
            Channel = "1";
            document.getElementById("alipay").src = CheckedImg;
            document.getElementById("unipay").src = UnCheckedImg;
            document.getElementById("cash").src = UnCheckedImg;
            document.getElementById("cash1").src = UnCheckedImg;
        });

        $("#imgUniPay").bind("click", function () {
            Channel = "2";
            document.getElementById("alipay").src = UnCheckedImg;
            document.getElementById("unipay").src = CheckedImg;
            document.getElementById("cash").src = UnCheckedImg;
            document.getElementById("cash1").src = UnCheckedImg;
        });

        $("#imgCash").bind("click", function () {
            Channel = "3";
            document.getElementById("alipay").src = UnCheckedImg;
            document.getElementById("unipay").src = UnCheckedImg;
            document.getElementById("cash").src = CheckedImg;
            document.getElementById("cash1").src = CheckedImg;
        });

        $("#imgCash1").bind("click", function () {
            Channel = "3";
            document.getElementById("alipay").src = UnCheckedImg;
            document.getElementById("unipay").src = UnCheckedImg;
            document.getElementById("cash").src = CheckedImg;
            document.getElementById("cash1").src = CheckedImg;
        });
    });

    $(function () {

    });

    function GetBalance() {
        $.ajax({
            async: true,
            type: "POST",
            url: "<%=path%>/account/GetBalance",
            modal: true,
            timeout: 30000,
            data: {},
            success: function (data) {
                if (data.status == 1) {
                    balance = data.balance;
                    $("#balanceNumber").html("<spring:message code="pay.payment.balance"/>" + data.balance + "<spring:message code="pay.payment.balance1"/>");
                    $("#balanceNumber1").html("<spring:message code="pay.payment.balance"/>" + data.balance + "<spring:message code="pay.payment.balance1"/>");
                    if (data.balance < ${PriceDisplay}) {
                        $("#balance").css("display", "block");
                        $("#buzu").css("display", "block");
                        balanceBuzu = true;
                    } else {
                        $("#balance1").css("display", "block");
                        balanceBuzu = false;
                    }
                    CheckState();
                } else {
                    $("#EjectTitle").html("<spring:message code="pay.payment.tips1"/>");
                    $('#eject-mask').fadeIn(100);
                    $('#prompt').slideDown(100);
                    getInfoFalse = true;
                    Loading.HideLoading();
                }
            },
            error: function (data) {
                $("#EjectTitle").html("<spring:message code="pay.payment.tips1"/>");
                $('#eject-mask').fadeIn(100);
                $('#prompt').slideDown(100);
                getInfoFalse = true;
                Loading.HideLoading();
            },
            beforeSend: function () {
//                Loading.ShowLoading();
            },
            complete: function () {
//                Loading.HideLoading();
            }
        });
    }

    function CheckState() {
        var orderId = "${OrderId}";
        $.ajax({
            async: true,
            type: "POST",
            url: "<%=path%>/order/GetOrderState",
            modal: true,
            timeout: 30000,
            data: {
                orderId: orderId
            },
            success: function (data) {
                if (data.status == 1) {
                    orderState = data.orderState;
                    CheckAccount();
                } else {
                    $("#EjectTitle").html("<spring:message code="pay.payment.tips1"/>");
                    $('#eject-mask').fadeIn(100);
                    $('#prompt').slideDown(100);
                    getInfoFalse = true;
                    Loading.HideLoading();
                }
            },
            error: function (data) {
                $("#EjectTitle").html("<spring:message code="pay.payment.tips1"/>");
                $('#eject-mask').fadeIn(100);
                $('#prompt').slideDown(100);
                getInfoFalse = true;
                Loading.HideLoading();
            },
            beforeSend: function () {
//                Loading.ShowLoading();
            },
            complete: function () {
//                Loading.HideLoading();
            }
        });
    }

    function CheckAccount() {
        $.ajax({
            async: true,
            type: "POST",
            url: "<%=path%>/account/checkAccount",
            modal: true,
            timeout: 30000,
            data: {},
            success: function (data) {
                if (data.status == 1) {
                    payCheck = data.needPayCheck;
                    var passwd = data.payPassword;
                    if (passwd == null || passwd == "") {
                        setPassword = false;
                    }
                    $("#isPayCheck").val(payCheck);
                } else {
                    $("#EjectTitle").html("<spring:message code="pay.payment.tips1"/>");
                    $('#eject-mask').fadeIn(100);
                    $('#prompt').slideDown(100);
                    getInfoFalse = true;
                    Loading.HideLoading();
                }
            },
            error: function (data) {
                $("#EjectTitle").html("<spring:message code="pay.payment.tips1"/>");
                $('#eject-mask').fadeIn(100);
                $('#prompt').slideDown(100);
                getInfoFalse = true;
                Loading.HideLoading();
            },
            beforeSend: function () {
//                Loading.ShowLoading();
            },
            complete: function () {
                Loading.HideLoading();
            }
        });
    }

    function BalancePay() {
        if (payCheck == "0") {
            toBalancePay();
        } else {
            if (!setPassword) {
                $("#EjectTitle").html("<spring:message code="pay.payment.pass2"/>");
                $('#eject-mask').fadeIn(100);
                $('#prompt').slideDown(100);
            } else {
                $("#password-tip").html("<spring:message code="pay.payment.pass"/>");
                $("#int-password").val("");
                $('#eject-mask').fadeIn(100);
                $('#password').slideDown(100);
            }
        }
    }

    function toBalancePay() {
        var orderId = "${OrderId}";
        var orderAmount = "${PriceDisplay}";
        var password = $("#int-password").val();
        $.ajax({
            async: true,
            type: "POST",
            url: "<%=path%>/pay/BalancePayment",
            modal: true,
            timeout: 30000,
            data: {
                orderId: orderId,
                orderAmount: orderAmount,
                password: password
            },
            success: function (data) {
                if (data.status == 1) {
                    var payResult = data.payResult;
                    var resultCode = data.resultCode;
                    if (payResult == "success") {
                        var toUrl = "?result=success&OrderId=" + orderId + "&type=pay";
                        window.location.href = '<%=path%>/written/PayResult' + toUrl;
                    } else if (payResult == "fail") {
                        if (resultCode == "6") {
                            $("#password-tip").html("<spring:message code="pay.payment.pass1"/>");
                            $('#eject-mask').fadeIn(100);
                            $('#password').slideDown(100);
                            $("#int-password").val("");
                        } else if (resultCode == "7") {
                            $("#EjectTitle").html("<spring:message code="pay.payment.pass2"/>");
                            $('#eject-mask').fadeIn(100);
                            $('#prompt').slideDown(100);
                        } else if (resultCode == "0") {
                            var toUrl = "?result=fail&OrderId=" + orderId + "&type=pay";
                            window.location.href = '<%=path%>/written/PayResult' + toUrl;
                        }
                    }
                } else {
                    var toUrl = "?result=fail&OrderId=" + orderId + "&type=pay";
                    window.location.href = '<%=path%>/written/PayResult' + toUrl;
                }
            },
            error: function (data) {
                var toUrl = "?result=fail&OrderId=" + orderId + "&type=pay";
                window.location.href = '<%=path%>/written/PayResult' + toUrl;
            },
            beforeSend: function () {
                Loading.ShowLoading();
            },
            complete: function () {
                Loading.HideLoading();
            }
        });
    }

    function toRecharge() {
        window.location.href = '<%=path%>/account/recharge?balance=' + balance;
    }
</script>