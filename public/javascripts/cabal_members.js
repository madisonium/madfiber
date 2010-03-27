(function(){
  $(function() {
    return $('#members').sortable({
      stop: function stop(event, ui) {
        var data;
        window.the_ui = ui;
        window.the_this = $(this);
        data = {
          data: $(this).find('li').map(function(index, ele) {
            return {
              id: ele.id,
              idx: index
            };
          })
        };
        window.data = data;
        return $.post('/cabal/set_positions', data);
      }
    }).disableSelection();
  });
})();
