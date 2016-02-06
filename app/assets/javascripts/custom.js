$(function(){
    $('#search').autocomplete({
            minLength: 2,
            source: '/search_suggestions',
            focus: function(event, ui) {
                $('#search').val(ui.item.term_type);
                return false;
            },
            select: function(event, ui) {
                if(ui.item.course_id== null){
                  location.href = "/posts?utf8=✓&search="+encodeURI(ui.item.term);
                }
                else{
                  location.href = "/posts/"+ui.item.course_id;  
                }
                return false;
            }
        })
        .data( "uiAutocomplete" )._renderItem = function( ul, item ) {
            return $( "<li></li>" )
                .data( "item.uiAutocomplete", item )
                .append( "<a>" + item.term + "</a>" )
                .appendTo( ul );
        };
});

