$(function() {
       var frmRes = $('#frmRes');
         var frmResValidator = frmRes.validate();
         
         var frmInfo = $('#frmInfo');
         var frmInfoValidator = frmInfo.validate();
         
         var frmLogin = $('#frmLogin');
         var frmLoginValidator = frmLogin.validate();
         
         var frmMobile = $('#frmMobile');
         var frmMobileValidator = frmMobile.validate();
         
         $('#demo1').steps({
           onChange: function (currentIndex, newIndex, stepDirection) {
             console.log('onChange', currentIndex, newIndex, stepDirection);
             // tab1
             if (currentIndex === 0) {
               if (stepDirection === 'forward') {
                 var valid = frmRes.valid();
                 return valid;
               }
               if (stepDirection === 'backward') {
                 frmResValidator.resetForm();
               }
             }
         
         // tab2
             if (currentIndex === 1) {
               if (stepDirection === 'forward') {
                 var valid = frmInfo.valid();
                 return valid;
               }
               if (stepDirection === 'backward') {
                 frmInfoValidator.resetForm();
               }
             }
         
             // tab3
             if (currentIndex === 2) {
               if (stepDirection === 'forward') {
                 var valid = frmLogin.valid();
                 return valid;
               }
               if (stepDirection === 'backward') {
                 frmLoginValidator.resetForm();
               }
             }
         
             // tab4
             if (currentIndex === 3) {
               if (stepDirection === 'forward') {
                 var valid = frmMobile.valid();
                 return valid;
               }
               if (stepDirection === 'backward') {
                 frmMobileValidator.resetForm();
               }
             }
         
             return true;
         
           },
           onFinish: function () {
             alert('Wizard Completed');
           }
         });
		 
		 $('#demo').steps({
           onFinish: function () {
             alert('Wizard Completed');
           }
         });
});