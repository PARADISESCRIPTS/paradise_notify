# Paradise Notify

A modern, customizable notification system for FiveM servers with beautiful animations and multiple notification types.

## Features

- 🎨 Modern and sleek design
- 🔊 Sound notifications
- ⚡ Smooth animations
- 🎯 Multiple notification positions
- 🎵 Customizable notification types
- 🎯 Multiple notification positions support

## Preview
![image](https://github.com/user-attachments/assets/abc7acfa-d0c1-4395-8148-79a5e58423d4)


## Usage

### Client-side

```lua
-- Basic usage
exports['paradise_notify']:ShowNotification({
    title = 'Welcome',
    description = 'Welcome to the server!',
    type = 'success',
    position = 'top-right'
})

-- All available parameters
exports['paradise_notify']:ShowNotification({
    title = 'Custom Title',      -- Optional: Custom title (defaults based on type)
    description = 'Message',     -- Required: Notification message
    type = 'success',           -- Optional: success, error, info, warning (default: info)
    position = 'top-right',     -- Optional: Position of notification (default: top-right)
    duration = 5000            -- Optional: Duration in milliseconds (default: 5000)
})
```

### Server-side

```lua
-- Show notification to specific player
exports['paradise_notify']:ShowNotification(source, {
    title = 'Welcome',
    description = 'Welcome to the server!',
    type = 'success',
    position = 'top-right'
})

-- Show notification to all players
exports['paradise_notify']:ShowNotificationToAll({
    title = 'Server Notice',
    description = 'Server restart in 5 minutes!',
    type = 'info',
    position = 'top-right'
})
```

## Available Positions

- `top-right` (default)
- `top-left`
- `top`
- `bottom-right`
- `bottom-left`
- `bottom`
- `center-right`
- `center-left`

## Notification Types

- `success` - Green notification with check icon
- `error` - Red notification with X icon
- `info` - Blue notification with info icon
- `warning` - Yellow notification with warning icon
