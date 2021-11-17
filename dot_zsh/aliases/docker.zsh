function docoup {
    docker compose -p $1 up -d
}

function docodown {
    docker compose -p $1 down
}

