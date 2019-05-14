$.validator.addMethod("fullnamevalidator", function(value, element) {
	return this.optional(element) || /^[A-Za-z ]*$/i.test(value);
}, "Letters, numbers, and underscores only please");

$.validator.addMethod("alphanumeric", function(value, element) {
	return this.optional(element) || /^\w+$/i.test(value);
}, "Letters, numbers, and underscores only please");

$.validator.addMethod("pwdvalidator", function(value, element) {
	return this.optional(element)
			|| /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/i.test(value);
}, "Minimum 8 charcters ,Please enter atleast one letter and one number");

$.validator.addMethod("emailvalidator", function(value, element) {
	return this.optional(element)
			|| /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/i
					.test(value);
}, "Only letters, numbers, underline, hyphen and period allowed");

$('#my-form')
		.validate(
				{
					rules : {
						full_name : {
							required : true,
							fullnamevalidator : true
						},
						username : {
							required : true,
							alphanumeric : true
						},
						password : {
							required : true,
							pwdvalidator : true
						},
						email_address : {
							required : true,
							emailvalidator : true
						}
					},
					messages : {
						full_name : {
							required : 'Full name mandatory',
							fullnamevalidator : 'Letters, and underscores only please'
						},
						username : {
							required : 'Username mandatory',
							alphanumeric : 'Letters, numbers, and underscores only please'
						},
						password : {
							required : 'Password Mandatory',
							pwdvalidator : 'Minimum 8 charcters,Please enter atleast one letter and one number'
						},
						email_address : {
							required : 'Email mandatory',
							emailvalidator : 'Only letters, numbers, underline, hyphen and period allowed'
						}
					},

					submitHandler : function(form) {

						form.submit();

					}
				})