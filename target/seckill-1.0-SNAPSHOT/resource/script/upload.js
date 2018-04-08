function uploadHead() {
        var v = document.getElementById("headId");
        if (undefined == v) {
            v = document.getElementById("headId2");
        }
        v.click();
}

function headImg() {
    var formData = new FormData();
    var img_file = document.getElementById("headId");
    if (undefined == img_file) {
        img_file = document.getElementById("headId2");
    }
    var fileObject = img_file.files[0];
    formData.append("headPhone", fileObject);
    $.ajax({
        url: "/user/uploadHeadImage",
        type: "POST",
        dataType: "json",
        data: formData,
        processData: false,
        contentType: false,
        success: function (data) {
            alert(data.message);
            window.location.href = "";
        },
        error: function (data) {
            alert(data.message);
        }
    });
}

    $("#alipayId").click(
        function(){
            //var moneyId = $("#moneyId");
             var zz = $('#zhen');
             alert(zz);
             console.log(zz.toString());
            //var killPhoneModal = document.getElementById("killPhoneModal");
            zz.modal({
                show: true,//显示弹出层
                backdrop: 'static',//禁止位置关闭
                keyboard: false//关闭键盘事件
            });
            $("#commitId").click(function(){
                window.location.href="/login";
            });
        });