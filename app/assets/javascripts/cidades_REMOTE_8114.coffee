$(document).ready ->
  $('#estado').change ->
    $.ajax
      type: 'POST'
      url: '/cidades/update_cidades'
      data: estado_id: $('#estado').val()
      success: (data) ->
        $('#usuario_cidade_id').html data
        return
    return
  return