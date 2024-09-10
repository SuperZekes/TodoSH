#!/bin/bash

# Path to the to-do list file
TODO_FILE="$HOME/todo_list.txt"

# Function to display the to-do list
display_todo() {
    if [ ! -f "$TODO_FILE" ]; then
        echo "No to-do list found. Start adding tasks!"
        return
    fi

    echo "To-Do List:"
    cat -n "$TODO_FILE"
}

# Function to add a task
add_task() {
    echo "$1" >> "$TODO_FILE"
    echo "Task added: $1"
}

# Function to remove a task
remove_task() {
    sed -i "${1}d" "$TODO_FILE"
    echo "Task $1 removed."
}

# Function to clear the to-do list
clear_list() {
    > "$TODO_FILE"
    echo "To-do list cleared."
}

# Main menu loop
while true; do
    echo ""
    echo "===== To-Do List ====="
    display_todo
    echo ""
    echo "Options:"
    echo "1) Add task"
    echo "2) Remove task"
    echo "3) Clear list"
    echo "4) Quit"
    echo -n "Choose an option: "
    read -r option

    case $option in
        1)
            echo -n "Enter the task: "
            read -r task
            add_task "$task"
            ;;
        2)
            echo -n "Enter the task number to remove: "
            read -r task_num
            remove_task "$task_num"
            ;;
        3)
            clear_list
            ;;
        4)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac
done
