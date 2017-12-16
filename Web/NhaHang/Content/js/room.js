jQuery(document).ready(function ($) {
    //Set default open/close settings
    $('.collapse  ').hide(); //Hide/close all containers

    //On Click
    $('.collapsed  ').click(function () {
        $('.collapsed  ').removeClass('active').next().slideUp(); //Remove all "active" state and slide up the immediate next container
        $(this).toggleClass('active').next().slideDown();
        return false; //Prevent the browser jump to the link anchor

    });
});