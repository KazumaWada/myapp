



<div class="container">
<div class="row">
   <div class="col-md-6">


<div><%# col-md-6 %>
   <div><%# row %>
   <div><%# container %>









  <% if @output['weather'][0]['icon'] = "01d" %>
  <%image_tag 'http://openweathermap.org/img/wn/01d@2x.png' %>
  <% else %>
  <%image_tag 'http://openweathermap.org/img/wn/02d@2x.png' %>
  <% end %>





{
	"coord": {
		"lon": 13.4105,
		"lat": 52.5244
	},
	"weather": [
		{
			"id": 803,
			"main": "Clouds",
			"description": "broken clouds",
			"icon": "04d"
		}
   ],
   
   "base": "stations",
   
	"main": {
		"temp": 280.6,
		"feels_like": 275.6,
		"temp_min": 280.15,
		"temp_max": 280.93,
		"pressure": 991,
		"humidity": 87
   },
   
	"visibility": 10000,
	"wind": {
		"speed": 5.66,
		"deg": 270
   },
   
	"clouds": {
		"all": 75
   },
   
   "dt": 1611310590,
   
	"sys": {
		"type": 1,
		"id": 1262,
		"country": "DE",
		"sunrise": 1611298933,
		"sunset": 1611329601
	},
	"timezone": 3600,
	"id": 2950159,
	"name": "Berlin",
	"cod": 200
}







