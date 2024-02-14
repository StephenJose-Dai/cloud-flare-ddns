curl -X GET "https://api.cloudflare.com/client/v4/zones/{ZONE_ID}/dns_records" \
     -H "Authorization: Bearer {API_TOKEN}" \
     -H "Content-Type: application/json"