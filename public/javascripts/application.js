if(typeof window.console === 'undefined'){
  window.console = {log: function(){}};
}

/*
* Helper function to collect message
* data from jqXHR objects.
* used on ajax error callbacks
*/
function jqXHRMessage(jqXHR){
  var text = ""
      ,key_count = 0
      ,index
      ;
  
  try{    
    var  json = JSON.parse(jqXHR.responseText);
  }catch(ex){
    var json = {error: "Sorry! there was an error procesing your request. <br />We'll fix this as soon as possible. Please try later. "};
  }
  
      
  for(key in json){
    key_count+=1;
    text += key + " " + json[key] + "\n";
  }
  
  if(key_count == 1){
    index = text.indexOf(' ');
    text = text.substring(index);
  }
  
  return text;
};

$(function(){  
    // Append rails crsf token to all ajax
    $(document).ajaxSend(function(e, xhr, options) {
        var token = $("meta[name='csrf-token']").attr("content");
        xhr.setRequestHeader("X-CSRF-Token", token);
    });
    
    // Autobox
    $('.autobox').autobox();
});
