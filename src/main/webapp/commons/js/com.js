function show_validation_msg(str,type,msg) {

    $(".password-input").removeClass('has-error');
    $(".username-input").removeClass('has-error');

    if(type===("error")){
        $(str).addClass('has-error');
        $(".glyphicon-warning-sign").show();
        $(".msg").empty().html(msg);
    }

}