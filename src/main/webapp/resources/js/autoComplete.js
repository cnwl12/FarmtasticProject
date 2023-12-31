window.onload = function(){
	const elements = document.querySelectorAll(".hero__categories ul li a");
	const dataList = Array.from(elements).map(el => el.textContent);


	const $searchQuery = document.querySelector("#searchQuery");
	const $autoComplete = document.querySelector(".autocomplete");

	let nowIndex = 0;

	$searchQuery.onkeyup = (event) => {
	  // 검색어
	  const value = $searchQuery.value.trim();

	  // 자동완성 필터링
	  const matchDataList = value
	    ? dataList.filter((label) => label.includes(value))
	    : [];

	  switch (event.keyCode) {
	    // UP KEY
	    case 38:
	      nowIndex = Math.max(nowIndex - 1, 0);
	      break;

	    // DOWN KEY
	    case 40:
	      nowIndex = Math.min(nowIndex + 1, matchDataList.length - 1);
	      break;

	    // ENTER KEY
	    case 13:
	      document.querySelector("#searchQuery").value = matchDataList[nowIndex] || "";

	      // 초기화
	      nowIndex = 0;
	      matchDataList.length = 0;
	      break;

	    // 그외 다시 초기화
	    default:
	      nowIndex = 0;
	      break;
	  }

	  // 리스트 보여주기
	  showList(matchDataList, value, nowIndex);
	};

	const showList = (data, value, nowIndex) => {
	  // 정규식으로 변환
	  const regex = new RegExp(`(${value})`, "g");

	  $autoComplete.innerHTML = data
	    .map(
	      (label, index) => `
	         <div class='${nowIndex === index ? "active" : ""}'>
	            ${label.replace(regex, "<mark>$1</mark>")}
	         </div>
	      `
	    )
	    .join("");
		// 자동완성 항목들에 클릭 이벤트 리스너 추가
	    Array.from($autoComplete.children).forEach((child, index) => {
	        child.addEventListener('click', () => {
	            $searchQuery.value = data[index];
	            $autoComplete.innerHTML = '';
	        });
	    });
	};
}
