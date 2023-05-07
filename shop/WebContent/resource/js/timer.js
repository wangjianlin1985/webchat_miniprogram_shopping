<!--
var datelocalweek=new Array("星期日", "星期一", "星期二","星期三","星期四", "星期五","星期六");
var datelocalnow=new Date(); 
var datelocalyear=datelocalnow.getFullYear(); 
var datelocalmonth=(datelocalmonth="0"+(datelocalnow.getMonth()+1)).substr(datelocalmonth.length-2,2); 
var datelocalday=(datelocalday="0"+datelocalnow.getDate()).substr(datelocalday.length-2,2); 
var datelocalweekday=datelocalweek[datelocalnow.getDay()]; 
document.write("<font color=#f96c0f>北京时间：</font><font color=#333333> "+datelocalyear+"年"+datelocalmonth+"月"+datelocalday+"日"+" "+datelocalweekday+"</font>"); 
// -->