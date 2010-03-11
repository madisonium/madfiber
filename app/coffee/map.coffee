
init: ->
  myOptions: {
    zoom: 8,
    center: new google.maps.LatLng(43, -89)
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  map: new google.maps.Map($('#gmap')[0], myOptions)

  $.each(window.pins, (index, element) ->
    p: new google.maps.LatLng(element.lat, element.lng)
    console.log(p) if console?
    new google.maps.Marker({
      position: p
      map: map,
      title: element.title
    })
  )
$((-> init()))
