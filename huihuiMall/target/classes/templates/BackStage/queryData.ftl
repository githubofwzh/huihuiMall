<!DOCTYPE html>
<html>
<head>
<#assign bath=request.getContextPath()>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>查询结果</title>
    <script src="${bath}/js/jquery-1.11.3.min.js"></script>
    <script src="${bath}/js/rem.js"></script>
    <style>
        body,html{
            margin: 0px;
            padding: 0px;
        }
        .main-panel{
            width:100%;
            background-image:url("${bath}/images/h5bg.jpg");
            background-size: 100% 100%;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .table{
            width:80%;
            height:auto;
            position: absolute;
            top:60%;
            left:50%;
            transform: translate(-50%, -50%);

        }
        .table th{
            text-align: center;
            font-size: 15px;
            font-family: 微软雅黑;
            line-height: 32px;
            width:30%;
            font-weight: normal;
        }
        .table th img{
            width:52%;
            height:auto;
            padding-bottom: 10px;
        }
        .table td{
            text-align: left;
            font-size: 15px;
            font-family: 微软雅黑;
            line-height: 32px;
        }
        .tds{

        }
    </style>
</head>
<body>
<container>
    <section>
        <div class="main-panel">
            <div class="table" style="overflow: scroll; height: 380px; width: 100%">
                <table class="table" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <th colspan="2">
                            <img src="${bath}/images/h5title.png" alt="" />
                        </th>
                    </tr>
                    <tr>
                        <th>企业名称：</th>
                        <td>${(applyInfo.companyname)!}</td>
                    </tr>
                    <tr>
                        <th>批次号码：</th>
                        <td>${(applyInfo.batchnumber)!}</td>
                    </tr>
                    <tr>
                        <th>药材类型：</th>
                        <td>${(applyInfo.medicinename)!}</td>
                    </tr>
                    <tr>
                        <th>药品规格：</th>
                        <td>${(applyInfo.specification)!}</td>
                    </tr>
                    <tr>
                        <th>医院名称：</th>
                        <td>北京中医药医院</td>
                    </tr>
                    <tr>
                        <th>药材成分：</th>
                    </tr>
                    <tr>
                        <td style="border:1px solid;border-left: none;border-top: none;border-right: none;text-align: center">名称</td>
                        <td style="border:1px solid;border-left: none;border-top: none;border-right: none;text-align: center">扶贫基地名称</td>
                    </tr>
                    <#list applyInfo.crudeMedicineEntityList as crudeMedicine>
                        <tr>
                            <td style="text-align: center">${(crudeMedicine.name)}</td>
                            <td style="text-align: left; padding-left: 10px">${(crudeMedicine.aidbasename)}</td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</container>
</body>
</html>
<script>
    $(document).ready(function(){
        var screenHeight = $(window).height()+"px";
        $(".main-panel").css("height",screenHeight);
    });
</script>