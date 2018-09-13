# How To: Set Up `ssh` Proxy for Browser

- `ssh -D $PORTN -C -N $SSH_HOST`: where `$PORTN` is the port number (recommended default: 8080) and `$SSH_HOST` is the host you are connecting to.  This will create an ssh tunnel through which you can access the internet.  You will of course have to keep this open while you use it (so don't close the terminal).
- Set your browser to use `localhost:$PORTN`.  For example, in qutebrowser do `set content.proxy socks://127.0.0.1:8080`.  Currently I have an alias set up to turn this off and on with `proxysocks-off` and `proxysocks-on`.
