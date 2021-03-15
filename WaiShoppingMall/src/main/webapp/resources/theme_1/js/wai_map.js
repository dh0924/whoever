function initialize() {

  var LatLng = new google.maps.LatLng(37.463545477348, 126.64207510841);
  var mapProp = {
    center: LatLng, // 위치
    zoom:18, // 어느정도까지 세세하게 볼 것인지.
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  
  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
  var marker = new google.maps.Marker({
	position: LatLng,
	map: map,
  });
}
google.maps.event.addDomListener(window, 'load', initialize);