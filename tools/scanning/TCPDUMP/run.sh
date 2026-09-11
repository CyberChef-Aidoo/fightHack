
set -euo pipefail

IFACE="${1:-}"
if [ -z "$IFACE" ]; then
    # Pick the first UP interface that isn't loopback
    IFACE=$(ip -o link show up | awk -F': ' '{print $2}' | grep -v '^lo$' | head -n1)
    if [ -z "$IFACE" ]; then
        echo "Could not auto-detect a network interface. Pass one explicitly, e.g.:"
        echo "  $0 eth0"
        exit 1
    fi
    echo "No interface specified — auto-detected: $IFACE"
fi


DURATION="${2:-}"

# ---- 3. Output file (timestamped, so runs never overwrite each other) ----
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
OUTDIR="./captures"
mkdir -p "$OUTDIR"
OUTFILE="$OUTDIR/icmp-capture-${TIMESTAMP}.pcap"

echo "Interface : $IFACE"
echo "Filter    : icmp"
echo "Output    : $OUTFILE"
[ -n "$DURATION" ] && echo "Duration  : ${DURATION}s" || echo "Duration  : until Ctrl+C"
echo "----------------------------------------"

# ---- 4. Run the capture ----
# -nn  : no hostname/service-name resolution
# -w   : write raw packets to file for later review
if [ -n "$DURATION" ]; then
    sudo timeout "$DURATION" tcpdump -i "$IFACE" icmp -nn -w "$OUTFILE"
else
    sudo tcpdump -i "$IFACE" icmp -nn -w "$OUTFILE"
fi

echo "----------------------------------------"
echo "Capture saved to: $OUTFILE"
echo "Review it with:   tcpdump -r $OUTFILE -nn"