
init: ->
  myOptions: {
    zoom: 11,
    center: new google.maps.LatLng(43.074531, -89.384422)
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  map: new google.maps.Map($('#gmap')[0], myOptions)

  $.each(window.pins, (index, element) ->
    new google.maps.Marker({
      position: new google.maps.LatLng(element.lat, element.lng)
      map: map,
      title: element.title
    })
  )
$((-> init()))
