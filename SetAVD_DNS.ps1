# Define las direcciones IP de los servidores DNS principal y secundario
$primaryDnsServer = "10.49.0.40"    # Dirección IP del servidor DNS primario
$secondaryDnsServer = "10.10.10.5"  # Dirección IP del servidor DNS secundario

# Obtiene todas las interfaces de red activas y configura los servidores DNS
$networkAdapters = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }
foreach ($adapter in $networkAdapters) {
    Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses ($primaryDnsServer, $secondaryDnsServer)
}

Write-Output "Los servidores DNS han sido configurados: Primario = $primaryDnsServer, Secundario = $secondaryDnsServer"
