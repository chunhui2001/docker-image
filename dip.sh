#!/bin/bash
docker network inspect br0 \
| jq -r '
  .[0].Containers
  | to_entries[]
  | "\(.value.Name)\t\(.value.IPv4Address | split("/") | .[0])\t\(.key)"
' \
| while IFS=$'\t' read -r name ip cid; do

    image=$(docker inspect -f '{{.Config.Image}}' "$cid" \
        | sed 's#.*/##')

    state=$(docker ps -a --filter id=$cid --format '{{.Status}}')

    ports=$(docker inspect -f '
      {{range $p, $conf := .NetworkSettings.Ports}}
        {{if $conf}}{{printf "%-12s->%s;" $p (index $conf 0).HostPort}}{{end}}
      {{end}}
    ' "$cid" | tr -d '\n' | sed 's/;$//')

    printf "%s\t%s\t%s\t%s\t%s\n" \
        "$image" "$name" "$state" "$ip" "${ports:-}"

done \
| sort -t $'\t' -k4,4V \
| awk -F'\t' '

function trim(s) {
    gsub(/^[ \t]+|[ \t]+$/, "", s)
    return s
}

{
    image[NR]  = $1
    name[NR]   = $2
    state[NR]  = $3
    ip[NR]     = $4

    if ($5 != "") {

        n = split($5, p, ";")

        for (i=1;i<=n;i++) {

            p[i] = trim(p[i])

            if (p[i] != "") {
                data[NR,i] = p[i]
                if (i > max) max = i
            }
        }
    }
}

END {

    printf "+--------------------------------+---------------------------+-------------------+-------------------+"
    for (i=1;i<=max;i++) printf "----------------------+"
    print ""

    printf "| %-30s | %-25s | %-17s | %-17s |", "Image", "Container", "Status", "IP"
    for (i=1;i<=max;i++) printf " %-20s |", sprintf("Port%d", i)
    print ""

    printf "+--------------------------------+---------------------------+-------------------+-------------------+"
    for (i=1;i<=max;i++) printf "----------------------+"
    print ""

    for (i=1;i<=NR;i++) {

        printf "| %-30s | %-25s | %-17s | %-17s |",
               image[i], name[i], state[i], ip[i]

        for (j=1;j<=max;j++) {
            printf " %-20s |", data[i,j]
        }

        print ""
    }

    printf "+--------------------------------+---------------------------+-------------------+-------------------+"
    for (i=1;i<=max;i++) printf "----------------------+"
    print ""
}'
