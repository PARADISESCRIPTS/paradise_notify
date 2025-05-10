let notifications = [];
const maxNotifications = 5;

window.addEventListener('message', function(event) {
    if (event.data.type === 'show') {
        showNotification(event.data.notification);
    }
});

function showNotification(data) {
    const notification = document.createElement('div');
    notification.className = `notification ${data.type}`;
    
    const icon = document.createElement('i');
    icon.className = `fas fa-${data.icon}`;
    
    const content = document.createElement('div');
    content.className = 'notification-content';
    
    const title = document.createElement('div');
    title.className = 'notification-title';
    title.textContent = data.title || getDefaultTitle(data.type);
    
    const description = document.createElement('div');
    description.className = 'notification-description';
    description.textContent = data.message;
    
    content.appendChild(title);
    content.appendChild(description);
    notification.appendChild(icon);
    notification.appendChild(content);
    
    const progressBar = document.createElement('div');
    progressBar.className = 'progress-bar';
    notification.appendChild(progressBar);
    
    let container = document.getElementById(`notifications-${data.position}`);
    if (!container) {
        container = document.createElement('div');
        container.id = `notifications-${data.position}`;
        container.className = `notifications ${data.position}`;
        document.body.appendChild(container);
    }
    
    container.appendChild(notification);
    
    const duration = data.duration || 5000;
    progressBar.style.animation = `progress ${duration}ms linear forwards`;
    
    const audio = new Audio('notify.mp3');
    audio.volume = 0.5;
    audio.play().catch(() => {});
    
    setTimeout(() => {
        notification.classList.add('hide');
        setTimeout(() => {
            if (notification.parentNode) {
                notification.parentNode.removeChild(notification);
                notifications = notifications.filter(n => n !== notification);
            }
        }, 500);
    }, duration);
    
    notifications.push(notification);
    if (notifications.length > maxNotifications) {
        const oldestNotification = notifications.shift();
        if (oldestNotification && oldestNotification.parentNode) {
            oldestNotification.classList.add('hide');
            setTimeout(() => {
                if (oldestNotification.parentNode) {
                    oldestNotification.parentNode.removeChild(oldestNotification);
                }
            }, 500);
        }
    }
    
    notification.addEventListener('mouseenter', () => {
        progressBar.style.animationPlayState = 'paused';
    });
    
    notification.addEventListener('mouseleave', () => {
        progressBar.style.animationPlayState = 'running';
    });
}

function getDefaultTitle(type) {
    const titles = {
        success: 'Success',
        error: 'Error',
        info: 'Information',
        warning: 'Warning'
    };
    return titles[type] || 'Notification';
} 