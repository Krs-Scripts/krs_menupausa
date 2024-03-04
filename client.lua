function openPauseMenu(data)
    SendNUIMessage({
        type = "Update_MenuPausa",
    })
    SetNuiFocus(true, true)
end

RegisterKeyMapping('menu', 'open menu', 'KEYBOARD', 'ESCAPE')

RegisterCommand('menu', function()
    if not IsPauseMenuActive() then
        openPauseMenu()
        TriggerScreenblurFadeIn(0)
    end
end)

RegisterNUICallback('close', function(data)
    TriggerScreenblurFadeOut(0)
    SetNuiFocus(false, false)
end)

RegisterNUICallback('mappa', function(data)
    ActivateFrontendMenu("FE_MENU_VERSION_MP_PAUSE", true, -1)
    while not IsPauseMenuActive() do
        Wait(0)
    end
    PauseMenuceptionGoDeeper(0)
    PauseMenuceptionTheKick()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('impostazioni', function(data)
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'), 0, -1)
    SetNuiFocus(false, false)
end)

RegisterNUICallback('disconnetti', function(data)
    TriggerServerEvent("krs_pausemenu:escidalgioco")
    SetNuiFocus(false, false)
end)

RegisterNUICallback('discord', function(data)
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(0)
end)

CreateThread(function()
    while true do
        Wait(0)
        DisableControlAction(1, 200, true)
        if IsPauseMenuActive() then
            TriggerScreenblurFadeOut(0)
        end
    end
end)
