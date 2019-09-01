# Default time a notification is show, unless specified in notification
DEFAULT_NOTIFY_TIMEOUT = 4500 # milliseconds

# Maximum time a notification is allowed to show
MAX_NOTIFY_TIMEOUT = 6000 # milliseconds

# Maximum number of characters in a notification. 
NOTIFICATION_MAX_LENGTH = 100 # number of characters

# Time between regular status updates
STATUS_UPDATE_INTERVAL = 1.0 # seconds

# os must be imported to use os.getenv
import os
STATUS_COMMAND = ['echo'] 
 
# Always show text from STATUS_COMMAND? If false, only show notifications
USE_STATUSTEXT=True
 
# Put incoming notifications in a queue, so each one is shown.
# If false, the most recent notification is shown directly.
QUEUE_NOTIFICATIONS=True

# update_text(text) is called when the status text should be updated
# If there is a pending notification to be formatted, it is appended as
# the final argument to the STATUS_COMMAND, e.g. as $1 in default shellscript
 
# dwm statusbar update
def update_text(text):
    first_line = text.split('\n')[0]
    if not first_line:
        first_line = ""
    with open('/tmp/last_notification.txt', 'w') as out_file:
        print(first_line)
        out_file.write(str(first_line))
