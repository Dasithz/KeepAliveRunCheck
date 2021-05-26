# KeepAliveRunCheck


## High Level Details

### Script Name: ``` keepalivedprecheck.sh ```
Description
Script will execute and check if there are any hanging sessions are remaining the server related to the “keepalivedcheck.sh” script before executing the keepalivedcheck.sh script.

### Script Name: ```keepalivedcheck.sh ```
Description
This will check the given IP is reachable through the defined port and scheduled to be executed every minute using Cron job. All the activities getting logged in the above-mentioned log location.

### Logging Mechanism 
All the activities will be logged under the mentioned log location. Furthermore for each day, there will be two log files getting generated. (Ex : keepalivedcheck_2019-10-15.txt , keepalivedprecheck_2019-10-15.txt)
