FROM busybox
# This will keep the container alive until it is told to stop. Using
# trap and wait will make the container react immediately to a stop
# request. Without trap/wait stopping will take a few seconds.
CMD exec /bin/sh -c 'trap : TERM INT; echo "This image came from docker.io"; tail -f /dev/null & wait'
