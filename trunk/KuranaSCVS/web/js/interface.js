/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

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