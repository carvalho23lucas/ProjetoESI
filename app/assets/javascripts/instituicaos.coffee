# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#estado').change ->
    $.ajax
      type: 'POST'
      url: '/instituicaos/update_cidades'
      data: estado_id: $('#estado').val()
      success: (data) ->
        $('#usuario_cidade_id').html data
        return
    return
  return