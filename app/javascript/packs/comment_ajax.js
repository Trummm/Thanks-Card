$(function(){
  $(".add").on("click", function(){
    var thank_card_id = $(this).data("id")
    var data = $.extend(data, {authenticity_token: $('meta[name="csrf-token"]').attr('content')});
    $.ajax({
      url: "/thank_cards/"+ thank_card_id +"/comments",
      data: data,
      method: "POST"
    }).done(function(res){
        console.log(res)
      })
  })
})
