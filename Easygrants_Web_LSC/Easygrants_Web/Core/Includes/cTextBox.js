function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }
function maskChange(objInput) {
               
     if (!isValid(objInput.value)) {
       //alert("Invalid data");
       objInput.value = objInput.validValue || "";
       objInput.focus();
       objInput.select(); 
     } else {
       objInput.validValue = objInput.value;
     }
   }
var reValidString = /^\d*$/;
 function isValid(strValue) {
      return reValidString.test(strValue) || 
         strValue.length == 0;
   }

