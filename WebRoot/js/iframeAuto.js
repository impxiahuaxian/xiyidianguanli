$(function() {
	var par = window.parent;
	var iframe = par.document.getElementById("main_frame_id");
	iframe.height=document.body.scrollHeight +60;
});

function autoIframe(){
	var par = window.parent;
	var iframe = par.document.getElementById("main_frame_id");
	iframe.height=document.body.scrollHeight +60;
}