$.finance = {
	analyze : function(){
//		var colors = Highcharts.getOptions().colors,
        categories = ['收入', '支出'],
//      name = 'Browser brands',
        data = [{
                y: 60,
                color: "green",
                drilldown: {
                    name: '收入',
                    categories: ['生活', '学习', '工作'],
                    data: [30, 20, 10]
                }
            }, {
                y: 40,
                color: "red",
                drilldown: {
                    name: '支出',
                    categories: ['生活', '学习', '工作'],
                    data: [20, 10, 10]
                }
            }];


    // Build the data arrays
    var inoroutData = [];
    var typeData = [];
    for (var i = 0; i < data.length; i++) {

        // add browser data
        inoroutData.push({
            name: categories[i],
            y: data[i].y,
            color: data[i].color
        });

        // add version data
        for (var j = 0; j < data[i].drilldown.data.length; j++) {
            typeData.push({
                name: data[i].drilldown.categories[j],
                y: data[i].drilldown.data[j],
                color: data[i].color,
                parent_name : categories[i]
            });
        }
    }

    // Create the chart
    $('#finance_pie_1').highcharts({
        chart: {
            type: 'pie'
        },
        title: {
            text: '收入支出比例'
        },
        yAxis: {
            title: {
                text: 'Total percent market share'
            }
        },
        plotOptions: {
            pie: {
                shadow: false,
                center: ['50%', '50%']
            }
        },
        tooltip: {
    	    valueSuffix: '%',
    	    formatter: function() {
    	    	if(typeof(this.point.parent_name) == "undefined"){
    	    		return '<b>'+ this.point.name +'合计:</b> '+ this.y +'%';
    	    	}
                return '<b>'+ this.point.name+this.point.parent_name +':</b> '+ this.y +'%';
            }
        },
        series: [{
            name: '合计',
            data: inoroutData,
            size: '60%',
            dataLabels: {
                formatter: function() {
                	return this.y > 5 ? this.point.name : null;
                },
                color: 'white',
                distance: -30
            }
        }, {
            name: '类型',
            data: typeData,
            size: '80%',
            innerSize: '60%',
            dataLabels: {
                formatter: function() {
                    // display only if larger than 1
                	return this.y > 1 ? '<b>'+ this.point.name+this.point.parent_name +':</b> '+ this.y +'%'  : null;
                }
            }
        }]
    });
	}
};


















