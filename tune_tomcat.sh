# This script was created and tuned to assist with improving HTML Console responsiveness of PNETLab
# These values are not definitive, and can be manipulated. I just found them working quite well for my setup
#
#!/bin/bash

# --- START JAVA HEAP AUTO-CONFIG ---
configure_java_heap() {
    echo "Optimizing JVM settings for Tomcat to improve HTML console responsiveness..."
    echo ""

    # Create a backup of the original configuration
    cp /etc/default/tomcat9 /etc/default/tomcat9.bak
    echo "Backup created at /etc/default/tomcat9.bak"
    echo ""

    # HEAP_SIZE selection based on system total memory
    TOTAL_RAM_KB=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    TOTAL_RAM_GB=$((TOTAL_RAM_KB / 1024 / 1024))

    if [ "$TOTAL_RAM_GB" -lt 30 ]; then HEAP_SIZE="1024m"
    elif [ "$TOTAL_RAM_GB" -lt 60 ]; then HEAP_SIZE="2048m"
    elif [ "$TOTAL_RAM_GB" -lt 90 ]; then HEAP_SIZE="3072m"
    elif [ "$TOTAL_RAM_GB" -lt 185 ]; then HEAP_SIZE="4096m"
    else HEAP_SIZE="6144m"
    fi

    JAVA_OPTS_STRING="-Djava.awt.headless=true -Xms${HEAP_SIZE} -Xmx${HEAP_SIZE} -XX:MaxMetaspaceSize=256m -XX:+UseG1GC -Djava.security.egd=file:/dev/urandom"

    # Apply configuration
    sed -i '/^JAVA_OPTS=/d' /etc/default/tomcat9
    echo "JAVA_OPTS=\"$JAVA_OPTS_STRING\"" >> /etc/default/tomcat9
    echo "JAVA_OPTS=\"$JAVA_OPTS_STRING\" configured at /etc/default/tomcat9"
    echo ""

    # CRITICAL: Restart Tomcat to apply the new memory parameters
    systemctl restart tomcat9
    echo "Tomcat9 service restarted"
    echo ""

    ps -ef | grep tomcat
}

# Execute
configure_java_heap
# --- END JAVA HEAP AUTO-CONFIG ---
