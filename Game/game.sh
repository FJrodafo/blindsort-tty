#!/bin/bash

VERSION="1.0.2"

show_help() {
    cat << EOF
Welcome to the Blind Sorting game!

A simple terminal-based number sorting game!

How to play:
    - Choose the number of positions (e.g., 6).
    - Random numbers will be given to you.
    - Place each number into an empty position.
    - When all positions are filled, the game checks if the numbers are sorted in ascending order.
    - If sorted, you win; if not, you lose.
EOF
}

# Handle flags
case "$1" in
    --help|-h)
        show_help
        exit 0
        ;;
    --version|-v)
        echo "blindsort $VERSION"
        exit 0
        ;;
esac

# Colors
RESET="\e[0m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
BRIGHTRED="\e[91m"
BRIGHTGREEN="\e[92m"

while true; do
    read -p "Enter number of positions (e.g., 6): " max_positions
    if [[ "$max_positions" =~ ^[1-9][0-9]*$ ]]; then
        break
    else
        echo -e "${RED}Please enter a valid positive number.${RESET}"
    fi
done

positions=()
for ((i=0; i<max_positions; i++)); do
    positions+=("0")
done

max_attempts=20

echo -e "${CYAN}Blind Sorting Game Started with $max_positions positions, max attempts: $max_attempts${RESET}"
echo -n -e "${CYAN}Positions: ${RESET}"
for ((i=1; i<=max_positions; i++)); do
    echo -n "$i "
done
echo

print_positions() {
    echo -n -e "${CYAN}Positions: ${RESET}"
    for val in "${positions[@]}"; do
        if [ "$val" -eq 0 ]; then
            echo -n -e "${YELLOW}_ ${RESET}"
        else
            echo -n -e "${YELLOW}$val ${RESET}"
        fi
    done
    echo
}

all_filled() {
    for val in "${positions[@]}"; do
        if [ "$val" -eq 0 ]; then
            return 1 
        fi
    done
    return 0 
}

print_positions

for ((attempt=1; attempt<=max_attempts; attempt++)); do
    number=$(( RANDOM % 50 + 1 ))
    echo
    echo -e "${CYAN}Number: ${YELLOW}$number${RESET}"
    
    while true; do
        read -p "Which position do you want to place it in? (1-$max_positions): " position
        if [[ "$position" =~ ^[0-9]+$ ]]; then
            if (( position >= 1 && position <= max_positions )); then
                index=$((position - 1))
                if [ "${positions[$index]}" -ne 0 ]; then
                    echo -e "${RED}That position is already taken! Choose another.${RESET}"
                else
                    positions[$index]=$number
                    break
                fi
            else
                echo -e "${RED}Please enter a position between 1 and $max_positions.${RESET}"
            fi
        else
            echo -e "${RED}Please enter a valid number.${RESET}"
        fi
    done
    print_positions
    
    if all_filled; then
        echo
        echo -e "${CYAN}All positions are filled, checking order...${RESET}"
        break
    fi
done

is_sorted=1
for ((i=0; i<max_positions-1; i++)); do
    if (( positions[i] > positions[i+1] )); then
        is_sorted=0
        break
    fi
done

echo
if (( is_sorted == 1 )); then
    echo -e "${BRIGHTGREEN}Congratulations! ${GREEN}Positions are in ascending order.${RESET}"
else
    echo -e "${RED}Positions are not in ascending order. ${BRIGHTRED}Game over.${RESET}"
fi
