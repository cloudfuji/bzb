/*
*Trim 
*removes whitespace on start and end of string
*/
String.prototype.trim = function () {
    return this.replace(/^\s*/, "").replace(/\s*$/, "");
};

String.prototype.lastChar = function(new_char){
  if(typeof new_char === 'undefined'){
    return this.charAt(this.length-1);
  }else if(typeof new_char === "string"){
    return this.slice(0, this.length-1) + new_char;
  }
};
