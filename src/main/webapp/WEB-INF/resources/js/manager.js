function ChartGraph(query, options){
	let target = document.querySelector("canvas" + query);
	target.innerHTML = "";
	info = {}
	info.type = options.type || "bar";
	info.title = options.title || "제목";
	info.label = options.label || "라벨";
	info.datas = options.datas || [10,20,30,40,50];
	info.labels = options.labels || ["1","2","3","4","5"];
	info.labels = info.labels.slice(0, info.datas.length);
	info.animation = {}
	info.animation.duration = options.animation && (options.animation.duration || 0); 
	switch(info.type){
		case "line":
			break;
		case "bar":
			info.backColor = options.backColor || ["red","blue","green","aqua","yellow"];
			info.backColor = info.backColor.slice(0, info.datas.length);
			break;
	}
	new Chart(target, {
	    type: info.type,
	    data: {
	      labels: info.labels,
	      datasets: [
	        {
	          label: info.label,
	          backgroundColor: info.backColor,
	          data: info.datas
	        }
	      ]
	    },
	    options: {
		  animation:{
			  duration:info.animation.duration
		  },
	      //responsive: false, 내가 마음대로 크기 번경 하고 싶을때
	      maintainAspectRatio: false,// 부모테그에 붙어서 나온다
	      legend: { display: false },
	      title: {
	        display: true,
	        text: info.title
	      },
	      //y축
	      scales: {
	        yAxes: [{
	            ticks : {
					beginAtZero : true, // 0부터 시작
				 //	stepSize: 1   // 1 씩 증가
				}
	        }]
	    }
	    //y축
	    }
	});	
}


//////////////////////////////////////////////////////////////////////////////////그래프존