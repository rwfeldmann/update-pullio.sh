#!/bin/sh -e

# Update pullio script
# Docs at: https://hotio.dev/scripts/pullio/
curl -fsSL "https://raw.githubusercontent.com/hotio/pullio/master/pullio.sh" -o /usr/local/bin/pullio

EXITVALUE=$?

if [ $EXITVALUE != 0 ]; then
    /usr/bin/logger -t update-pullio "ALERT exited abnormally with [$EXITVALUE]"
else
    # Check if pullio is executable by all users
    if [ ! -x /usr/local/bin/pullio ]; then
        chmod a+x /usr/local/bin/pullio
        /usr/bin/logger -t update-pullio "INFO set executable permission on /usr/local/bin/pullio"
    fi
    /usr/bin/logger -t update-pullio "INFO ran successfully with [$EXITVALUE]"
fi

exit $EXITVALUE
