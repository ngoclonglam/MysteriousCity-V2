function LoadJobCenter(){
    $.post('https://qb-phone/GetJobCentersJobs', JSON.stringify({}), function(Jobs){
        $(".jobcenter-list").html("");
        for (const [k, v] of Object.entries(Jobs)) {
            // var AddOption = '<div class="jobcenter-class-body-job" >'+'<div class="jobcenter-showitems-other"><i data-action="1" data-job="'+v.job+'" data-label="'+v.label+'" id="jobcenter-icon-class" class="fas fa-check-circle"></i><i data-action="2" data-x="'+v.Coords[0]+'" data-y="'+v.Coords[1]+'" id="jobcenter-icon-class" class="fas fa-map-marked-alt"></i></div>'+v.label+'</div>'
            // $('.jobcenter-list').append(AddOption);
            // Disable data-action="1" to on/off duty via phone
            var saleCoords = "";
            if (v.SaleCoords !== undefined && v.SaleCoords.length == 2) {
                saleCoords = '<i data-action="3" data-x="'+v.SaleCoords[0]+'" data-y="'+v.SaleCoords[1]+'" id="jobcenter-icon-class" class="fas fa-dollar-sign"></i>'
            }
            var AddOption = '<div class="jobcenter-class-body-job" >'+
                                '<div class="jobcenter-showitems-other">'+
                                    '<i data-action="2" data-x="'+v.Coords[0]+'" data-y="'+v.Coords[1]+'" id="jobcenter-icon-class" class="fas fa-map-marked-alt"></i>'+saleCoords+
                                '</div>'+v.label+
                            '</div>'
            $('.jobcenter-list').append(AddOption);
        }
    });
};

$(document).on('click', '#jobcenter-icon-class', function(e){
    e.preventDefault();
    var action = $(this).data('action')
    if(action == 1){
        var job = $(this).data('job')
        var label = $(this).data('label')
        $.post('https://qb-phone/CasinoPhoneJobCenter', JSON.stringify({
            action: action,
            job: job,
            label: label,
        }));
    }else if(action == 2 || action == 3){
        var x = $(this).data('x')
        var y = $(this).data('y')
        $.post('https://qb-phone/CasinoPhoneJobCenter', JSON.stringify({
            action: action,
            x: x,
            y: y,
        }));
    }
});