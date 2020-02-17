function pageClick(k,url) {
	$(k).parent().find("div").removeClass("active");
	$(k).addClass("active");
	$("#flTitle").text($(k).text());
	window.parent.document.getElementById("content").src=url;
}
