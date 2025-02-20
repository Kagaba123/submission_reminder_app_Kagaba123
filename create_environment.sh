#!/bin/bash

# Prompt for user's name
read -p "Enter your name: " user

# Define main directory
dir="submission_reminder_${user}"

# Create directory structure
mkdir -p "$dir/config"
mkdir -p "$dir/modules"
mkdir -p "$dir/app"
mkdir -p "$dir/assets"

# Create necessary files
touch "$dir/config/config.env"
touch "$dir/assets/submissions.txt"
touch "$dir/app/reminder.sh"
touch "$dir/modules/functions.sh"
touch "$dir/startup.sh"


# Populate config.env
cat << EOF > "$dir/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Populate submissions.txt with sample student records
cat << EOF > "$dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Kagaba, Shell Navigation, not submitted
Marcel, Shell Basics, submitted
Alain, Shell Navigation, not submitted
Elvis, Shell Navigation, not submitted
Wacka, Shell Navigation, not submitted
Yves, Shell Navigation, not submitted
Tudor, Shell Navigation, submitted
EOF

# Populate functions.sh
cat << 'EOF' > "$dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

# Populate reminder.sh
cat << 'EOF' > "$dir/app/reminder.sh"
#!/bin/bash
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

# Populate startup.sh
cat << 'EOF' > "$dir/startup.sh"
#!/bin/bash
echo "Starting Submission Reminder App..."
./app/reminder.sh
EOF

# Make scripts executable
chmod +x "$dir/modules/functions.sh"
chmod +x "$dir/startup.sh"
chmod +x "$dir/app/reminder.sh"
