// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
    $('.submit_form').click(function(){
        $.blockUI({message:$('#question'), css: { width: '650px', height:"500", top:'10%'}});
        return false;
    });
    // Validation and send data of form
    $('.submit_btn').click(function() {
            $('#new_member_form').validate({
                submitHandler: function(form){
                    $.unblockUI();
                    addAnswer1();
                    $.ajax({
                        type: "POST",
                        url: "/start/new",
                        data: $('#new_member_form').serialize(),

                        dataType: "html"
                    }).done(function(data){

                            $('.content_wrap').html(data);
                        })
                },
                debuger:true,
                success: "valid",
                errorClass: "faild",
                rules: {
                    'member[name]':{required:true, minlength: 3},
                    'member[phone]':{required:true, digits:true, minlength:11},
                    'member[city]':{required:true},
                    'member[mail]':{required:true},
                    'accept':{required:true}
                },
                messages: {
                     'member[name]': {
                         required: 'Поле не может быть пустым'
                     },
                    'member[phone]':{
                        required:'Поле не может быть пустым',
                        digits: 'Введите корретный номер',
                        minlength: 'Формат: 81234567891'
                    },
                    'member[city]':{
                        required:"Поле не может быть пустым"
                    },
                      'member[mail]': {
                          required: 'Поле не можеть быть пустым',
                          email: 'Введите коректный адрес'
                      },
                    'accept': {
                        required:'Условия обязательны'
                    }
                }
            });
        });

    // автозаполнение городов
    $( "#member_city" ).kladr({
        token: '526ae4c031608f7b2e000048',
        key: 'a48713b7568306eed95f75e516edab18f9513b92',
        type: $.kladr.type.city,
        select: function() {}
    });
    function addAnswer1 ()
    {
        answer = $("#main_form input:radio:checked").val()
        $( "#new_member_form" ).append( '<input name="answer" type="hidden" value="'+answer+'">' );
    }

});


