CKEDITOR.editorConfig = (config) ->
  config.language = "en"
  config.uiColor = "#F8F8F8"
  true
$(document).on 'turbolinks:load', ->
  return unless typeof(CKEDITOR) != 'undefined'
  $('.ckeditor').each ->
    CKEDITOR.replace($(this).attr('id'))
