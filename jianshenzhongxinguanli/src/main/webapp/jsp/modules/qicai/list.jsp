<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">


    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <!-- layui -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
</head>
<style>

</style>
<body>
    <div class="modal fade" id="plusOrReduceQicaiKucunNumberModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <%-- 模态框标题--%>
                <div class="modal-header">
                    <h5 class="modal-title" id="plusOrReduceQicaiKucunNumberTitle">增加或减少库存</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%-- 模态框内容 --%>
                <div class="modal-body">
                    数量:<input type="number" id="plusOrReduceQicaiKucunNumber" style="width: 300px;" class="form-control form-control-sm"
                              placeholder="数量" aria-controls="tableId" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                    <input type="hidden" id="qicaiId">
                    <input type="hidden" id="hideflag">
                    <input type="hidden" id="thisQicaiKucunNumber">
                </div>
                <%-- 模态框按钮 --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="submitPlusOrReduceQicaiKucunNumber()" class="btn btn-primary">提交</button>
                </div>
            </div>
        </div>
    </div>



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
                        <h3 class="block-title">器材管理</h3>
                    </div>
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/index.jsp">
                                    <span class="ti-home"></span>
                                </a>
                            </li>
                            <li class="breadcrumb-item">器材管理</li>
                            <li class="breadcrumb-item active">器材列表</li>
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
                            <h3 class="widget-title">器材列表</h3>
                            <div class="table-responsive mb-3">
                                <div class="col-sm-12">
                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        器材名称
                                        <div class="layui-input-inline">
                                            <input type="text" id="qicaiNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="器材名称" aria-controls="tableId">
                                        </div>
                                    </div>
                                     
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        器材编号
                                        <div class="layui-input-inline">
                                            <input type="text" id="qicaiUuidNumberSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="器材编号" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        器材类型
                                        <div class="layui-input-inline">
                                            <select name="qicaiTypesSelectSearch"  style="width: 150px;" id="qicaiTypesSelectSearch" class="form-control form-control-sm"
                                                    aria-controls="tableId">
                                            </select>
                                        </div>
                                    </div>
                                                                                                                                                                                                                                                                                                

                                    <div class="layui-inline" style="margin-left: 30px;margin-bottom: 10px;">
                                        <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                        <button onclick="add()" type="button" class="btn btn-primary 新增">添加</button>
                                        <button onclick="graph()" type="button" class="btn btn-primary 报表">报表</button>
                                        <button onclick="exportExcel()" type="button" class="btn btn-success 导入导出"><i class="fa fa-file-excel-o" aria-hidden="true"></i>导出</button>
                                        <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
                                    </div>
                                </div>
                                <table id="tableId" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th class="no-sort" style="min-width: 35px;">
                                            <div class="custom-control custom-checkbox">
                                                <input class="custom-control-input" type="checkbox" id="select-all"
                                                       onclick="chooseAll()">
                                                <label class="custom-control-label" for="select-all"></label>
                                            </div>
                                        </th>

                                        <th>器材名称</th>
                                        <th>器材编号</th>
                                        <th>器材照片</th>
                                        <th>器材类型</th>
                                        <th>器材数量</th>
                                        <th>器材租赁原价/天</th>
                                        <th>器材租赁现价/天</th>
                                        <th>器材热度</th>
                                        <th>是否上架</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="thisTbody">
                                    </tbody>
                                </table>
                                <div class="col-md-6 col-sm-3">
                                    <div class="dataTables_length" id="tableId_length">

                                        <select name="tableId_length" aria-controls="tableId" id="selectPageSize"
                                                onchange="changePageSize()">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                        条 每页

                                    </div>
                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-end">
                                        <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')">
                                            <a class="page-link" href="#" tabindex="-1">上一页</a>
                                        </li>

                                        <li class="page-item" id="tableId_next" onclick="pageNumChange('next')">
                                            <a class="page-link" href="#">下一页</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
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
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/excel-gen.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/jszip.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/FileSaver.js"></script>
    <script>

        <%@ include file="../../utils/menu.jsp"%>
        <%@ include file="../../static/setMenu.js"%>
        <%@ include file="../../utils/baseUrl.jsp"%>
        <%@ include file="../../static/getRoleButtons.js"%>
        <%@ include file="../../static/crossBtnControl.js"%>
        var tableName = "qicai";
        var pageType = "list";
        var searchForm = {key: ""};
        var pageIndex = 1;
        var pageSize = 10;
        var totalPage = 0;
        var dataList = [];
        var sortColumn = '';
        var sortOrder = '';
        var ids = [];
        var checkAll = false;

        <!-- 级联表的级联字典表 -->

        <!-- 本表的级联字段表 -->
        var qicaiTypesOptions = [];

        function init() {
            // 满足条件渲染提醒接口
        }

        // 改变每页记录条数
        function changePageSize() {
            var selection = document.getElementById('selectPageSize');
            var index = selection.selectedIndex;
            pageSize = selection.options[index].value;
            getDataList();
        }



        // 查询
        function search() {
            searchForm = {key: ""};

        <!-- 级联表的级联字典表 -->
    <!-- 本表的查询条件 -->

         
            //器材名称
            var qicaiNameSearchInput = $('#qicaiNameSearch');
            if( qicaiNameSearchInput != null){
                if (qicaiNameSearchInput.val() != null && qicaiNameSearchInput.val() != '') {
                    searchForm.qicaiName = $('#qicaiNameSearch').val();
                }
            }
     
            //器材编号
            var qicaiUuidNumberSearchInput = $('#qicaiUuidNumberSearch');
            if( qicaiUuidNumberSearchInput != null){
                if (qicaiUuidNumberSearchInput.val() != null && qicaiUuidNumberSearchInput.val() != '') {
                    searchForm.qicaiUuidNumber = $('#qicaiUuidNumberSearch').val();
                }
            }
         
                //器材类型
            var qicaiTypesSelectSearchInput = document.getElementById("qicaiTypesSelectSearch");
            if(qicaiTypesSelectSearchInput != null){
                var qicaiTypesIndex = qicaiTypesSelectSearchInput.selectedIndex;
                if( qicaiTypesIndex  != 0){
                    searchForm.qicaiTypes= document.getElementById("qicaiTypesSelectSearch").options[qicaiTypesIndex].value;
                }
            }
                                            getDataList();
        }

        // 获取数据列表
        function getDataList() {
            http("qicai/page", "GET", {
                page: pageIndex,
                limit: pageSize,
                sort: sortColumn,
                order: sortOrder,
                qicaiDelete: 1,
                //本表的
                qicaiName: searchForm.qicaiName,
                qicaiUuidNumber: searchForm.qicaiUuidNumber,
                qicaiTypes: searchForm.qicaiTypes,
            //级联表的

            }, (res) => {
                if(res.code == 0) {
                    clear();
                    $("#thisTbody").html("");
                    dataList = res.data.list;
                    totalPage = res.data.totalPage;
                    for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据  
                        var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据 
                        $('#thisTbody').append(trow);
                    }
                    pagination(); //渲染翻页组件
                    getRoleButtons();// 权限按钮控制
                }
            });
        }

        // 渲染表格数据
        function setDataRow(item, number) {
            //创建行 
            var row = document.createElement('tr');
            row.setAttribute('class', 'useOnce');
            //创建勾选框
            var checkbox = document.createElement('td');
            var checkboxDiv = document.createElement('div');
            checkboxDiv.setAttribute("class", "custom-control custom-checkbox");
            var checkboxInput = document.createElement('input');
            checkboxInput.setAttribute("class", "custom-control-input");
            checkboxInput.setAttribute("type", "checkbox");
            checkboxInput.setAttribute('name', 'chk');
            checkboxInput.setAttribute('value', item.id);
            checkboxInput.setAttribute("id", number);
            checkboxDiv.appendChild(checkboxInput);
            var checkboxLabel = document.createElement('label');
            checkboxLabel.setAttribute("class", "custom-control-label");
            checkboxLabel.setAttribute("for", number);
            checkboxDiv.appendChild(checkboxLabel);
            checkbox.appendChild(checkboxDiv);
            row.appendChild(checkbox)


            //器材名称
            var qicaiNameCell = document.createElement('td');
            qicaiNameCell.innerHTML = item.qicaiName;
            row.appendChild(qicaiNameCell);


            //器材编号
            var qicaiUuidNumberCell = document.createElement('td');
            qicaiUuidNumberCell.innerHTML = item.qicaiUuidNumber;
            row.appendChild(qicaiUuidNumberCell);

                //器材照片
            var qicaiPhotoCell = document.createElement('td');
            var qicaiPhotoImg = document.createElement('img');
            var qicaiPhotoImgValue = item.qicaiPhoto;
            if(qicaiPhotoImgValue !=null && qicaiPhotoImgValue !='' && qicaiPhotoImgValue !='null'){
                qicaiPhotoImg.setAttribute('src', qicaiPhotoImgValue);
                qicaiPhotoImg.setAttribute('height', 100);
                qicaiPhotoImg.setAttribute('width', 100);
                qicaiPhotoCell.appendChild(qicaiPhotoImg);
            }else{
                qicaiPhotoCell.innerHTML = "暂无图片";
            }
            row.appendChild(qicaiPhotoCell);

            //器材类型
            var qicaiTypesCell = document.createElement('td');
            qicaiTypesCell.innerHTML = item.qicaiValue;
            row.appendChild(qicaiTypesCell);


            //器材数量
            var qicaiKucunNumberCell = document.createElement('td');
            qicaiKucunNumberCell.innerHTML = item.qicaiKucunNumber;
            row.appendChild(qicaiKucunNumberCell);


            //器材租赁原价/天
            var qicaiOldMoneyCell = document.createElement('td');
            qicaiOldMoneyCell.innerHTML = item.qicaiOldMoney;
            row.appendChild(qicaiOldMoneyCell);


            //器材租赁现价/天
            var qicaiNewMoneyCell = document.createElement('td');
            qicaiNewMoneyCell.innerHTML = item.qicaiNewMoney;
            row.appendChild(qicaiNewMoneyCell);


            //器材热度
            var qicaiClicknumCell = document.createElement('td');
            qicaiClicknumCell.innerHTML = item.qicaiClicknum;
            row.appendChild(qicaiClicknumCell);


            //是否上架
            var shangxiaTypesCell = document.createElement('td');
            shangxiaTypesCell.innerHTML = item.shangxiaValue;
            row.appendChild(shangxiaTypesCell);



            //每行按钮
            var btnGroup = document.createElement('td');

            //详情按钮
            var detailBtn = document.createElement('button');
            var detailAttr = "detail(" + item.id + ')';
            detailBtn.setAttribute("type", "button");
            detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
            detailBtn.setAttribute("onclick", detailAttr);
            detailBtn.innerHTML = "查看";
            btnGroup.appendChild(detailBtn);

            //上下架
            var editBtn = document.createElement('button');
            var editAttr = 'shangxia(' + item.id + ',' +item.shangxiaTypes+ ')';
            editBtn.setAttribute("type", "button");
            editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
            editBtn.setAttribute("onclick", editAttr);
            if(item.shangxiaTypes == 1){
                editBtn.innerHTML = "下架";
            }else{
                editBtn.innerHTML = "上架";
            }
            btnGroup.appendChild(editBtn);

            //增加库存
            var plusBtn = document.createElement('button');
            var plusAttr = "plusQicaiKucunNumber(" + item.id+','+item.qicaiKucunNumber+")";
            plusBtn.setAttribute("type", "button");
            plusBtn.setAttribute("class", "btn btn-info btn-sm 修改");
            plusBtn.setAttribute("onclick", plusAttr);
            plusBtn.innerHTML = "增加库存";
            btnGroup.appendChild(plusBtn);

            var reduceBtn = document.createElement('br');
            btnGroup.appendChild(reduceBtn);

            //减少库存
            var reduceBtn = document.createElement('button');
            var reduceAttr = "reduceQicaiKucunNumber(" + item.id+','+item.qicaiKucunNumber+')';
            reduceBtn.setAttribute("type", "button");
            reduceBtn.setAttribute("class", "btn btn-info btn-sm 修改");
            reduceBtn.setAttribute("onclick", reduceAttr);
            reduceBtn.innerHTML = "减少库存";
            btnGroup.appendChild(reduceBtn);


            //修改按钮
            var editBtn = document.createElement('button');
            var editAttr = 'edit(' + item.id + ')';
            editBtn.setAttribute("type", "button");
            editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
            editBtn.setAttribute("onclick", editAttr);
            editBtn.innerHTML = "修改";
            btnGroup.appendChild(editBtn);



            //删除按钮
            var deleteBtn = document.createElement('button');
            var deleteAttr = 'remove(' + item.id + ')';
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
            deleteBtn.setAttribute("onclick", deleteAttr);
            deleteBtn.innerHTML = "删除";
            btnGroup.appendChild(deleteBtn);

            row.appendChild(btnGroup);

            return row;
    }


        // 翻页
        function pageNumChange(val) {
            if (val == 'pre') {
                pageIndex--;
            } else if (val == 'next') {
                pageIndex++;
            } else {
                pageIndex = val;
            }
            getDataList();
        }

        // 下载
        function download(url) {
            window.open(url);
        }
        // 打开新窗口播放媒体
        function mediaPlay(url){
            window.open(url);
        }

        // 渲染翻页组件
        function pagination() {
            var beginIndex = pageIndex;
            var endIndex = pageIndex;
            var point = 4;
            //计算页码
            for (var i = 0; i < 3; i++) {
                if (endIndex == totalPage) {
                    break;
                }
                endIndex++;
                point--;
            }
            for (var i = 0; i < 3; i++) {
                if (beginIndex == 1) {
                    break;
                }
                beginIndex--;
                point--;
            }
            if (point > 0) {
                while (point > 0) {
                    if (endIndex == totalPage) {
                        break;
                    }
                    endIndex++;
                    point--;
                }
                while (point > 0) {
                    if (beginIndex == 1) {
                        break;
                    }
                    beginIndex--;
                    point--
                }
            }
            // 是否显示 前一页 按钮
            if (pageIndex > 1) {
                $('#tableId_previous').show();
            } else {
                $('#tableId_previous').hide();
            }
            // 渲染页码按钮
            for (var i = beginIndex; i <= endIndex; i++) {
                var pageNum = document.createElement('li');
                pageNum.setAttribute('onclick', "pageNumChange(" + i + ")");
                if (pageIndex == i) {
                    pageNum.setAttribute('class', 'paginate_button page-item active useOnce');
                } else {
                    pageNum.setAttribute('class', 'paginate_button page-item useOnce');
                }
                var pageHref = document.createElement('a');
                pageHref.setAttribute('class', 'page-link');
                pageHref.setAttribute('href', '#');
                pageHref.setAttribute('aria-controls', 'tableId');
                pageHref.setAttribute('data-dt-idx', i);
                pageHref.setAttribute('tabindex', 0);
                pageHref.innerHTML = i;
                pageNum.appendChild(pageHref);
                $('#tableId_next').before(pageNum);
            }
            // 是否显示 下一页 按钮
            if (pageIndex < totalPage) {
                $('#tableId_next').show();
                $('#tableId_next a').attr('data-dt-idx', endIndex + 1);
            } else {
                $('#tableId_next').hide();
            }
            var pageNumInfo = "当前第 " + pageIndex + " 页，共 " + totalPage + " 页";
            $('#tableId_info').html(pageNumInfo);
        }

        // 跳转到指定页
        function toThatPage() {
            //var index = document.getElementById('pageIndexInput').value;
            if (index < 0 || index > totalPage) {
                alert('请输入正确的页码');
            } else {
                pageNumChange(index);
            }
        }

        // 全选/全不选
        function chooseAll() {
            checkAll = !checkAll;
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                boxs[i].checked = checkAll;
            }
        }

        // 批量删除
        function deleteMore() {
            ids = []
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                if (boxs[i].checked) {
                    ids.push(boxs[i].value)
                }
            }
            if (ids.length == 0) {
                alert('请勾选要删除的记录');
            } else {
                remove(ids);
            }
        }

        // 删除
        function remove(id) {
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
                var paramArray = [];
                if (id == ids) {
                    paramArray = id;
                } else {
                    paramArray.push(id);
                }
                httpJson("qicai/delete", "POST", paramArray, (res) => {
                    if(res.code == 0){
                        getDataList();
                        alert('删除成功');
                    }
                });
            } else {
                alert("已取消操作");
            }
        }

        // 用户登出
        <%@ include file="../../static/logout.jsp"%>

        //修改
        function edit(id) {
            window.sessionStorage.setItem('updateId', id)
            window.location.href = "add-or-update.jsp"
        }

        //清除会重复渲染的节点
        function clear() {
            var elements = document.getElementsByClassName('useOnce');
            for (var i = elements.length - 1; i >= 0; i--) {
                elements[i].parentNode.removeChild(elements[i]);
            }
        }

        //添加
        function add() {
            window.sessionStorage.setItem("addqicai", "addqicai");
            window.location.href = "add-or-update.jsp"
        }

        //报表
        function graph() {
            window.location.href = "graph.jsp"
        }
        function exportExcel() {
            excel = new ExcelGen({
                "src_id": "tableId",
                "show_header": true,
                "file_name": 'qicai.xlsx'
            });
            excel.generate();
        }

        // 查看详情
        function detail(id) {
            window.sessionStorage.setItem("updateId", id);
            window.location.href = "info.jsp";
        }


        //上下架
        function shangxia(id,shangxiaTypes) {
            var msg ="";
            if(shangxiaTypes == 1){
                shangxiaTypes=2;
                msg="下架成功";
            }else if(shangxiaTypes == 2){
                shangxiaTypes=1;
                msg="上架成功";
            }
            let data = {"id":id,"shangxiaTypes":shangxiaTypes};
            httpJson("qicai/update", "POST", data, (res) => {
                if(res.code == 0){
                    alert(msg);
                    getDataList()
                }else{
                    alert(res.msg);
                }
            });
        }
    //填充级联表搜索下拉框

    //填充本表搜索下拉框
         
     
         
        function qicaiTypesSelectSearch() {
            var qicaiTypesSelectSearch = document.getElementById('qicaiTypesSelectSearch');
            if(qicaiTypesSelectSearch != null) {
                qicaiTypesSelectSearch.add(new Option('-请选择-',''));
                if (qicaiTypesOptions != null && qicaiTypesOptions.length > 0){
                    for (var i = 0; i < qicaiTypesOptions.length; i++) {
                            qicaiTypesSelectSearch.add(new Option(qicaiTypesOptions[i].indexName,qicaiTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                                
    //查询级联表搜索条件所有列表

    //查询当前表搜索条件所有列表
            function qicaiTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=qicai_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        qicaiTypesOptions = res.data.list;
                    }
                });
            }





        //增加库存
        function plusQicaiKucunNumber(thisId,qicaiKucunNumber) {
            if(thisId == null || thisId=="" || thisId=="null"){
                alert("未知错误,请联系管理员处理");
                return;
            }
            $("#plusOrReduceQicaiKucunNumberTitle").val("增加库存");
            $("#thisQicaiKucunNumber").val(qicaiKucunNumber);
            $("#hideflag").val("+");
            $("#qicaiId").val(thisId);
            id=thisId;
            $('#plusOrReduceQicaiKucunNumberModal').modal('show');
        }

        //减少库存
        function reduceQicaiKucunNumber(thisId,qicaiKucunNumber) {
            if(thisId == null || thisId=="" || thisId=="null"){
                alert("未知错误,请联系管理员处理");
                return;
            }
            $("#plusOrReduceQicaiKucunNumberTitle").val("减少库存");
            $("#thisQicaiKucunNumber").val(qicaiKucunNumber);
            $("#hideflag").val("-");
            $("#qicaiId").val(thisId);
            id=thisId;
            $('#plusOrReduceQicaiKucunNumberModal').modal('show');
        }
        $('#plusOrReduceQicaiKucunNumberModal').on('show.bs.modal', function () {
            //清理表格内容,防止重复回显
            $("#plusOrReduceQicaiKucunNumber").val(0);
            if(id ==null){
                alert("获取当前列id错误,请联系管理员处理");
                $('#plusOrReduceQicaiKucunNumberModal').modal('hide');
                $("#plusOrReduceQicaiKucunNumberTitle").val("");
                $("#thisQicaiKucunNumber").val("");
                $("#hideflag").val("");
                $("#qicaiId").val("");
                getDataList();
                return;
            }
        });
        //模态框关闭的时候会执行这个里面的东西
        $('#plusOrReduceQicaiKucunNumberModal').on('hide.bs.modal', function () {
            id=null;
            $("#plusOrReduceQicaiKucunNumber").val(0);
            $("#plusOrReduceQicaiKucunNumberTitle").val("");
            $("#thisQicaiKucunNumber").val("");
            $("#hideflag").val("");
            $("#qicaiId").val("");
            getDataList();
        });

        function submitPlusOrReduceQicaiKucunNumber() {
            var id = $("#qicaiId").val();//当前数据id
            var hideflag = $("#hideflag").val();//是加还是减
            var thisQicaiKucunNumber = $("#thisQicaiKucunNumber").val();//原先的数量
            var plusOrReduceQicaiKucunNumber = $("#plusOrReduceQicaiKucunNumber").val();//增加或者减少的数量
            var sumNumber=0;
            var msg;
            if(hideflag == "+"){
                sumNumber =parseInt(thisQicaiKucunNumber) + parseInt(plusOrReduceQicaiKucunNumber);
                msg = "增加库存成功";
            }else if(hideflag == "-"){
                sumNumber =parseInt(thisQicaiKucunNumber) - parseInt(plusOrReduceQicaiKucunNumber);
                msg = "减少库存成功";
            }else{
                alert("提交库存增加减少未知错误");
                return;
            }
            let data = {"id":id,"qicaiKucunNumber":sumNumber};
            httpJson("qicai/update", "POST", data, (res) => {
                if(res.code == 0){
                    alert(msg);
                    getDataList();
                }else{
                    alert(res.msg);
                }
                $('#plusOrReduceQicaiKucunNumberModal').modal('hide');
            });

        }






        layui.use(['layer', 'carousel', 'jquery', 'form', 'upload', 'laydate', 'rate'], function () {
            var rate = layui.rate;//评分
            var jquery = layui.jquery;//jquery
            var $=jquery;

        });


        $(document).ready(function () {
            //激活翻页按钮
            $('#tableId_previous').attr('class', 'paginate_button page-item previous')
            $('#tableId_next').attr('class', 'paginate_button page-item next')
            //隐藏原生搜索框
            $('#tableId_filter').hide()
            //设置右上角用户名
            $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
            //设置项目名
            $('.sidebar-header h3 a').html(projectName)
            setMenu();
            init();

            //查询级联表的搜索下拉框

            //查询当前表的搜索下拉框
            qicaiTypesSelect();
            getDataList();

        //级联表的下拉框赋值

        //当前表的下拉框赋值
                         
             
                         
            qicaiTypesSelectSearch();
                                                                                                
        <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>
