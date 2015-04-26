# Taskwarrior Email Daemon

A minimalistic script to put into a user's crontab for sending out emails of open [Taskwarrior] tasks.

## Usage

Call `send-open-tasks.sh` at the desired interval in your crontab. Per default, the current user is used as the email recipient. A different recipient address can be given as the first command line argument.

[Taskwarrior]: http://taskwarrior.org/
