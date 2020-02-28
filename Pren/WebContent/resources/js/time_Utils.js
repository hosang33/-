
function getDateString(date) {
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDate();
	
	month = month >= 10? month : '0'+month;
	day = day >= 10 ? day : '0'+day;
	
	return text = year + "-" + month + "-" + day;
}

function getToday(id) {
	var text = getDateString(new Date());
	document.getElementById(id).value = text;
}
function getNowMinusDay(id,day) {
	var now = new Date();
	var time = now.getTime();
	var minusDay = 60*60*24*day*1000;
	var beforeDay = new Date(time- minusDay);
	var text = getDateString(beforeDay);
	document.getElementById(id).value = text;
}
