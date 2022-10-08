window.onload = function(e) {
    window.addEventListener('message', function(event) {
        if (event.data.status.status) {
            $("#chung").show();
            $('#status').append(`
                <div class="status2">
                    <div class="title">Người nhận: `+event.data.status.nguoinhan +`</div>
					<button class = "button" id = "huydichvu">Hủy dịch vụ</button>
                 </div>
                `);
            $("#status").show();
        }else {
            $("#chung").show();
            var i;
            for (i = 0; i < event.data.datajob.length; i++) {
                $('#dichvu').append(`<div class="ping">
					<div class="job">
						<span>${event.data.datajob[i].text}</span>
					</div>
					<input type="text" id = "text` + i + `" placeholder="Nội dung cần ping"/>
					<div class="wrapper">
						<button class="button" id="clickping" number=${i}>Ping</button>
					</div>
				</div>`);
            }
            $("#dichvu").show();
        }
        document.onkeyup = function(data) {
            if (data.which == 27) {
                location.reload(true);
                $('#chung').hide("fast");
                $('#dichvu').hide("fast");
                $('#status').hide("fast");
                $.post('http://qt-ping/closemenu', JSON.stringify({}));
            }
        };
        $("body").on("click", "#clickping", function() {
            location.reload(true);
            $('#chung').hide("fast");
            $('#dichvu').hide("fast");
            var number = $(this).attr('number');
            var jobname = event.data.datajob[number].name;
            var value = document.getElementById("text" + number).value;
            $.post('http://qt-ping/ping', JSON.stringify({
                jobname: jobname,
                value: value
            }));
            $.post('http://qt-ping/closemenu', JSON.stringify({}));
        })

        $("body").on("click", "#huydichvu", function() {
            location.reload(true);
            $('#chung').hide("fast");
            $('#status').hide("fast");
            $.post('http://qt-ping/huydichvu', JSON.stringify({}));
            $.post('http://qt-ping/closemenu', JSON.stringify({}));
        })
    })
}
