# Nuclei scanner bot in telegram
Did a little scripting to automate the process of finding potential threats in a domain using [nuclei](https://github.com/projectdiscovery/nuclei). This bot returns the nuclei diagnostic in a relatively simplified way via Telegram. 

### BOT CONFIG
First of all, you gotta configure the bot setup in the ``pirates-send.sh`` file. To do this, you need an already running telegram bot. I followed the very first steps of [this](https://medium.com/bug-bounty/using-notify-to-send-notifications-to-a-telegram-bot-with-the-help-of-chatgpt-3ab950655a01) tutorial, but I did *not* use notify in this script.

After you get your Group ID from the channel where the bot will be running, and the bot token from ``@BotFather``, you can set them up here:

```
GROUP_ID="#SET_ID_HERE#"
BOT_TOKEN="#SET_TOKEN_HERE#"
```

After that, just save the script and it should run without any problems.

### DOMAIN CONFIG

Then, you can access ``hexdomains.txt`` and input the domains you wish to scan with NUCLEI.
