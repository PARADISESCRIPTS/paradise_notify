local display = false

local defaultSettings = {
    maxNotifications = 5,
    defaultDuration = 5000,
    animationDuration = 500,
    soundEnabled = true,
    volume = 0.5
}

local notificationTypes = {
    success = {
        icon = 'check-circle',
        color = '#4CAF50',
        sound = 'success'
    },
    error = {
        icon = 'times-circle',
        color = '#F44336',
        sound = 'error'
    },
    info = {
        icon = 'info-circle',
        color = '#2196F3',
        sound = 'info'
    },
    warning = {
        icon = 'exclamation-triangle',
        color = '#FFC107',
        sound = 'warning'
    }
}

RegisterNUICallback('hideFrame', function(_, cb)
    display = false
    SetNuiFocus(false, false)
    cb('ok')
end)

function ShowNotification(data)
    if type(data) ~= 'table' then return end
    
    local type = data.type or 'info'
    local title = data.title or getDefaultTitle(type)
    local description = data.description or ''
    local duration = data.duration or defaultSettings.defaultDuration
    local position = data.position or 'top-right'

    if not notificationTypes[type] then type = 'info' end

    SendNUIMessage({
        type = 'show',
        notification = {
            type = type,
            title = title,
            message = description,
            duration = duration,
            icon = notificationTypes[type].icon,
            color = notificationTypes[type].color,
            sound = notificationTypes[type].sound,
            position = position
        }
    })
end

function getDefaultTitle(type)
    local titles = {
        success = 'Success',
        error = 'Error',
        info = 'Information',
        warning = 'Warning'
    }
    return titles[type] or 'Notification'
end

exports('ShowNotification', ShowNotification)

RegisterCommand('testnotify', function()
    if not Config.Debug then
        ShowNotification({
            title = 'Debug Mode',
            description = 'Debug mode is not enabled in config.lua',
            type = 'error'
        })
        return
    end

    ShowNotification({
        title = 'Top Center',
        description = 'This is a top center notification',
        type = 'success',
        position = 'top'
    })
    Wait(1000)
    ShowNotification({
        title = 'Top Right',
        description = 'This is a top right notification',
        type = 'error',
        position = 'top-right'
    })
    Wait(1000)
    ShowNotification({
        title = 'Top Left',
        description = 'This is a top left notification',
        type = 'info',
        position = 'top-left'
    })
    Wait(1000)
    
    ShowNotification({
        title = 'Center Right',
        description = 'This is a center right notification',
        type = 'warning',
        position = 'center-right'
    })
    Wait(1000)
    ShowNotification({
        title = 'Center Left',
        description = 'This is a center left notification',
        type = 'success',
        position = 'center-left'
    })
    Wait(1000)
    
    ShowNotification({
        title = 'Bottom Center',
        description = 'This is a bottom center notification',
        type = 'error',
        position = 'bottom'
    })
    Wait(1000)
    ShowNotification({
        title = 'Bottom Right',
        description = 'This is a bottom right notification',
        type = 'info',
        position = 'bottom-right'
    })
    Wait(1000)
    ShowNotification({
        title = 'Bottom Left',
        description = 'This is a bottom left notification',
        type = 'warning',
        position = 'bottom-left'
    })
end, false)

RegisterNetEvent('paradise_notify:client:ShowNotification')
AddEventHandler('paradise_notify:client:ShowNotification', function(data)
    ShowNotification(data)
end) 