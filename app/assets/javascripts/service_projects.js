$(document).on('turbolinks:load', function () {
    var LOGISTICS_NUMBER_FIELD = '.logistics-number-field';
    var TRAVEL_TIME = '#travel_time';
    var PROJECT_LENGTH = '#project_length';
    var SPECIFY_ATTENDEES_BTN = '#specify_attendees_btn';
    var PROJECT_ATTENDEE_INFO = '#project_attendee_info';
    var SERVICE_PROJECT_POINTS = '.service-project-points';
    var ATTENDEES_NUMBER_FIELD = '.attendees-number-field';
    var ADDITIONAL_ATTENDEES = '.additional-attendees';
    var ADD_ADDITIONAL_ATTENDEE = '#add_additional_attendee';
    var ADDITIONAL_CONTENT_ROW = '#additional_content_row';
    var REMOVE_ROW = '.remove-row';
    var SUBMIT_BTN = '.submit-btn';

    var totalProjectLength = 0;

    $(LOGISTICS_NUMBER_FIELD).on('keyup paste', function () {
        var isNumber = numberFieldVerification($(this).val());
        if (isNumber) {
            $(this).parent().removeClass('has-error');
            $(this).next().removeClass('help-block');
            if ($(PROJECT_ATTENDEE_INFO).is(':hidden')) {
                $(SPECIFY_ATTENDEES_BTN).prop('disabled', false);
            }
        } else {
            $(this).parent().addClass('has-error');
            $(this).next().addClass('help-block');
            $(SPECIFY_ATTENDEES_BTN).prop('disabled', true);
        }
    });

    $(document).on('keyup paste', ATTENDEES_NUMBER_FIELD, function () {
        var isNumber = numberFieldVerification($(this).val());
        if (isNumber) {
            $(this).parent().removeClass('has-error');
            $(this).next().removeClass('help-block');
            $(SUBMIT_BTN).prop('disabled', false);
        } else {
            $(this).parent().addClass('has-error');
            $(this).next().addClass('help-block');
            $(SUBMIT_BTN).prop('disabled', true);
        }
    });

    $(SPECIFY_ATTENDEES_BTN).click(function () {
        totalProjectLength = parseFloat($(PROJECT_LENGTH).val());
        var travelTime = parseFloat($(TRAVEL_TIME).val());
        if (travelTime >= 0.5) {
            totalProjectLength += travelTime;
        }
        $(SERVICE_PROJECT_POINTS).val(totalProjectLength);
        $(SUBMIT_BTN).prop('disabled', false);
        $(PROJECT_ATTENDEE_INFO).removeAttr('hidden');
        $(SPECIFY_ATTENDEES_BTN).prop('disabled', true);
    });

    $(ADD_ADDITIONAL_ATTENDEE).click(function () {
        var newRow = $(ADDITIONAL_CONTENT_ROW).clone();
        newRow.removeAttr('id');
        newRow.removeAttr('hidden');
        newRow.find('input.service-project-points').prop('disabled', false);
        newRow.find('select').prop('disabled', false);
        $(ADDITIONAL_CONTENT_ROW).before(newRow);
        $(SUBMIT_BTN).prop('disabled', true);
    });

    $(document).on('change', ADDITIONAL_ATTENDEES, function () {
        var attendeeId = $(this).find(':selected').val();
        if (attendeeId === '') {
            $(SUBMIT_BTN).prop('disabled', true);
        } else {
            $(this).parent().prev().children().val(attendeeId);
            $(this).parent().next().children().attr('name', "attendees_points[" + attendeeId + "]");
            $(SUBMIT_BTN).prop('disabled', false);
        }
    });

    $(document).on('click', REMOVE_ROW, function () {
        $(this).parents('tr').remove();
    });

    // Additional Functions
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

