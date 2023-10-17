window.addEventListener('DOMContentLoaded', function(){
    $(document).on('turbolinks:load', function() {
        $('.linkArea-user').on('click',function(){
            $('.dropdown-menu').toggle();
            console.log("押されてるよ");
        });
    });
});
