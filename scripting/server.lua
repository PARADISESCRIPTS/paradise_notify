-- Function to show notification to a specific player
function ShowNotification(source, data)
    if not source then return end
    TriggerClientEvent('paradise_notify:client:ShowNotification', source, data)
end

-- Function to show notification to all players
function ShowNotificationToAll(data)
    TriggerClientEvent('paradise_notify:client:ShowNotification', -1, data)
end

-- Export functions for other resources
exports('ShowNotification', ShowNotification)
exports('ShowNotificationToAll', ShowNotificationToAll)

-- Example usage:
-- exports['paradise_notify']:ShowNotification(source, {
--     title = 'Welcome',
--     description = 'Welcome to the server!',
--     type = 'success',
--     position = 'top-right'
-- })
-- 
-- exports['paradise_notify']:ShowNotificationToAll({
--     title = 'Server Notice',
--     description = 'Server restart in 5 minutes!',
--     type = 'info',
--     position = 'top-right'
-- }) 