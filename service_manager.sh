#!/bin/bash

# Check for root access
if [ "${UID}" -ne 0 ]; then
    echo 'Please run with sudo or root.'
    exit 1
fi

# Function for displaying welcome banner
function welcomeBanner {
    echo "----------------------"
    echo "  Systemctl services"
    echo "----------------------"
}

# Function for start service
function startservice {
    echo "Starting a Service......"
    read -p "Enter service name: " service_name

    if systemctl start $service_name; then
        echo "$service_name service is successfully started."
    else
        echo "$service_name service encountered an error."
    fi
}

# Function for stop service
function stopservice {
    echo "Stopping a Service......"
    read -p "Enter service name: " service_name

    if systemctl stop $service_name; then
        echo "$service_name service is successfully stopped."
    else
        echo "$service_name service encountered an error."
    fi
}

# Function for restart service
function restartservice {
    echo "Restarting a Service......"
    read -p "Enter service name: " service_name

    if systemctl restart $service_name; then
        echo "$service_name service has been successfully restarted."
    else
        echo "$service_name service encountered an error."
    fi
}

# Function for reload service
function reloadservice {
    echo "Reloading Configuration of a Service......"
    read -p "Enter service name: " service_name

    if systemctl reload $service_name; then
        echo "$service_name service has been successfully reloaded."
    else
        echo "$service_name service encountered an error."
    fi
}

# Function for enable service
function enableservice {
    echo "Enabling a Service......"
    read -p "Enter service name: " service_name

    if systemctl enable $service_name; then
        echo "$service_name service has been successfully enabled."
    else
        echo "$service_name service encountered an error."
    fi
}

# Function for disable service
function disableservice {
    echo "Disabling a Service......"
    read -p "Enter service name: " service_name

    if systemctl disable $service_name; then
        echo "$service_name service has been successfully disabled."
    else
        echo "$service_name service encountered an error."
    fi
}

# Function for status service
function statuservice {
    echo "Checking the Status of a Service......"
    read -p "Enter service name: " service_name

    if systemctl status $service_name; then
        echo "$service_name service status checked successfully."
    else
        echo "$service_name service encountered an error."
    fi
}

# Function for Listing all Services
function listingservice {
    echo "Listing all Services......"
    output=$(systemctl list-unit-files --type=service)
    echo "$output"
}

# Function for Viewing Service Logs
function viewingservice {
    echo "Viewing Service Logs......"
    read -p "Enter service name: " service_name
    output=$(journalctl -u $service_name)
    echo "$output"
}

# Function for mask service
function maskingservice {
    echo "Masking a Service......"
    read -p "Enter service name: " service_name

    if systemctl mask $service_name; then
        echo "$service_name service is successfully masked."
    else
        echo "$service_name service is not masked."
    fi
}

# Function for unmask service
function unmaskingservice {
    echo "Unmasking a Service......"
    read -p "Enter service name: " service_name

    if systemctl unmask $service_name; then
        echo "$service_name service is successfully unmasked."
    else
        echo "$service_name service is masked."
    fi
}

# Function for Check if a Service is Enabled
function serviceisenabled {
    echo "Check if a Service is Enabled for Startup......"
    read -p "Enter service name: " service_name

    if systemctl is-enabled $service_name; then
        echo "$service_name service is enabled."
    else
        echo "$service_name service is disabled."
    fi
}

# main script
welcomeBanner
while true; do
        echo "Choose options: "
        echo "1) Start Service "
        echo "2) Stop Service "
        echo "3) Restart Service "
        echo "4) Reload Service "
        echo "5) Enable Service "
        echo "6) Disable Service "
        echo "7) Status Service "
        echo "8) Listing All Service "
        echo "9) Viewing Service Logs "
        echo "10) Masking Service "
        echo "11) Unmasking Service "
        echo "12) Check if a Service is Enabled"
        echo "13) Exit"
        read -p "Enter your choice (1/2/3/..../11): " main_choice

        case $main_choice in
            1) startservice ;;
            2) stopservice ;;
            3) restartservice ;;
            4) reloadservice ;;
            5) enableservice ;;
            6) disableservice ;;
            7) statuservice ;;
            8) listingservice ;;
            9) viewingservice ;;
            10) maskingservice ;;
            11) unmaskingservice ;;
            12) serviceisenabled;;
            13)
                echo "Exiting script.........."
                exit ;;
            *)
                echo "Invalid option. Please choose a valid option."
                ;;
        esac
done
