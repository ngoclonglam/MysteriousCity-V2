$( document ).ready(function() {
    window.addEventListener('message', function(e){
        evenCallback[e.data.event](e.data)
    })
    var evenCallback = {
        toggle: function(data){
            switch (data.name){
                case "request_menu":
                    if(data.open == true){
                        $("#request_menu").show()
                    }else{
                        $("#request_menu").hide()
                    }
                    break;
                default:
            }
        },
        init: function(data){
            switch (data.name){
                case "request_menu":
                    var initData = data.initData;
                    $("#request_table tbody").empty()
                    for(i = 0; i < initData.length; i++){
                        var status;
                        var _button;
                        var _cancel = "";
                        if (initData[i].isAccept == 1){
                            _cancel = '<button class="btn btn-warning" id = "cancel" type="submit">Hủy</button>'
                        }
                        if (initData[i].status != 0){
                            status = initData[i].status;
                            _button = '<button class="btn btn-info" id = "getPos" type="submit">Lấy tọa độ</button>'
                        }else{
                            status = "Chưa nhận";
                            _button = '<button class="btn btn-success" id = "accept" type="submit">Nhận</button>'
                        }
                        $("#request_table tbody").append(`
                            <tr>
                                <td>
                                    ${initData[i].id}
                                </td>
                                <td>
                                    ${initData[i].name}
                                </td>
                                <td>
                                    ${initData[i].distance}
                                </td>
                                <td>
                                    ${status}
                                </td>
                                <td>
                                    ${initData[i].time}
                                </td>
                                <td>
                                    <button class="btn btn-primary" id="info" info="${initData[i].info}" type="submit">Chi Tiết</button>
                                    <button class="btn btn-danger" id="remove" type="submit">Xóa</button>
                                    ${_button}
                                    ${_cancel}
                                </td>
                            </tr>
                        `)
                    }
                    break;
                default:
            }
        }
    }
    ////////////////////////WEAPON WHEEL/////////////////////////////
    
    /////////////////////////////REQUESTMENU/////////////////////////////
    const $requestTable = $('#request_table');
    $requestTable.on('click', '#remove', function () {
        var id = $(this).parents('tr').find("td:nth-child(1)").html().trim();
        console.log(id);
        $.post("http://qt-request/request:remove", JSON.stringify({id: id}));
    })
    $requestTable.on('click', '#info', function () {
        console.log($(this).attr('info'));
        $("#request-menu-modal .modal-body").text($(this).attr('info'));
        $("#request-menu-modal").modal('toggle')
    })
    $requestTable.on('click', '#getPos', function () {
        var id = $(this).parents('tr').find("td:nth-child(1)").html().trim();
        console.log(id);
        $.post("http://qt-request/request:getPos", JSON.stringify({id: id}));
    })
    $requestTable.on('click', '#cancel', function () {
        var id = $(this).parents('tr').find("td:nth-child(1)").html().trim();
        $.post("http://qt-request/request:cancel", JSON.stringify({id: id}));
    })
    $requestTable.on('click', '#accept', function () {
        var id = $(this).parents('tr').find("td:nth-child(1)").html();
        var status = $(this).parents('tr').find("td:nth-child(4)").html().trim();
        if(status == "Chưa nhận"){
            $.post("http://qt-request/request:accept", JSON.stringify({id: id}));
        }else{
            SendNotification(status+" đã nhận người này")
        }
    })
    /////////////////////////////WHEEL/////////////////////////////
    $(document).ready(function(){
        
        
    });
    /////////////////////////////KEYLISTENER/////////////////////////////
    window.addEventListener("keyup", function(event){
        if(event.key == "Escape"){
            $.post('http://qt-request/closeNUI', JSON.stringify({}));
            $("#request_menu").hide();
            $("#request-menu-modal").modal('hide');
        }
    })
    /////////////////////////////NOTIFICATION/////////////////////////////
    function SendNotification(msg){
        $.post('http://qt-request/Notification', JSON.stringify({msg:msg}));
    }
    $.post("http://qt-request/ready", JSON.stringify({}));
});