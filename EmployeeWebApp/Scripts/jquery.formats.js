$(function () {
    $('#MainContent_TxtFirstName').attr({ MaxLength: 30 });
    $('#MainContent_TxtLastName').attr({ MaxLength: 30 });
    $('#MainContent_TxtZip').mask('00000-0000', {placeholder: 'XXXXX-XXXX'});
    $('#MainContent_TxtPhone').mask('(000) 000-0000', { placeholder: '(XXX) XXX-XXXX' });
    $('#MainContent_TxtHireDate').mask('00/00/0000', { placeholder: 'MM/DD/YYYY' }).datetimepicker({timepicker:false, format:'m/d/Y'});
});