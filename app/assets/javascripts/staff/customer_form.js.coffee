$(document).on 'page:change', ->
  $('form.edit_form').on 'click', '#enable-password-field', ->
    $('#enable-password-field').hide()
    $('#disabled-password-field').show()
    $('#form_customer_password').removeAttr('disabled')
    $('label[for=form_customer_password]').addClass('required')
  $('form.edit_form').on 'click', '#disabled-password-field', ->
    $('#disabled-password-field').hide()
    $('#enable-password-field').show()
    $('#form_customer_password').attr('disabled', 'disabled')
    $('label[for=form_customer_password]').removeClass('required')
