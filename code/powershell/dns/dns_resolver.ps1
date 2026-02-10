param($pre, $dns)

for ($i = 1; $i -le 254; $i++) {
    $ip = "$pre.$i"
    $r = Resolve-DnsName -DnsOnly $ip -Server $dns -ErrorAction Ignore
    if ($r) { "$ip $($r.NameHost)" }
}