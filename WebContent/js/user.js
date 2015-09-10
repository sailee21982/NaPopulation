$.validator.addMethod("passprtNumberRegex", function(value, element) {
    return this.optional(element) || /^[a-z0-9\-\s]+$/i.test(value);
});

$(document).ready(function(){
	$("#btn1").click(function(){
		$("#userForm").validate({
            rules: {
            	fname: "required",
            	lname: "required",
            	city: "required",
            	state: "required",
            	country: "required",
            	hhi: "required",
            	passportNumber: {
            		required: true,
            		passprtNumberRegex: true
            	},
            	zipCode: {
            		  required: true,
            	      number: true
            	    },
			    dob: {
			        required: true,
			        date: true
			      },
            	
            },
            messages: {
            	fname: "  Please enter your First name",
            	lname: "  Please enter your Last name",
            	zipCode: "  Please enter your numeric value",
            	city: "  Please enter your City",
            	state: "  Please enter your State",
            	country: "  Please enter your Country",
            	hhi: "  Please enter your Income",
            	passportNumber: {
                    required: "  Please enter your Passport Number",
                	passprtNumberRegex: " Alphabets and numbers only",
                },
	        	dob: {
	                required: "  Please enter your Date Of Birth",
	            	date: " Please enter in the format mm/dd/yyyy",
	            },
                zipCode: {
          		  required: "  Please enter your Zip Code",
          	      number: "  Please enter numeric value",
          	    },
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
	});
});
