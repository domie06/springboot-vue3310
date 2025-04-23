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
                    <h3 class="block-title">编辑场地预约</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">场地预约管理</li>
                        <li class="breadcrumb-item active">编辑场地预约</li>
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
                        <h3 class="widget-title">场地预约信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6 aaaaaa changdi">
                                        <label>场地</label>
                                        <div>
                                            <select style="width: 450px" id="changdiSelect" name="changdiSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 changdi">
                                        <label>场地名称</label>
                                        <input style="width: 450px" id="changdiName" name="changdiName" class="form-control"
                                               placeholder="场地名称" readonly>
                                    </div>
                                    <div class="form-group col-md-6 changdi">
                                        <label>场地照片</label>
                                        <img id="changdiPhotoImg" src="" width="100" height="100">
                                    </div>
                                    <div class="form-group col-md-6 changdi">
                                        <label>场地类型</label>
                                        <input style="width: 450px" id="changdiValue" name="changdiValue" class="form-control"
                                               placeholder="场地类型" readonly>
                                    </div>
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
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6 changdiOrderUuidNumberDiv">
                                        <label>预约流水号</label>
                                        <input style="width: 450px" id="changdiOrderUuidNumber" name="changdiOrderUuidNumber" class="form-control"
                                               placeholder="预约流水号">
                                    </div>
                                <input id="changdiId" name="changdiId" type="hidden">
                                <input id="huiyuanId" name="huiyuanId" type="hidden">
                                    <div class="form-group col-md-6 yuyueTimeDiv">
                                        <label>预约日期</label>
                                        <input style="width: 450px" id="yuyueTime-input" name="yuyueTime" type="text" class="form-control layui-input">
                                    </div>
                                    <div class="form-group col-md-6 changdiOrderTruePriceDiv">
                                        <label>实付金额</label>
                                        <input style="width: 450px" id="changdiOrderTruePrice" name="changdiOrderTruePrice" class="form-control"
                                               onchange="changdiOrderTruePriceChickValue(this)" placeholder="实付金额">
                                    </div>
                                    <div class="form-group col-md-6 changdiOrderTypesDiv">
                                        <label>场地预约状态</label>
                                        <select style="width: 450px" id="changdiOrderTypesSelect" name="changdiOrderTypes" class="form-control">
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

    var tableName = "changdiOrder";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var changdiOrderTypesOptions = [];
        <!-- 级联表的下拉框数组 -->
    var changdiOptions = [];
    var huiyuanOptions = [];

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
            if(window.sessionStorage.getItem('role') != '场地'){//当前登录用户不为这个
                if($("#changdiId") !=null){
                    var changdiId = $("#changdiId").val();
                    if(changdiId == null || changdiId =='' || changdiId == 'null'){
                        alert("场地不能为空");
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
            httpJson("changdiOrder/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addchangdiOrder');
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
        function changdiOrderTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=changdi_order_types", "GET", {}, (res) => {
                if(res.code == 0){
                    changdiOrderTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->
        function changdiSelect() {
            //填充下拉框选项
            http("changdi/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    changdiOptions = res.data.list;
                }
            });
        }

        function changdiSelectOne(id) {
            http("changdi/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                changdiShowImg();
                changdiShowVideo();
                changdiDataBind();
            }
        });
        }
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



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationChangdiordertypesSelect(){
            var changdiOrderTypesSelect = document.getElementById('changdiOrderTypesSelect');
            if(changdiOrderTypesSelect != null && changdiOrderTypesOptions != null  && changdiOrderTypesOptions.length > 0 ){
                for (var i = 0; i < changdiOrderTypesOptions.length; i++) {
                    changdiOrderTypesSelect.add(new Option(changdiOrderTypesOptions[i].indexName,changdiOrderTypesOptions[i].codeIndex));
                }
            }
        }

        function initializationchangdiSelect() {
            var changdiSelect = document.getElementById('changdiSelect');
            if(changdiSelect != null && changdiOptions != null  && changdiOptions.length > 0 ) {
                for (var i = 0; i < changdiOptions.length; i++) {
                        changdiSelect.add(new Option(changdiOptions[i].changdiName, changdiOptions[i].id));
                }

                $("#changdiSelect").change(function(e) {
                        changdiSelectOne(e.target.value);
                });
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



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var changdiOrderTypesSelect = document.getElementById("changdiOrderTypesSelect");
        if(changdiOrderTypesSelect != null && changdiOrderTypesOptions != null  && changdiOrderTypesOptions.length > 0 ) {
            for (var i = 0; i < changdiOrderTypesOptions.length; i++) {
                if (changdiOrderTypesOptions[i].codeIndex == ruleForm.changdiOrderTypes) {//下拉框value对比,如果一致就赋值汉字
                        changdiOrderTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
            var changdiSelect = document.getElementById("changdiSelect");
            if(changdiSelect != null && changdiOptions != null  && changdiOptions.length > 0 ) {
                for (var i = 0; i < changdiOptions.length; i++) {
                    if (changdiOptions[i].id == ruleForm.changdiId) {//下拉框value对比,如果一致就赋值汉字
                        changdiSelect.options[i+1].selected = true;
                        $("#changdiSelect" ).selectpicker('refresh');
                    }
                }
            }
            var huiyuanSelect = document.getElementById("huiyuanSelect");
            if(huiyuanSelect != null && huiyuanOptions != null  && huiyuanOptions.length > 0 ) {
                for (var i = 0; i < huiyuanOptions.length; i++) {
                    if (huiyuanOptions[i].id == ruleForm.huiyuanId) {//下拉框value对比,如果一致就赋值汉字
                        huiyuanSelect.options[i+1].selected = true;
                        $("#huiyuanSelect" ).selectpicker('refresh');
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
        function changdiOrderTruePriceChickValue(e){
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
        window.sessionStorage.removeItem('addchangdiOrder');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                changdiOrderUuidNumber: "required",
                changdiId: "required",
                huiyuanId: "required",
                yuyueTime: "required",
                changdiOrderTruePrice: "required",
                changdiOrderTypes: "required",
            },
            messages: {
                changdiOrderUuidNumber: "预约流水号不能为空",
                changdiId: "场地不能为空",
                huiyuanId: "会员不能为空",
                yuyueTime: "预约日期不能为空",
                changdiOrderTruePrice: "实付金额不能为空",
                changdiOrderTypes: "场地预约状态不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addchangdiOrder = window.sessionStorage.getItem("addchangdiOrder");
        if (addchangdiOrder != null && addchangdiOrder != "" && addchangdiOrder != "null") {
            //注册表单验证
            $(validform());
            $("#changdiOrderUuidNumber").val(new Date().getTime()+Math.ceil(Math.random()*10));//设置唯一号

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
            http("changdiOrder/info/" + updateId, "GET", {}, (res) => {
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
        var yuyueTime = laydate.render({
            elem: '#yuyueTime-input'
            ,type: 'date'
        });
        var insertTime = laydate.render({
            elem: '#insertTime-input'
            ,type: 'datetime'
        });
    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        changdiDataBind();
        huiyuanDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#changdiOrderUuidNumber").val(ruleForm.changdiOrderUuidNumber);
        $("#changdiId").val(ruleForm.changdiId);
        $("#huiyuanId").val(ruleForm.huiyuanId);
        $("#yuyueTime-input").val(ruleForm.yuyueTime);
        $("#changdiOrderTruePrice").val(ruleForm.changdiOrderTruePrice);

    }
    <!--  级联表的数据回显  -->
    function changdiDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#changdiId").val(ruleForm.id);

        $("#changdiName").val(ruleForm.changdiName);
        $("#changdiUuidNumber").val(ruleForm.changdiUuidNumber);
        $("#changdiValue").val(ruleForm.changdiValue);
        $("#changdiOldMoney").val(ruleForm.changdiOldMoney);
        $("#changdiNewMoney").val(ruleForm.changdiNewMoney);
        $("#changdiContent").val(ruleForm.changdiContent);
        $("#shangxiaValue").val(ruleForm.shangxiaValue);
    }

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


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
        changdiShowImg();
        huiyuanShowImg();
    }


    <!--  级联表的图片  -->

    function changdiShowImg() {
        $("#changdiPhotoImg").attr("src",ruleForm.changdiPhoto);
    }


    function huiyuanShowImg() {
        $("#huiyuanPhotoImg").attr("src",ruleForm.huiyuanPhoto);
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        changdiShowVideo();
        huiyuanShowVideo();
    }


    <!--  级联表的视频  -->

    function changdiShowVideo() {
        $("#changdiPhotoV").attr("src",ruleForm.changdiPhoto);
    }

    function huiyuanShowVideo() {
        $("#huiyuanPhotoV").attr("src",ruleForm.huiyuanPhoto);
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
            changdiOrderTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            changdiSelect();
            huiyuanSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationChangdiordertypesSelect();
            <!--  初始化级联表的下拉框  -->
            initializationchangdiSelect();
            initializationhuiyuanSelect();

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
        window.sessionStorage.removeItem('addchangdiOrder');
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
