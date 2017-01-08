#!/bin/bash
#chomd script 700 to allow the user to execute the script ./script

# Credentials
  Username=' '
  Password=' '

# System Settings
  # Commands - Full path to commands so alias's don't present an operational or security issue (which ___)
  echo="/bin/echo"
  curl="/usr/bin/curl"

# Set colors as variables
  ESC_SEQ="\x1b["
  NC="\033[0m"
  GREEN=$ESC_SEQ"32;01m"
  YELLOW=$ESC_SEQ"33;01m"
  PURPLE=$ESC_SEQ"35;01m"
  CYAN=$ESC_SEQ"36;01m"

# Assign targetsite as variable Optional
# ./script.sh https://www.website.com
  TargetSite="$1"
    if [[ -z "$TargetSite" ]]; then
      TargetSite=$(echo "https://www.google.com")
      echo -e  "${RED}No argument provided testing against google${NC}"
      echo -e "${PURPLE}To test against a specific site type: ./script.sh https://www.____.com${NC}"
    fi

## Assign Diagnostic URLs as variables
  WhatIsMyIPAddr=$(curl -s --proxy-user $Username:$Password -x http://_____.com:80 bot.whatismyipaddress.com; echo)
  IPecho=$(curl -s --proxy-user $Username:$Password -x http://_____.com:80 ipecho.net/plain; echo)
  Akamai=$(curl -s --proxy-user $Username:$Password -x http://_____.com:80 whatismyip.akamai.com; echo)
  TargetSiteTest=$(curl -s -I --proxy-user $Username:$Password -x http://_____.com:80 $TargetSite; echo)

# Test against IP sites:
  echo; echo -e "${CYAN}Starting Test:${NC}"
  echo -e "${CYAN}Testing against IP validation sites${NC}"; echo
  echo -e "${PURPLE}Test 1:${NC} $WhatIsMyIPAddr"
  echo -e "${PURPLE}Test 2:${NC} $IPecho"
  echo -e "${PURPLE}Test 3:${NC} $Akamai"; echo
  # Testing against user input or google if no input is provided:
  echo -e "${PURPLE}Test against Target site :${NC} $TargetSiteTest" | head -n 1; echo
