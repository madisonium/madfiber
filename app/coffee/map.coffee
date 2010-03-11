
init: ->
  myOptions: {
    zoom: 12,
    center: new google.maps.LatLng(43.074531, -89.384422)
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  map: new google.maps.Map($('#gmap')[0], myOptions)

  $.each(window.pins, (index, element) ->
    p: new google.maps.LatLng(element.lat, element.lng)
    new google.maps.Marker({
      position: p
      map: map,
      title: element.title
    })
  )
$((-> init()))
