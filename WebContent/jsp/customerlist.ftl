<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
    			      caption: "Amount Due by Customer", //Set the chart caption
    			      subCaption: "", //Set the chart subcaption
    			      xAxisName: "Customer", //Set the x-axis name
    			      yAxisName: "Amount Due", //Set the y-axis name
    			      numberSuffix: "",
    			      theme: "fusion", //Set the theme for your chart
    			      plotFillHoverColor: "#00FF00"
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
		<div class="container">
			<div>
				<span style="text-align: center" class="text-primary">
					<h1 class="display-4">Customer Data</h1>
				</span>
			</div>
			<div>
				<table class="table table-striped table-bordered table-sm table-hover" id="customerData" align="center">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Customer Number</th>
							<th scope="col">Customer Name</th>
							<th scope="col">Amount Due</th>
						</tr>
					</thead>
					<tbody>
					<#list customers as customer>
						<tr>
							<td>${customer.number}</td>
							<td>${customer.name}</td>
							<td>${customer.amountDue}</td>
						</tr>
					</#list>
					</tbody>
				</table>
			</div>
			<div id="chart-container" class="border border-dark">
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</body>
</html>