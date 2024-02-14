#!/bin/sh

# Cloudflare账户信息
auth_email="stephenjose_dai@zwyktech.cn"  # 替换为你的Cloudflare登录邮箱
auth_key="123456789abcdefghijklmnopqrstuvwxyz0*" # 替换为你的Cloudflare API Key
zone_id="0123456789abcdefghijklmnopqrstyv"# 替换为你的域名所在区域的Zone ID
record_name="ipv4"           # 替换为你要更新的域名

# IPv4地址获取函数
get_ipv4() {
    if [ -x "/usr/sbin/curl" ]; then
        ipv4=$(/usr/sbin/curl -s https://ipv4.icanhazip.com)
    elif [ -x "/usr/bin/wget" ]; then
        ipv4=$(/usr/bin/wget -qO- https://ipv4.icanhazip.com)
    fi
    echo "$ipv4"
}

# IPv6地址获取函数
get_ipv6() {
    if [ -x "/usr/sbin/curl" ]; then
        ipv6=$(/usr/sbin/curl -s https://ipv6.icanhazip.com)
    elif [ -x "/usr/bin/wget" ]; then
        ipv6=$(/usr/bin/wget -qO- https://ipv6.icanhazip.com)
    fi
    echo "$ipv6"
}

# 获取IPv4和IPv6地址
IPv4_address=$(get_ipv4)
IPv6_address=$(get_ipv6)

# 更新A记录
update_a_record() {
    local ip="$IPv4_address"
    local record_type="A"
    local record_id="0123456789abcdefghijklmnopqrstyv"
    if [ -n "$record_id" ]; then
        # 使用Cloudflare API更新A记录
        /usr/sbin/curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$record_id" \
            -H "X-Auth-Email: $auth_email" \
            -H "X-Auth-Key: $auth_key" \
            -H "Content-Type: application/json" \
            --data "{\"type\":\"$record_type\",\"name\":\"$record_name\",\"content\":\"$ip\",\"ttl\":120,\"proxied\":false}"
    else
        echo "Failed to retrieve record ID for $record_name ($record_type)."
    fi
}

# 更新AAAA记录
update_aaaa_record() {
    local ip="$IPv6_address"
    local record_type="AAAA"
    local record_id="abcdefghijklmnopqrstyv0123456789"
    if [ -n "$record_id" ]; then
        # 使用Cloudflare API更新AAAA记录
        /usr/sbin/curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$record_id" \
            -H "X-Auth-Email: $auth_email" \
            -H "X-Auth-Key: $auth_key" \
            -H "Content-Type: application/json" \
            --data "{\"type\":\"$record_type\",\"name\":\"$record_name\",\"content\":\"$ip\",\"ttl\":120,\"proxied\":false}"
    else
        echo "Failed to retrieve record ID for $record_name ($record_type)."
    fi
}


# 更新A记录
if [ -n "$IPv4_address" ]; then
    echo "IPv4 Address: $IPv4_address"
    update_a_record "$IPv4_address"
else
    echo "Failed to retrieve IPv4 address."
fi

# 更新AAAA记录
if [ -n "$IPv6_address" ]; then
    echo "IPv6 Address: $IPv6_address"
    update_aaaa_record "$IPv6_address"
else
    echo "Failed to retrieve IPv6 address."
fi