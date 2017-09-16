$(document).on('turbolinks:load', function () {
    var NEW_FELLOWSHIP = '#new_fellowship';
    var HOST_ID = '#fellowship_fellowship_hosts_attributes_0_host_id';
    var SUBMIT_BTN = '#fellowship_submit_btn';
    var REMOVE_ROW = '.fellowship-remove-row';
    var ADDITIONAL_ATTENDEES = '.fellowship-additional-attendees';
    var ADD_ADDITIONAL_ATTENDEE = '#fellowship_add_additional_attendee';
    var ADDITIONAL_ATTENDEE_ROW = '#fellowship_additional_attendee_row';

    $(NEW_FELLOWSHIP).submit(function() {
        if ($(HOST_ID).find(':selected').text() === '') {
            $(HOST_ID).prop('disabled', true);
        }
    });

    $(document).on('click', REMOVE_ROW, function() {
        $(this).parents('tr').remove();
    });

    $(document).on('change', ADDITIONAL_ATTENDEES, function() {
        var attendeeId = $(this).find(':selected').val();
        if (attendeeId === '') {
            $(SUBMIT_BTN).prop('disabled', true);
        } else {
            $(this).parent().prev().children().val(attendeeId);
            $(SUBMIT_BTN).prop('disabled', false);
        }
    });

    $(ADD_ADDITIONAL_ATTENDEE).click(function() {
        var $newRow = $(ADDITIONAL_ATTENDEE_ROW).clone();
        $newRow.removeAttr('id');
        $newRow.removeAttr('hidden');
        $newRow.find('input').prop('disabled', false);
        $newRow.find('select').prop('disabled', false);
        $(ADDITIONAL_ATTENDEE_ROW).before($newRow);
        $(SUBMIT_BTN).prop('disabled', true);
    });
});

