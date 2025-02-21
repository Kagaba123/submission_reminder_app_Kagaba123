#!/bin/bash
# submission_reminder_app_Ulydivine
Submission Reminder App

What It Is

This is a simple Bash script-based application that helps student about their assignment submisssion status. It creates folders and files you need.

#1.Folder structure when run the script, it will create this structure:

submission_reminder_<username>/
├── config/
│   └── config.env
├── modules/
│   └── functions.sh
├── app/
│   └── reminder.sh
├── assets/
│   └── submissions.txt
└── startup.sh

#2. What each file does

- config/config.env: It has all deatils about the assignment.
- assets/submissions.txt: Contains student data with assignment submission status.
- modules/functions.sh: Contains helper functions to process the submission data.
- app/remider.sh: Script that checks for submissions.
- startup.sh: Entey point to start the app.

#3. How to set it up

1. Clone or Download the script.
2. Make the Script Executable.
3. Run the Script:bash create_environment.sh
4. cd submission_reminder_
5. Run the Script:./startuo.sh to launch the app

#NB: :You can change the assignment info in config/config.env. #Update assets/submissions.txt with student names.
