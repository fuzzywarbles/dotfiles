# Disable GTK CSD
# More explanation here
# https://github.com/PCMan/gtk3-nocsd
if [ -n "$STARTUP" ]; then
    BASESTARTUP=${STARTUP%% *}
    BASESTARTUP=${BASESTARTUP##*/}
    if [ "$BASESTARTUP" = x-session-manager ]; then
      BASESTARTUP=$(basename $(readlink /etc/alternatives/x-session-manager))
    fi
    if [ x"$BASESTARTUP" = x"${BASESTARTUP#gnome-session}" ] ; then
      export GTK_CSD=0
      STARTUP="env LD_PRELOAD=/path/to/libgtk3-nocsd.so.0 $STARTUP"
    fi
  fi