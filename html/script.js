function openPauseMenu() {
    $('body').fadeIn();
}

window.addEventListener("message", function (event) {

    let data = event.data;
  
    if (data.type === "Update_MenuPausa") {
        
        console.log('apertura')

        openPauseMenu();
    }
});

document.onkeydown = function (event) {
    event = event || window.event;
    if (event.keyCode === 27) {
        $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        console.log('Hai chiuso il Menu');
        $('body').fadeOut();
    }
};

$(document).ready(function() {
 
    $("#mappa").click(function() {
        $('body').fadeOut();
        console.log('Mappa');
        $.post(`https://${GetParentResourceName()}/mappa`, JSON.stringify({}));
    });

    $("#impostazioni").click(function() {
        $('body').fadeOut();
        console.log('Impostazioni');
        $.post(`https://${GetParentResourceName()}/impostazioni`, JSON.stringify({}));
    });

    $("#discord").click(function() {
        $('body').fadeOut();
        console.log('Discord');
        window.invokeNative('openUrl', 'https://discord.gg/v5SExR8g')
        $.post(`https://${GetParentResourceName()}/discord`, JSON.stringify({}));
    });

    $("#quit").click(function() {
        console.log('Uscita dal Game');
        $.post(`https://${GetParentResourceName()}/disconnetti`, JSON.stringify({}));
    });
});
