#!/usr/bin/env pwsh
# Test simple para el endpoint Api9440

Write-Host "=== PRUEBA DEL ENDPOINT Api9440 ===" -ForegroundColor Green
Write-Host ""

# Configuración
$baseUrl = "http://localhost:5177"
$endpoint = "/usuarios/correos/estadisticas"
$fullUrl = "$baseUrl$endpoint"

# Datos de prueba
$testData = @{
    correos = @(
        "ana@gmail.com",
        "pedro@yahoo.com", 
        "luis@gmail.com",
        "sofia@hotmail.com"
    )
}

$jsonData = $testData | ConvertTo-Json -Compress

Write-Host "URL: $fullUrl" -ForegroundColor Cyan
Write-Host "Método: POST" -ForegroundColor Cyan
Write-Host "Content-Type: application/json" -ForegroundColor Cyan
Write-Host ""
Write-Host "Datos de entrada:" -ForegroundColor Yellow
Write-Host $jsonData -ForegroundColor White
Write-Host ""
Write-Host "Respuesta esperada:" -ForegroundColor Yellow
Write-Host '{"dominios":{"gmail.com":2,"yahoo.com":1,"hotmail.com":1}}' -ForegroundColor White
Write-Host ""

Write-Host "Para probar manualmente:" -ForegroundColor Magenta
Write-Host "1. Ejecutar: dotnet run (en otra terminal)" -ForegroundColor White
Write-Host "2. Abrir: $baseUrl/swagger" -ForegroundColor White
Write-Host "3. Usar el endpoint POST $endpoint" -ForegroundColor White
Write-Host "4. Enviar el JSON mostrado arriba" -ForegroundColor White
Write-Host ""

Write-Host "Comando curl (si está disponible):" -ForegroundColor Magenta
$curlCommand = "curl -X POST `"$fullUrl`" -H `"Content-Type: application/json`" -d `"$jsonData`""
Write-Host $curlCommand -ForegroundColor White