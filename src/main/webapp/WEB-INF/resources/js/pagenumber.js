
	let $pages = document.querySelector(".pages");
	let $back = document.querySelector(".back");
	let $searchBtn = document.querySelector(".searchBtn");
	$pages.classList.add("on");

	$back.addEventListener("click", () => {
		$pages.classList.add("on");
	});

	$searchBtn.addEventListener("click", () => {
		$pages.classList.remove("on");
	});
