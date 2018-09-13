<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%@ include file="../common/import.jsp"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script type="text/javascript">
		window.onload = function() {
		 
		var dps = [[], [], [], []];
		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled: true,
			theme: "theme2",
			title: {
				text: "Global Payments Revenue"
			},
			axisX: {
				valueFormatString: "YYYY",
				interval: 1,
				intervalType: "year"
			},
			axisY: {
				title: "Revenue (in trillion USD)",
				prefix: "$",
				suffix: "tn"
			},
			legend: {
				cursor:"pointer",
				itemclick: toogleDataSeries
			},
			toolTip: {
				shared: true
			},
			data: [{
				type: "stackedColumn",
				name: "North America",
				showInLegend: true,
				xValueType: "dateTime",
				xValueFormatString: "YYYY",
				yValueFormatString: "$#,##0.0tn",
				dataPoints: dps[0]
			},{
				type: "stackedColumn",
				name: "Latin America",
				showInLegend: true,
				xValueType: "dateTime",
				xValueFormatString: "YYYY",
				yValueFormatString: "$#,##0.0tn",
				dataPoints: dps[1]
			},{
				type: "stackedColumn",
				name: "EMEA",
				showInLegend: true,
				xValueType: "dateTime",
				xValueFormatString: "YYYY",
				yValueFormatString: "$#,##0.0tn",
				dataPoints: dps[2]
			},{
				type: "stackedColumn",
				name: "EPAC",
				showInLegend: true,
				xValueType: "dateTime",
				xValueFormatString: "YYYY",
				yValueFormatString: "$#,##0.0tn",
				dataPoints: dps[3]
			}]
		});
		 
		function toogleDataSeries(e){
			if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
				e.dataSeries.visible = false;
			} else{
				e.dataSeries.visible = true;
			}
			chart.render();
		}
		 
		var xValue;
		var yValue;
		 
		<c:forEach items="${dataPointsList}" var="dataPoints" varStatus="loop">	
			<c:forEach items="${dataPoints}" var="dataPoint">
				xValue = parseInt("${dataPoint.x}");
				yValue = parseFloat("${dataPoint.y}");
				dps[parseInt("${loop.index}")].push({
					x : xValue,
					y : yValue
				});		
			</c:forEach>	
		</c:forEach> 
		 
		chart.render();
		 
		}
	</script>
</head>
<body>
<%@ include file="../common/lnb.jsp"%>
<p>hello</p>
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>