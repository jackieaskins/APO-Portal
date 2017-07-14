$(document).on('turbolinks:load', function () {
    var $specify_attendees = $('#specify_attendees');
    var $project_length = $('#project_length');
    var $travel_time = $('#travel_time');
    var $service_project_points = $('.service-project-points');
    var $submit_btn = $('.submit-btn');
    var $project_attendee_info = $('#project_attendee_info');
    var $additional_attendees = $('.additional-attendees');
    var $add_additional_attendee = $('#add_additional_attendee');
    var $attendees_table = $('#project_attendee_info');
    var $additional_content_row = $('#additional_content_row');
    var $logistics_number_field = $('.logistics-number-field');
    var $attendees_number_field = $('.attendees-number-field');
    var $remove_row= $('.remove-row');

    var total_project_time = 0;

    $(document).on('keyup paste', '.attendees-number-field', function() {
        var isNumber = numberFieldVerification($(this).val());
        if (isNumber) {
            $(this).parent().removeClass('has-error');
            $(this).next().removeClass('help-block');
            $submit_btn.removeAttr('disabled');
        } else {
            $(this).parent().addClass('has-error');
            $(this).next().addClass('help-block');
            $submit_btn.attr('disabled', true);
        }
    });

    $(document).on('click', '.remove-row', function () {
        $(this).parents('tr').remove();
    });

    $logistics_number_field.on('keyup paste', function() {
        var isNumber = numberFieldVerification($(this).val());
        if (isNumber) {
            $(this).parent().removeClass('has-error');
            $(this).next().removeClass('help-block');
            if ($project_attendee_info.is(':hidden')) {
                $specify_attendees.removeAttr('disabled');
            }
        } else {
            $(this).parent().addClass('has-error');
            $(this).next().addClass('help-block');
            $specify_attendees.attr('disabled', true);
        }
    });

    $specify_attendees.click(function () {
        total_project_length = parseFloat($project_length.val());
        var travel_time = parseFloat($travel_time.val());
        if (travel_time >= 0.5) {
            total_project_length += travel_time;
        }
        $service_project_points.val(total_project_length);
        $submit_btn.removeAttr('disabled');
        $project_attendee_info.removeAttr('hidden');
        $specify_attendees.attr('disabled', true);
    });

    $(document).on('change', '.additional-attendees', function () {
        var attendee_id = $(this).find(':selected').val();
        if (attendee_id === '') {
            $submit_btn.attr('disabled', true);
        } else {
            $(this).parent().prev().children().val(attendee_id);
            $(this).parent().next().children().attr('name', "attendees_points[" + attendee_id + "]");
            $submit_btn.removeAttr('disabled');
        }
    });

    $add_additional_attendee.click(function () {
        var $new_row = $additional_content_row.clone();
        $new_row.removeAttr('id');
        $new_row.removeAttr('hidden');
        $new_row.find('input.service-project-points').removeAttr('disabled');
        $new_row.find('select').removeAttr('disabled');
        $additional_content_row.before($new_row);
        $submit_btn.attr('disabled', true);
    });

    function numberFieldVerification(val) {
        var isNumber = true;
        if (val !== '') {
            var decimalCount = 0;
            for (var i = 0; i < val.length; i++) {
                if (/^\d+$/.test(val.charAt(i))) {
                    continue;
                } else if (val.charAt(i) === '.' && decimalCount === 0) {
                    decimalCount++;
                } else {
                    isNumber = false;
                    break;
                }
            }
        }
        return isNumber;
    }

});

