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
                    <h3 class="block-title">编辑器材维护</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">器材维护管理</li>
                        <li class="breadcrumb-item active">编辑器材维护</li>
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
                        <h3 class="widget-title">器材维护信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
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
                                        <label>器材编号</label>
                                        <input style="width: 450px" id="qicaiUuidNumber" name="qicaiUuidNumber" class="form-control"
                                               placeholder="器材编号" readonly>
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
                                    <div class="form-group col-md-6 qicai">
                                        <label>器材租赁原价/天</label>
                                        <input style="width: 450px" id="qicaiOldMoney" name="qicaiOldMoney" class="form-control"
                                               placeholder="器材租赁原价/天" readonly>
                                    </div>
                                    <div class="form-group col-md-6 qicai">
                                        <label>器材租赁现价/天</label>
                                        <input style="width: 450px" id="qicaiNewMoney" name="qicaiNewMoney" class="form-control"
                                               placeholder="器材租赁现价/天" readonly>
                                    </div>
                                    <div class="form-group col-md-6 aaaaaa yuangong">
                                        <label>员工</label>
                                        <div>
                                            <select style="width: 450px" id="yuangongSelect" name="yuangongSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 yuangong">
                                        <label>员工编号</label>
                                        <input style="width: 450px" id="yuangongUuidNumber" name="yuangongUuidNumber" class="form-control"
                                               placeholder="员工编号" readonly>
                                    </div>
                                    <div class="form-group col-md-6 yuangong">
                                        <label>员工姓名</label>
                                        <input style="width: 450px" id="yuangongName" name="yuangongName" class="form-control"
                                               placeholder="员工姓名" readonly>
                                    </div>
                                    <div class="form-group col-md-6 yuangong">
                                        <label>员工手机号</label>
                                        <input style="width: 450px" id="yuangongPhone" name="yuangongPhone" class="form-control"
                                               placeholder="员工手机号" readonly>
                                    </div>
                                    <div class="form-group col-md-6 yuangong">
                                        <label>员工头像</label>
                                        <img id="yuangongPhotoImg" src="" width="100" height="100">
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                <input id="qicaiId" name="qicaiId" type="hidden">
                                <input id="yuangongId" name="yuangongId" type="hidden">
                                    <div class="form-group col-md-6 qicaiWeihuUuidNumberDiv">
                                        <label>维护编号</label>
                                        <input style="width: 450px" id="qicaiWeihuUuidNumber" name="qicaiWeihuUuidNumber" class="form-control"
                                               placeholder="维护编号">
                                    </div>
                                    <div class="form-group col-md-6 qicaiWeihuTypesDiv">
                                        <label>器材维护类型</label>
                                        <select style="width: 450px" id="qicaiWeihuTypesSelect" name="qicaiWeihuTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group  col-md-6 qicaiWeihuContentDiv">
                                        <label>器材维护详情</label>
                                        <input id="qicaiWeihuContentupload" name="file" type="file">
                                        <script id="qicaiWeihuContentEditor" type="text/plain"
                                                style="width:100%;height:230px;"></script>
                                        <script type = "text/javascript" >
                                        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                        //相见文档配置属于你自己的编译器
                                        var qicaiWeihuContentUe = UE.getEditor('qicaiWeihuContentEditor', {
                                            toolbars: [
                                                [
                                                    'undo', //撤销
                                                    'bold', //加粗
                                                    'redo', //重做
                                                    'underline', //下划线
                                                    'horizontal', //分隔线
                                                    'inserttitle', //插入标题
                                                    'cleardoc', //清空文档
                                                    'fontfamily', //字体
                                                    'fontsize', //字号
                                                    'paragraph', //段落格式
                                                    'inserttable', //插入表格
                                                    'justifyleft', //居左对齐
                                                    'justifyright', //居右对齐
                                                    'justifycenter', //居中对
                                                    'justifyjustify', //两端对齐
                                                    'forecolor', //字体颜色
                                                    'fullscreen', //全屏
                                                    'edittip ', //编辑提示
                                                    'customstyle', //自定义标题
                                                ]
                                            ]
                                        });
                                        </script>
                                        <input type="hidden" name="qicaiWeihuContent" id="qicaiWeihuContent-input">
                                    </div>
                                    <div class="form-group col-md-6 weihuTimeDiv">
                                        <label>维护时间</label>
                                        <input style="width: 450px" id="weihuTime-input" name="weihuTime" type="text" class="form-control layui-input">
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

    var tableName = "qicaiWeihu";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var qicaiWeihuTypesOptions = [];
        <!-- 级联表的下拉框数组 -->
    var qicaiOptions = [];
    var yuangongOptions = [];

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

        $('#qicaiWeihuContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('qicaiWeihuContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });


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
            if(window.sessionStorage.getItem('role') != '员工'){//当前登录用户不为这个
                if($("#yuangongId") !=null){
                    var yuangongId = $("#yuangongId").val();
                    if(yuangongId == null || yuangongId =='' || yuangongId == 'null'){
                        alert("员工不能为空");
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
            httpJson("qicaiWeihu/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addqicaiWeihu');
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
        function qicaiWeihuTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=qicai_weihu_types", "GET", {}, (res) => {
                if(res.code == 0){
                    qicaiWeihuTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->
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
        function yuangongSelect() {
            //填充下拉框选项
            http("yuangong/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    yuangongOptions = res.data.list;
                }
            });
        }

        function yuangongSelectOne(id) {
            http("yuangong/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                yuangongShowImg();
                yuangongShowVideo();
                yuangongDataBind();
            }
        });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationQicaiweihutypesSelect(){
            var qicaiWeihuTypesSelect = document.getElementById('qicaiWeihuTypesSelect');
            if(qicaiWeihuTypesSelect != null && qicaiWeihuTypesOptions != null  && qicaiWeihuTypesOptions.length > 0 ){
                for (var i = 0; i < qicaiWeihuTypesOptions.length; i++) {
                    qicaiWeihuTypesSelect.add(new Option(qicaiWeihuTypesOptions[i].indexName,qicaiWeihuTypesOptions[i].codeIndex));
                }
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

        function initializationyuangongSelect() {
            var yuangongSelect = document.getElementById('yuangongSelect');
            if(yuangongSelect != null && yuangongOptions != null  && yuangongOptions.length > 0 ) {
                for (var i = 0; i < yuangongOptions.length; i++) {
                        yuangongSelect.add(new Option(yuangongOptions[i].yuangongName, yuangongOptions[i].id));
                }

                $("#yuangongSelect").change(function(e) {
                        yuangongSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var qicaiWeihuTypesSelect = document.getElementById("qicaiWeihuTypesSelect");
        if(qicaiWeihuTypesSelect != null && qicaiWeihuTypesOptions != null  && qicaiWeihuTypesOptions.length > 0 ) {
            for (var i = 0; i < qicaiWeihuTypesOptions.length; i++) {
                if (qicaiWeihuTypesOptions[i].codeIndex == ruleForm.qicaiWeihuTypes) {//下拉框value对比,如果一致就赋值汉字
                        qicaiWeihuTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
            var qicaiSelect = document.getElementById("qicaiSelect");
            if(qicaiSelect != null && qicaiOptions != null  && qicaiOptions.length > 0 ) {
                for (var i = 0; i < qicaiOptions.length; i++) {
                    if (qicaiOptions[i].id == ruleForm.qicaiId) {//下拉框value对比,如果一致就赋值汉字
                        qicaiSelect.options[i+1].selected = true;
                        $("#qicaiSelect" ).selectpicker('refresh');
                    }
                }
            }
            var yuangongSelect = document.getElementById("yuangongSelect");
            if(yuangongSelect != null && yuangongOptions != null  && yuangongOptions.length > 0 ) {
                for (var i = 0; i < yuangongOptions.length; i++) {
                    if (yuangongOptions[i].id == ruleForm.yuangongId) {//下拉框value对比,如果一致就赋值汉字
                        yuangongSelect.options[i+1].selected = true;
                        $("#yuangongSelect" ).selectpicker('refresh');
                    }
                }
            }
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
        if (ruleForm.qicaiWeihuContent != null && ruleForm.qicaiWeihuContent != 'null' && ruleForm.qicaiWeihuContent != '' && $("#qicaiWeihuContentupload").length>0) {

            var qicaiWeihuContentUeditor = UE.getEditor('qicaiWeihuContentEditor');
            qicaiWeihuContentUeditor.ready(function () {
                var mes = '';
                if(ruleForm.qicaiWeihuContent != null){
                    mes = ''+ ruleForm.qicaiWeihuContent;
                    // mes = mes.replace(/\n/g, "<br>");
                }
                qicaiWeihuContentUeditor.setContent(mes);
            });
        }
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
        if($("#qicaiWeihuContentupload").length>0) {
            var qicaiWeihuContentEditor = UE.getEditor('qicaiWeihuContentEditor');
            if (qicaiWeihuContentEditor.hasContents()) {
                $('#qicaiWeihuContent-input').attr('value', qicaiWeihuContentEditor.getContent());
            }
        }
    }
    //数字检查
        <!-- 当前表的数字检查 -->

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addqicaiWeihu');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                qicaiId: "required",
                yuangongId: "required",
                qicaiWeihuUuidNumber: "required",
                qicaiWeihuTypes: "required",
                qicaiWeihuContent: "required",
                weihuTime: "required",
            },
            messages: {
                qicaiId: "器材不能为空",
                yuangongId: "员工不能为空",
                qicaiWeihuUuidNumber: "维护编号不能为空",
                qicaiWeihuTypes: "器材维护类型不能为空",
                qicaiWeihuContent: "器材维护详情不能为空",
                weihuTime: "维护时间不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addqicaiWeihu = window.sessionStorage.getItem("addqicaiWeihu");
        if (addqicaiWeihu != null && addqicaiWeihu != "" && addqicaiWeihu != "null") {
            //注册表单验证
            $(validform());
            $("#qicaiWeihuUuidNumber").val(new Date().getTime()+Math.ceil(Math.random()*10));//设置唯一号

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
            http("qicaiWeihu/info/" + updateId, "GET", {}, (res) => {
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
        var weihuTime = laydate.render({
            elem: '#weihuTime-input'
            ,type: 'datetime'
        });
        var insertTime = laydate.render({
            elem: '#insertTime-input'
            ,type: 'datetime'
        });
    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        qicaiDataBind();
        yuangongDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#qicaiId").val(ruleForm.qicaiId);
        $("#yuangongId").val(ruleForm.yuangongId);
        $("#qicaiWeihuUuidNumber").val(ruleForm.qicaiWeihuUuidNumber);
        $("#qicaiWeihuContent").val(ruleForm.qicaiWeihuContent);
        $("#weihuTime-input").val(ruleForm.weihuTime);

    }
    <!--  级联表的数据回显  -->
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

    function yuangongDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#yuangongId").val(ruleForm.id);

        $("#yuangongUuidNumber").val(ruleForm.yuangongUuidNumber);
        $("#yuangongName").val(ruleForm.yuangongName);
        $("#yuangongPhone").val(ruleForm.yuangongPhone);
        $("#yuangongIdNumber").val(ruleForm.yuangongIdNumber);
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
        qicaiShowImg();
        yuangongShowImg();
    }


    <!--  级联表的图片  -->

    function qicaiShowImg() {
        $("#qicaiPhotoImg").attr("src",ruleForm.qicaiPhoto);
    }


    function yuangongShowImg() {
        $("#yuangongPhotoImg").attr("src",ruleForm.yuangongPhoto);
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        qicaiShowVideo();
        yuangongShowVideo();
    }


    <!--  级联表的视频  -->

    function qicaiShowVideo() {
        $("#qicaiPhotoV").attr("src",ruleForm.qicaiPhoto);
    }

    function yuangongShowVideo() {
        $("#yuangongPhotoV").attr("src",ruleForm.yuangongPhoto);
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
            qicaiWeihuTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            qicaiSelect();
            yuangongSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationQicaiweihutypesSelect();
            <!--  初始化级联表的下拉框  -->
            initializationqicaiSelect();
            initializationyuangongSelect();

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
        window.sessionStorage.removeItem('addqicaiWeihu');
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
