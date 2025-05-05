#!/bin/bash

# Start SSH daemon
service ssh start

# Optional: Start Ray head node (you can modify this)
if [ "$RAY_HEAD" = "1" ]; then
    ray start --head --port=6379 --dashboard-host=0.0.0.0 --ray-client-server-port=10001  --ray-debugger-external
fi

# Keep container running
tail -f /dev/null
