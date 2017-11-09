$(document).ready(function() {
    $('#contact form').on('submit', function(e) {
        e.preventDefault();
        var $form = $(e.currentTarget),
            $email = $form.find('#contact-email'),
            $button = $form.find('button[type=submit]');
        
        if($email.val().indexOf('@') == -1) {
            vaca = $email.closest('form-group')
            $email.closest('.form-group').addClass('has-error');
        } else {
            $form.find('.form-group').addClass('has-success').removeClass('has-error');
            $button.attr('disabled', 'disabled');
            $button.after('<span>Message sent. We will contact you soon.</span>');
        }
    });
    $('#sign-btn').on('click', function(e) {
        $(e.currentTarget).closest('ul').hide();
        $('form#signin').fadeIn('fast');
    });
    $('#account-tabs a').click(function (e) {
    	e.preventDefault()
    	$(this).tab('show')
    });
    
    $('#setting-pills a').click(function (e) {
    	e.preventDefault()
    	$(this).tab('show')
    });
    
    $('#security-tabs a').click(function (e) {
    	e.preventDefault()
    	$(this).tab('show')
    });
});
