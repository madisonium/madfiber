(function(){
  var init;
  init = function init() {
    var map, myOptions;
    myOptions = {
      zoom: 11,
      center: new google.maps.LatLng(43.074531, -89.384422),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map($('#gmap')[0], myOptions);
    return $.each(window.pins, function(index, element) {
      var p;
      p = new google.maps.LatLng(element.lat, element.lng);
      return new google.maps.Marker({
        position: p,
        map: map,
        title: element.title
      });
    });
  };
  $((function() {
    return init();
  }));
})();
