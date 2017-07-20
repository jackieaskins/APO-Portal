$(document).on('turbolinks:load', function () {

    $('#new_fellowship').submit(function() {
        if ($('#fellowship_fellowship_hosts_attributes_0_host_id').find(':selected').text() === '') {
            $('#fellowship_fellowship_hosts_attributes_0_host_id').prop('disabled', true);
        }
    });

    // $(document).on('click', '.remove-row', function() {
    //     $(this).parents('tr').remove();
    // });

    // $(document).on('change', '.additional-attendees', function() {
    //     var attendee_id = $(this).find(':selected').val();
    //     if (attendee_id === '') {
    //         $submit_btn.prop('disabled', true);
    //     } else {
    //         $(this).parent().prev().children.val(attendee_id);
    //         $submit_btn.prop('disabled', false);
    //     }
    // });

    // $('#add_additional_attendee').click(function() {
    //     var $new_row = $('#additional_attendee_row').clone();
    //     $new_row.removeAttr('id');
    //     $new_row.removeAttr('hidden');
    //     $new_row.find('input').prop('disabled', false);
    //     $('#additional_attendee_row').before($new_row);
    //     $submit_btn.prop('disabled', true);
    // });
});

