#!/bin/bash

# Path ke folder situs (ubah sesuai struktur kamu)
SITE_DIR="./docs"

# Skrip AdSense yang ingin ditambahkan
ADSENSE_SCRIPT='<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-4633437485737999" crossorigin="anonymous"></script>'

# Loop semua file HTML
find "$SITE_DIR" -name "*.html" | while read -r file; do
    # Cek kalau skrip belum ada di file
    if ! grep -q "ca-pub-4633437485737999" "$file"; then
        # Tambahkan skrip sebelum tag </head>
        sed -i "/<\/head>/i $ADSENSE_SCRIPT" "$file"
        echo "Added AdSense to $file"
    else
        echo "AdSense already exists in $file"
    fi
done

echo "All done!"
