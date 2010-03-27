$( ->
  $('#members').sortable({
    stop: (event, ui) ->
      window.the_ui: ui
      window.the_this: $(this)
      data: {
        data: $(this).find('li').map( (index,ele) ->
          {
            id: ele.id
            idx: index
          }
        )
      }
      window.data: data
      $.post('/cabal/set_positions', data)
  }).disableSelection()
)
