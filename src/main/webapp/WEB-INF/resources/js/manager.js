new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: ["2024-01-13", "2024-01-14", "2024-01-15", "2024-01-16", "2024-01-17"],
      datasets: [
        {
          label: "회원수(day)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: [11,12,23,22,40]
        }
      ]
    },
    options: {
      //responsive: false, 내가 마음대로 크기 번경 하고 싶을때
      maintainAspectRatio: false,// 부모테그에 붙어서 나온다
      legend: { display: false },
      title: {
        display: true,
        text: '회원 유동 그래프'
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
//////////////////////////////////////////////////////////////////////////////////그래프존