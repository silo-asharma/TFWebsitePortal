$(function() {
  $('#summernote').summernote({
               height: 300, // set editor height
               placeholder: 'Hello default Summernote',
               minHeight: null, // set minimum height of editor
               maxHeight: null, // set maximum height of editor
               focus: false // set focus to editable area after initializing summernote
           });
  $('#edit').on('click',function(){
  
         $('.click2edit').summernote({focus: true});
});
        $('#save').on('click',function(){ 
         
         var markup = $('.click2edit').summernote('code');
         $('.click2edit').summernote('destroy');
       });
});