/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



function toggleOptions(t){
    if($(t).hasClass("active")){
        $(t).removeClass("active");
    }else{
        $(t).addClass("active");
    }
    $(".more-options").toggle(200);
}

function toggleId(){
    $(".toggleId.hide").hide();
    $(".toggleId.show").show();
    $("#isJuridica:checked").each(function(){
        $(".toggleId.hide").show();
        $(".toggleId.show").hide();
    });
}

$("#isJuridica").change(function(){
    toggleId();
});

$(document).ready(function(){
    toggleId();
});