<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑器材租赁</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">器材租赁管理</li>
                        <li class="breadcrumb-item active">编辑器材租赁</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">器材租赁信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6 aaaaaa huiyuan">
                                        <label>会员</label>
                                        <div>
                                            <select style="width: 450px" id="huiyuanSelect" name="huiyuanSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 huiyuan">
                                        <label>会员姓名</label>
                                        <input style="width: 450px" id="huiyuanName" name="huiyuanName" class="form-control"
                                               placeholder="会员姓名" readonly>
                                    </div>
                                    <div class="form-group col-md-6 aaaaaa qicai">
                                        <label>器材</label>
                                        <div>
                                            <select style="width: 450px" id="qicaiSelect" name="qicaiSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 qicai">
                                        <label>器材名称</label>
                                        <input style="width: 450px" id="qicaiName" name="qicaiName" class="form-control"
                                               placeholder="器材名称" readonly>
                                    </div>
                                    <div class="form-group col-md-6 qicai">
                                        <label>器材照片</label>
                                        <img id="qicaiPhotoImg" src="" width="100" height="100">
                                    </div>
                                    <div class="form-group col-md-6 qicai">
                                        <label>器材类型</label>
                                        <input style="width: 450px" id="qicaiValue" name="qicaiValue" class="form-control"
                                               placeholder="器材类型" readonly>
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6 qicaiOrderUuidNumberDiv">
                                        <label>租赁流水号</label>
                                        <input style="width: 450px" id="qicaiOrderUuidNumber" name="qicaiOrderUuidNumber" class="form-control"
                                               placeholder="租赁流水号">
                                    </div>
                                <input id="qicaiId" name="qicaiId" type="hidden">
                                <input id="huiyuanId" name="huiyuanId" type="hidden">
                                    <div class="form-group col-md-6 guihuanTimeDiv">
                                        <label>归还时间</label>
                                        <input style="width: 450px" id="guihuanTime-input" name="guihuanTime" type="text" class="form-control layui-input">
                                    </div>
                                    <div class="form-group col-md-6 qicaiZulinTianDiv">
                                        <label>租赁天数</label>
                                        <input style="width: 450px" id="qicaiZulinTian" name="qicaiZulinTian" class="form-control"
                                               onchange="qicaiZulinTianChickValue(this)"  placeholder="租赁天数">
                                    </div>

                                    <div class="form-group col-md-6 qicaiOrderTruePriceDiv">
                                        <label>实付金额</label>
                                        <input style="width: 450px" id="qicaiOrderTruePrice" name="qicaiOrderTruePrice" class="form-control"
                                               onchange="qicaiOrderTruePriceChickValue(this)" placeholder="实付金额">
                                    </div>
                                    <div class="form-group col-md-6 qicaiOrderTypesDiv">
                                        <label>器材租赁状态</label>
                                        <select style="width: 450px" id="qicaiOrderTypesSelect" name="qicaiOrderTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group col-md-12 mb-3">
                                        <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                        <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/laydate.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "qicaiOrder";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var qicaiOrderTypesOptions = [];
        <!-- 级联表的下拉框数组 -->
    var huiyuanOptions = [];
    var qicaiOptions = [];

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            if(window.sessionStorage.getItem('role') != '器材'){//当前登录用户不为这个
                if($("#qicaiId") !=null){
                    var qicaiId = $("#qicaiId").val();
                    if(qicaiId == null || qicaiId =='' || qicaiId == 'null'){
                        alert("器材不能为空");
                        return;
                    }
                }
            }
            if(window.sessionStorage.getItem('role') != '会员'){//当前登录用户不为这个
                if($("#huiyuanId") !=null){
                    var huiyuanId = $("#huiyuanId").val();
                    if(huiyuanId == null || huiyuanId =='' || huiyuanId == 'null'){
                        alert("会员不能为空");
                        return;
                    }
                }
            }
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功';

            }
            httpJson("qicaiOrder/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addqicaiOrder');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function qicaiOrderTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=qicai_order_types", "GET", {}, (res) => {
                if(res.code == 0){
                    qicaiOrderTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->
        function huiyuanSelect() {
            //填充下拉框选项
            http("huiyuan/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    huiyuanOptions = res.data.list;
                }
            });
        }

        function huiyuanSelectOne(id) {
            http("huiyuan/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                huiyuanShowImg();
                huiyuanShowVideo();
                huiyuanDataBind();
            }
        });
        }
        function qicaiSelect() {
            //填充下拉框选项
            http("qicai/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    qicaiOptions = res.data.list;
                }
            });
        }

        function qicaiSelectOne(id) {
            http("qicai/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                qicaiShowImg();
                qicaiShowVideo();
                qicaiDataBind();
            }
        });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationQicaiordertypesSelect(){
            var qicaiOrderTypesSelect = document.getElementById('qicaiOrderTypesSelect');
            if(qicaiOrderTypesSelect != null && qicaiOrderTypesOptions != null  && qicaiOrderTypesOptions.length > 0 ){
                for (var i = 0; i < qicaiOrderTypesOptions.length; i++) {
                    qicaiOrderTypesSelect.add(new Option(qicaiOrderTypesOptions[i].indexName,qicaiOrderTypesOptions[i].codeIndex));
                }
            }
        }

        function initializationhuiyuanSelect() {
            var huiyuanSelect = document.getElementById('huiyuanSelect');
            if(huiyuanSelect != null && huiyuanOptions != null  && huiyuanOptions.length > 0 ) {
                for (var i = 0; i < huiyuanOptions.length; i++) {
                        huiyuanSelect.add(new Option(huiyuanOptions[i].huiyuanName, huiyuanOptions[i].id));
                }

                $("#huiyuanSelect").change(function(e) {
                        huiyuanSelectOne(e.target.value);
                });
            }

        }

        function initializationqicaiSelect() {
            var qicaiSelect = document.getElementById('qicaiSelect');
            if(qicaiSelect != null && qicaiOptions != null  && qicaiOptions.length > 0 ) {
                for (var i = 0; i < qicaiOptions.length; i++) {
                        qicaiSelect.add(new Option(qicaiOptions[i].qicaiName, qicaiOptions[i].id));
                }

                $("#qicaiSelect").change(function(e) {
                        qicaiSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var qicaiOrderTypesSelect = document.getElementById("qicaiOrderTypesSelect");
        if(qicaiOrderTypesSelect != null && qicaiOrderTypesOptions != null  && qicaiOrderTypesOptions.length > 0 ) {
            for (var i = 0; i < qicaiOrderTypesOptions.length; i++) {
                if (qicaiOrderTypesOptions[i].codeIndex == ruleForm.qicaiOrderTypes) {//下拉框value对比,如果一致就赋值汉字
                        qicaiOrderTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
            var huiyuanSelect = document.getElementById("huiyuanSelect");
            if(huiyuanSelect != null && huiyuanOptions != null  && huiyuanOptions.length > 0 ) {
                for (var i = 0; i < huiyuanOptions.length; i++) {
                    if (huiyuanOptions[i].id == ruleForm.huiyuanId) {//下拉框value对比,如果一致就赋值汉字
                        huiyuanSelect.options[i+1].selected = true;
                        $("#huiyuanSelect" ).selectpicker('refresh');
                    }
                }
            }
            var qicaiSelect = document.getElementById("qicaiSelect");
            if(qicaiSelect != null && qicaiOptions != null  && qicaiOptions.length > 0 ) {
                for (var i = 0; i < qicaiOptions.length; i++) {
                    if (qicaiOptions[i].id == ruleForm.qicaiId) {//下拉框value对比,如果一致就赋值汉字
                        qicaiSelect.options[i+1].selected = true;
                        $("#qicaiSelect" ).selectpicker('refresh');
                    }
                }
            }
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
    }
    //数字检查
        <!-- 当前表的数字检查 -->
        function qicaiZulinTianChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[1-9][0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }
        function qicaiOrderTruePriceChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[0-9]{0,6}(\.[0-9]{1,2})?$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("只允许输入整数6位,小数2位的数字");
                return false;
            }
        }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addqicaiOrder');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                qicaiOrderUuidNumber: "required",
                qicaiId: "required",
                huiyuanId: "required",
                guihuanTime: "required",
                qicaiZulinTian: "required",
                qicaiOrderTruePrice: "required",
                qicaiOrderTypes: "required",
            },
            messages: {
                qicaiOrderUuidNumber: "租赁流水号不能为空",
                qicaiId: "器材不能为空",
                huiyuanId: "会员不能为空",
                guihuanTime: "归还时间不能为空",
                qicaiZulinTian: "租赁天数不能为空",
                qicaiOrderTruePrice: "实付金额不能为空",
                qicaiOrderTypes: "器材租赁状态不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addqicaiOrder = window.sessionStorage.getItem("addqicaiOrder");
        if (addqicaiOrder != null && addqicaiOrder != "" && addqicaiOrder != "null") {
            //注册表单验证
            $(validform());
            $("#qicaiOrderUuidNumber").val(new Date().getTime()+Math.ceil(Math.random()*10));//设置唯一号

            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("qicaiOrder/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 设置视频src
                    showVideo();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {
        var insertTime = laydate.render({
            elem: '#insertTime-input'
            ,type: 'date'
        });
        var guihuanTime = laydate.render({
            elem: '#guihuanTime-input'
            ,type: 'date'
        });
    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        huiyuanDataBind();
        qicaiDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#qicaiOrderUuidNumber").val(ruleForm.qicaiOrderUuidNumber);
        $("#qicaiId").val(ruleForm.qicaiId);
        $("#huiyuanId").val(ruleForm.huiyuanId);
        $("#guihuanTime-input").val(ruleForm.guihuanTime);
        $("#qicaiZulinTian").val(ruleForm.qicaiZulinTian);
        $("#qicaiOrderTruePrice").val(ruleForm.qicaiOrderTruePrice);

    }
    <!--  级联表的数据回显  -->
    function huiyuanDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#huiyuanId").val(ruleForm.id);

        $("#huiyuanUuidNumber").val(ruleForm.huiyuanUuidNumber);
        $("#huiyuanName").val(ruleForm.huiyuanName);
        $("#huiyuanPhone").val(ruleForm.huiyuanPhone);
        $("#huiyuanIdNumber").val(ruleForm.huiyuanIdNumber);
        $("#huiyuanEmail").val(ruleForm.huiyuanEmail);
        $("#newMoney").val(ruleForm.newMoney);
    }

    function qicaiDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#qicaiId").val(ruleForm.id);

        $("#qicaiName").val(ruleForm.qicaiName);
        $("#qicaiUuidNumber").val(ruleForm.qicaiUuidNumber);
        $("#qicaiValue").val(ruleForm.qicaiValue);
        $("#qicaiKucunNumber").val(ruleForm.qicaiKucunNumber);
        $("#qicaiOldMoney").val(ruleForm.qicaiOldMoney);
        $("#qicaiNewMoney").val(ruleForm.qicaiNewMoney);
        $("#qicaiClicknum").val(ruleForm.qicaiClicknum);
        $("#qicaiContent").val(ruleForm.qicaiContent);
        $("#shangxiaValue").val(ruleForm.shangxiaValue);
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
        huiyuanShowImg();
        qicaiShowImg();
    }


    <!--  级联表的图片  -->

    function huiyuanShowImg() {
        $("#huiyuanPhotoImg").attr("src",ruleForm.huiyuanPhoto);
    }


    function qicaiShowImg() {
        $("#qicaiPhotoImg").attr("src",ruleForm.qicaiPhoto);
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        huiyuanShowVideo();
        qicaiShowVideo();
    }


    <!--  级联表的视频  -->

    function huiyuanShowVideo() {
        $("#huiyuanPhotoV").attr("src",ruleForm.huiyuanPhoto);
    }

    function qicaiShowVideo() {
        $("#qicaiPhotoV").attr("src",ruleForm.qicaiPhoto);
    }



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            qicaiOrderTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            huiyuanSelect();
            qicaiSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationQicaiordertypesSelect();
            <!--  初始化级联表的下拉框  -->
            initializationhuiyuanSelect();
            initializationqicaiSelect();

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
        window.sessionStorage.removeItem('addqicaiOrder');
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') == '管理员') {
            //$('#jifen').attr('readonly', 'readonly');
            //$('#role').attr('style', 'pointer-events:none;width:450px;');
        }
		else if (window.sessionStorage.getItem('role') == '会员') {
            // $(".aaaaaa").remove();
            $(".huiyuan").remove();//删除当前用户的信息
        }
		else if (window.sessionStorage.getItem('role') == '员工') {
            // $(".aaaaaa").remove();
            $(".yuangong").remove();//删除当前用户的信息
        }
        else{
            // alert("未知情况.......");
            // var replyTextUeditor = UE.getEditor('replyTextEditor');
            // replyTextUeditor.ready(function () {
            //     replyTextUeditor.setDisabled('fullscreen');
            // });
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>
