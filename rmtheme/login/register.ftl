<#import "template.ftl" as layout>
<@layout.registrationLayout; section>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="card" id="register-info-card">
                        <div class="card-body">
                            <h4>${msg("disclaimerTitle")}</h4>

                            <p>${msg("disclaimer")}</p>
                            <p>
                                <span id="registration-intro" class="btn btn-success btn-lg btn-block">${msg("startRegistration")}</span>
                            </p>
                        </div>
                    </div>
                    <div class="card" id="register-card">
                        <div class="card-body">
                            <form action="${url.registrationAction}" method="post" id="wizard" class="form">
                                <!-- SECTION 1 -->
                                <h2></h2>
                                <section>
                                    <div class="inner">
                                        <div class="form-content">
                                            <div class="form-header">
                                                <h3 style="color:#000;">${msg("headerPersonal")}</h3>
                                            </div>
                                            <div class="form-row">
                                                <div class="col form-group">
                                                    <label for="account-type">${msg("companyQuestion")}</label>
                                                    <select id="account-type" name="account-type"
                                                            class="required form-control">
                                                        <option value="2">${msg("doNo")}</option>
                                                        <option value="1">${msg("doYes")}</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div id="organisation-wrapper">
                                                <div class="form-row">
                                                    <div class="col form-group">
                                                        <label for="company">${msg("companyName")}</label>
                                                        <input type="text" placeholder="${msg("companyName")}" id="user.attributes.company"
                                                               name="company" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="col form-group">
                                                        <label for="type">${msg("companyType")}</label>
                                                        <input name="type" id="user.attributes.type"
                                                               list="type_list"
                                                               class="form-control" autocomplete="none">
                                                        <datalist id="type_list" autocomplete="off">

                                                        </datalist>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="firstname">${msg("firstName")}</label>
                                                    <input type="text" id="firstName" name="firstName"
                                                           placeholder="${msg("firstName")}"
                                                           class="form-control required" value="${(register.formData.firstName!'')}">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="lastname">${msg("lastName")}</label>
                                                    <input type="text" id="lastName" placeholder="${msg("lastName")}"
                                                           name="lastName"
                                                           class="form-control required" value="${(register.formData.lastName!'')}">
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col form-group">
                                                    <label for="email">${msg("email")}</label>
                                                    <input type="email" id="email" name="email" placeholder="${msg("email")}"
                                                           class="form-control required" value="${(register.formData.email!'')}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>

                                <!-- SECTION 2 -->
                                <h2></h2>
                                <section>
                                    <div class="inner">
                                        <div class="form-content">
                                            <div class="form-header">
                                                <h3 style="color:#000;">${msg("headerContact")}</h3>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-9 form-group">
                                                    <label for="street">${msg("street")}</label>
                                                    <input type="text" id="user.attributes.street" name="user.attributes.street"
                                                           placeholder="${msg("street")}"
                                                           class="form-control required">
                                                </div>
                                                <div class="col-3 form-group">
                                                    <label for="housenumber">&nbsp;</label>
                                                    <input type="text" id="user.attributes.housenumber" name="user.attributes.housenumber" maxlength="5"
                                                           placeholder="${msg("housenumber")}" class="form-control required">
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-12 form-group">
                                                    <label for="zipcode">${msg("postal_code")}</label>
                                                    <input type="text" placeholder="${msg("postal_code")}" name="user.attributes.zipcode" id="user.attributes.zipcode" maxlength="5"
                                                           class="form-control required">
                                                </div>

                                            </div>
                                            <div class="form-row">
                                                <div class="col-12 form-group">
                                                    <label for="city">${msg("locality")}</label>
                                                    <input type="text" id="user.attributes.city" name="user.attributes.city" placeholder="${msg("locality")}"
                                                           class="form-control required">
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-12">
                                                    <label for="phone">${msg("telephonenumber")}</label>
                                                    <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1">+49</span>
                                                    </div>
                                                    <input type="text" id="user.attributes.phone" name="user.attributes.phone" maxlength="15"
                                                           placeholder="${msg("telephonenumber")}"
                                                           class="form-control required">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>


                                <!-- SECTION 3 -->
                                <h2></h2>
                                <section>
                                    <div class="inner">
                                        <div class="form-content">
                                            <div class="form-header">
                                                <h3 style="color:#000;">${msg("headerPassword")}</h3>
                                            </div>
                                            <div class="form-row">
                                                <div class="col form-group">
                                                    <label for="password">${msg("password")}</label>
                                                    <input type="password" id="password" name="password"
                                                           placeholder="${msg("password")}"
                                                           class="form-control required"
                                                           onKeyUp="checkPasswordStrength();">
                                                    <div id="password-strength-status"></div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col form-group">
                                                    <label for="confirm">${msg("passwordConfirm")}</label>
                                                    <input type="password" id="password-confirm" name="password-confirm"
                                                           placeholder="${msg("passwordConfirm")}"
                                                           class="form-control required"
                                                           onKeyUp="checkPasswordConfirm();">
                                                    <div id="password-correct"></div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group form-check">

                                                    <label class="form-check-label" for="acceptTerms">
                                                        ${msg("dataprotection")}
                                                        </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <input type="hidden" name="token" id="token" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
            var form = $("#wizard");
            var stepChanged = false;

            $(function () {
                $('#registration-intro').click(function () {

                    $('#register-info-card').hide();
                    $('#register-card').show();
                    $('#token').val(token);
                });

                $(document).on('change', '#account-type', function () {
                    var selValue = $(this).val();
                    if (selValue == 1) {
                        $('#organisation-wrapper').show();
                        $('#type').removeClass();
                        $('#type').addClass('form-control required');
                        $('#user.attributes.company').removeClass();
                        $('#user.attributes.company').addClass('form-control required');
                    } else {
                        $('#organisation-wrapper').hide();
                        $('#type').removeClass();
                        $('#type').addClass('form-control');
                        $('#user.attributes.company').removeClass();
                        $('#user.attributes.company').addClass('form-control');
                    }
                });
                $.validator.addMethod('phonecheck', function (value, element) {
                    var regex = /^\(?([0-9]{2})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})[-. ]?([0-9]{2})?([0-9]{1})?$/;
                    var regex2 = /^\(?([0-9]{4})\)?[-. ]?([0-9]{7})([0-9]{1})?$/;
                    var phoneno = /^\+?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})[-. ]?([0-9]{2})?([0-9]{1})?$/;
                    var phoneno2 = /^\+?([0-9]{2})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{7})[-. ]?([0-9]{1})?$/;
                    if (regex.test(value) || phoneno.test(value) || regex2.test(value) || phoneno2.test(value)) {

                        return true;
                    } else {

                        return false;
                    }
                }, '${msg("erroTelephonenumber")}');

                $.validator.addMethod('zipcodeCheck', function (value, element) {
                    var regex = /^[0-9]{5}$/

                    if (regex.test(value)) {
                        return true;

                    } else {
                        return false;
                    }


                }, '${msg("errorPostalcode")}');

                $.validator.messages.required = '${msg("errorFields")}';
                $.validator.messages.email = '${msg("invalidEmailMessage")}';
                $.validator.setDefaults({
                    highlight: function (element) {
                        $(element).closest('.form-group').find(".form-control:first").addClass('is-invalid');
                    },
                    unhighlight: function (element) {
                        $(element).closest('.form-group').find(".form-control:first").removeClass('is-invalid');
                        $(element).closest('.form-group').find(".form-control:first").addClass('is-valid');
                    },
                    errorElement: 'span',
                    errorClass: 'invalid-feedback',
                    errorPlacement: function (error, element) {
                        if (element.parent('.input-group').length) {
                            error.insertAfter(element.parent());
                        } else {
                            error.insertAfter(element);
                        }
                    },
                    rules: {
                        phone: {
                            phonecheck: true
                        },
                       zipcode: {
                            zipcodeCheck: true
                        }
                    }
                });

                $("#wizard").steps({
                    headerTag: "h2",
                    bodyTag: "section",
                    enableAllSteps: true,
                    transitionEffect: "fade",
                    transitionEffectSpeed: 300,
                    labels: {
                        finish: "${msg('doRegister')}",
                        next: "${msg('doContinue')}",
                        previous: "${msg('doBack')}"
                    },
                    onInit: function (event, currentIndex) {
                        $('.actions ul li a').addClass('btn btn-primary btn-lg');
                        $('.actions ul li:last-child a').removeClass('btn-primary').addClass('btn-success');
                    },
                    onFinished: function (event, currentIndex) {
                        document.getElementById("wizard").submit();
                    },
                    onStepChanging: function (event, currentIndex, newIndex) {
                        if (currentIndex > newIndex) {
                            stepChanged = true;
                            return true;
                        }
                        if (currentIndex < newIndex) {
                            // To remove error styles
                            form.find(".body:eq(" + newIndex + ") label.error").remove();
                            form.find(".body:eq(" + newIndex + ") .error").removeClass("form-control is-invalid");
                        }

                        stepChanged = form.valid();
                        return form.valid();
                    },
                    onFinishing: function (event, currentIndex) {
                        form.validate().settings.ignore = ":disabled";
                        if (!checkPasswordStrength()) {
                            $('#password').focus();
                            stepChanged = false;
                            return false;
                        }
                        if (!checkPasswordConfirm()) {
                            $('#password-confirm').focus();
                            stepChanged = false;
                            return false;
                        }

                        $('#ftco-loader').addClass('show');

                        return form.valid();
                    }
                });
                $('.wizard > .steps li a').click(function () {
                    if (stepChanged) {
                        $(this).parent().addClass('checked');
                        $(this).parent().prevAll().addClass('checked');
                        $(this).parent().nextAll().removeClass('checked');
                    }

                });
                // Custome Jquery Step Button
                $('.forward').click(function () {
                    $("#wizard").steps('next');
                })
                $('.backward').click(function () {
                    $("#wizard").steps('previous');
                })
            });

            function checkPasswordStrength() {
                var number = /([0-9])/;
                var alphabets = /([a-zA-Z])/;
                var special_characters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;
                if ($('#password').val().length < 6) {
                    $('#password-strength-status').removeClass();
                    $('#password-strength-status').addClass('weak-password');
                    $('#password-strength-status').html("${kcSanitize(msg('invalidPasswordMinLengthMessage',('6')))?no_esc}");
                    $('#password').removeClass();
                    $('#password').addClass('form-control is-invalid');
                    $('#password').focus();
                    return false;
                } else {
                    if ($('#password').val().match(number) && $('#password').val().match(alphabets) && $('#password').val().match(special_characters)) {
                        $('#password-strength-status').removeClass();
                        $('#password-strength-status').addClass('strong-password');
                        $('#password-strength-status').html("");
                        $('#password').removeClass();
                        $('#password').addClass('form-control is-valid');
                        return true;
                    } else {
                        $('#password-strength-status').removeClass();
                        $('#password-strength-status').addClass('medium-password');
                        $('#password-strength-status').html("${msg('passwordRequiremtens')}");
                        $('#password').removeClass();
                        $('#password').addClass('form-control is-invalid');
                        $('#password').focus();
                        return false;
                    }
                }
            };

            function checkPasswordConfirm() {
                if ($('#password').val() == $('#password-confirm').val()) {

                    $('#password-correct').removeClass();
                    $('#password-correct').addClass('strong-password');
                    $('#password-correct').html("");
                    $('#confirm').removeClass();
                    $('#confirm').addClass('form-control is-valid');
                    return true;
                } else {
                    $('#password-correct').removeClass();
                    $('#password-correct').addClass('strong-password');
                    $('#password-correct').html("${msg('notMatchPasswordMessage')}");
                    $('#confirm').removeClass();
                    $('#confirm').addClass('form-control is-invalid');
                    $('#confirm').focus();
                    return false;
                }
            }

        </script>

    <style type="text/css">
        .steps {
            margin-bottom: 30px
        }

        .steps ul {
            list-style-type: none;
            display: flex;
            position: relative;
            padding: 0;
        }

        .steps ul li {
            width: 33%;
            margin-right: 10px;
        }

        .steps ul li a {
            display: inline-block;
            width: 100%;
            height: 7px;
            background: #e6e6e6;
            border-radius: 3.5px
        }

        .steps ul li.first a,
        .steps ul li.checked a {
            background: #1AA4C2;
            transition: all 0.5s ease
        }

        .steps ul:before {
            font-size: 22px;
            top: -38px;
            position: absolute
        }

        .wizard > .steps .current-info,
        .wizard > .steps .number {
            display: none
        }

        .actions ul {
            list-style-type: none;
            display: flex;
            margin-top: 30px;
            justify-content: space-between;
            margin-left: 0;
            padding: 0;
        }

        .actions ul.step-last {
            justify-content: flex-end
        }

        .actions ul.step-last li:first-child {
            display: none
        }

        .actions li[aria-disabled="true"] a {
            display: none
        }


        #organisation-wrapper {
            display: none;
        }

        #register-card {
            display: none;
        }
    </style>

</@layout.registrationLayout>
