console.log('writin\'');

$(function(){
  setSubmitHandler();
});

function setSubmitHandler(){
  $('#submit').click(function(e){
    e.preventDefault();
    writer = $('#writer').val();
    getSentence(writer);
  });
}

function getSentence(writer){
  $.ajax({
      method: 'get',
      url: '/api/sentence/' + writer,
      success: function(response){
        var sentence = JSON.parse(response).sentence;
        console.log(sentence);
        renderSentence(sentence, writer);
      },
      error: function(err){
               console.log(err);
      }
   });
}

function renderSentence(sentence, writer){
  $('#sentence').text(sentence);
  var credit = $("option[value='" + writer + "']").text();
  $('#credit').text(' - ' + credit);
}
