(function (global, undefined) {
    var demo = window.demo = window.demo || {},
        isToolTipShown = true,
        progressBar,
        firstNameInput,
        lastNameInput,
        occupationInput,
        birthdayDatePicker,
        genderComboBox,
        radToolTip,
        PROGRESS_BAR_STEP = 20;

    function progressBar_load(sender, args) {
        progressBar = sender;
    }
    function firstName_load(sender, args) {
        firstNameInput = sender;
    }
    function lastName_load(sender, args) {
        lastNameInput = sender;
    }
    function genderDD_load(sender, args) {
        genderComboBox = sender;
    }
    function occupation_load(sender, args) {
        occupationInput = sender;
    }

    demo.initialize = function () {
        birthdayDatePicker = $find(demo.birthdayPickerID);
        radToolTip = $find(demo.tooltipID);

        demo.updateProgressLabel(progressBar.get_value());
        demo.updateProgressBar();
        demo.setFocusOnFormStart();

        var inputEventHandlers = {
            keyup: demo.updateProgressBar,
            mouseup: demo.inputCleared
        };

        $telerik.$(".registrationForm .riTextBox").on(inputEventHandlers);
    };

    demo.setFocusOnFormStart = function () {
        radToolTip.show();
        setTimeout(function () {
            firstNameInput.focus();
        }, 50);
    };

    demo.updateProgressLabel = function (value) {
        $get("progressValue").innerHTML = value + "%";
    };

    demo.elementFocused = function (sender, eventArgs) {
        demo.setToolTipPosition(sender.Owner ? sender.Owner.get_element().parentNode : sender.get_element(), true);
    };

    demo.onPopupOpening = function (sender, eventArgs) {
        sender.get_textBox().focus();
    };

    demo.setToolTipPosition = function (target) {
        if (radToolTip != null) {
            // calculate the position, in which the tooltip should be moved or shown
            var targetBounds = $telerik.getBounds(target);
            var ttipPopupBounds = $telerik.getBounds(radToolTip.get_popupElement());
            var desiredToolTipPosition = {
                x: targetBounds.width + targetBounds.x + 15,
                y: targetBounds.height / 2 + targetBounds.y - ttipPopupBounds.height / 2
            };

            // if the tooltip is already shown move it to the new location with animation
            if (isToolTipShown) {
                $telerik.setLocation(radToolTip.get_popupElement(), desiredToolTipPosition);
                isToolTipShown = false;
            }
            else {
                $telerik.$(radToolTip.get_popupElement()).animate({ top: desiredToolTipPosition.y }, 500);
            }
        }
    };

    demo.valueChanged = function (sender, eventArgs) {
        demo.updateProgressBar();
    };

    demo.selectedIndexChanged = function (sender, eventArgs) {
        demo.updateProgressBar();
    };

    demo.updateProgressBar = function () {
        var formCompletion = 0;
        formCompletion += (firstNameInput.get_element().value != "") ? PROGRESS_BAR_STEP : 0;
        formCompletion += (lastNameInput.get_element().value != "") ? PROGRESS_BAR_STEP : 0;
        formCompletion += (occupationInput.get_element().value != "") ? PROGRESS_BAR_STEP : 0;
        formCompletion += (birthdayDatePicker.get_selectedDate() != null &&
                           !birthdayDatePicker.get_dateInput().get_invalid() &&
                           birthdayDatePicker.get_dateInput().get_element().value != "") ? PROGRESS_BAR_STEP : 0;
        formCompletion += (genderComboBox.get_selectedItem() != null) ? PROGRESS_BAR_STEP : 0;

        progressBar.set_value(formCompletion);
        demo.updateProgressLabel(formCompletion);
    };

    demo.inputCleared = function (e) {
        var input = $telerik.$(this),
            oldValue = input.val();

        if (oldValue == "") {
            return;
        }
        setTimeout(function () {
            var newValue = input.val();
            if (newValue == "") {
                demo.updateProgressBar();
            }
        }, 1);
    };

    Sys.Application.add_load(function () {
        demo.initialize();
    });

    function serverID(name, id) {
        demo[name] = id;
    }

    function serverIDs(obj) {
        for (var name in obj) {
            serverID(name, obj[name]);
        }
    }

    global.serverIDs = serverIDs;
    global.progressBar_load = progressBar_load;
    global.firstName_load = firstName_load;
    global.lastName_load = lastName_load;
    global.genderDD_load = genderDD_load;
    global.occupation_load = occupation_load;
})(window);