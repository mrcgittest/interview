<html>
<head>
	<link rel="stylesheet" href="css/styles.css">
    <!-- Step 1 - Include the fusioncharts core library -->
    <script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
    <!-- Step 2 - Include the fusion theme -->
    <script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>
    <script type="text/javascript">
    	//Hacky way of getting the data from jsp -> javascript
    	var customerNamesStr = "${customerNames}";
    	var amtsDueStr = "${amountsDue}";
    	
    	//Re-split the strings again
    	var customerNames = customerNamesStr.split(":");
    	var amtsDue = amtsDueStr.split(":");
    	
    	var chartData = [];
    	
    	for(var i = 0; i < customerNames.length; i++){
    		chartData.push({
    			"label" : customerNames[i],
    			"value" : amtsDue[i]
    		});
    	}
    	
    	const chartConfigs = {
    			  type: "column2d", //Set the chart type
    			  renderAt: "chart-container", //Set the container object
    			  width: "100%", //Set the chart width
    			  height: "400", //Set the chart height
    			  dataFormat: "json", //Set the type of data
    			  dataSource: {
    			    chart: {
    			      caption: "Customer Names with Amount Due", //Set the chart caption
    			      subCaption: "", //Set the chart subcaption
    			      xAxisName: "Customer", //Set the x-axis name
    			      yAxisName: "Amount Due", //Set the y-axis name
    			      numberSuffix: "",
    			      theme: "fusion" //Set the theme for your chart
    			    },
    			    // Chart Data from Step 2
    			    data: chartData
    			  }
    			};
    	
    	FusionCharts.ready(function(){
    	    var fusioncharts = new FusionCharts(chartConfigs);
    	    fusioncharts.render();
    	    });
    </script>
	</head>
	<body>
		<div>
			<span style="text-align: center">
				<h3>Customer Data</h3>
			</span>
		</div>
		<div>
			<table id="customerData" align="center" border="1px solid black;">
				<tr>
					<td>Customer Number</td>
					<td>Customer Name</td>
					<td>Amount Due</td>
				</tr>
				<#list customers as customer>
					<tr class="${customer?item_parity}Row">
						<td>${customer.number}</td>
						<td>${customer.name}</td>
						<td>${customer.amountDue}</td>
					</tr>
				</#list>
			</table>
		</div>
		<div id="chart-container">
		</div>
	</body>
</html>