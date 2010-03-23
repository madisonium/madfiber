(function(){
  var init;
  init = function init() {
    var myOptions;
    myOptions = {
      zoom: 11,
      center: new google.maps.LatLng(43.074531, -89.384422),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    window.map = new google.maps.Map($('#gmap')[0], myOptions);
    window.markers = [];
    return $.each(window.pins, function(index, element) {
      return window.markers.push(new google.maps.Marker({
        position: new google.maps.LatLng(element.lat, element.lng),
        map: map,
        title: element.title
      }));
    });
  };
  $((function() {
    return init();
  }));
})();
