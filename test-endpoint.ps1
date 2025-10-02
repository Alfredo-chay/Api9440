# Script de prueba para el endpoint de estadísticas de correos
# Api9440 - Proyecto de estadísticas de dominios

Write-Host "Probando endpoint POST /usuarios/correos/estadisticas" -ForegroundColor Green

$uri = "http://localhost:5177/usuarios/correos/estadisticas"
$headers = @{
    'Content-Type' = 'application/json'
}

$testData = @{
    correos = @(
        "ana@gmail.com",
        "pedro@yahoo.com", 
        "luis@gmail.com",
        "sofia@hotmail.com"
    )
} | ConvertTo-Json

Write-Host "Enviando petición..." -ForegroundColor Yellow
Write-Host "URL: $uri" -ForegroundColor Cyan
Write-Host "Body: $testData" -ForegroundColor Cyan

try {
    $response = Invoke-RestMethod -Uri $uri -Method POST -Body $testData -Headers $headers
    Write-Host "Respuesta recibida:" -ForegroundColor Green
    $response | ConvertTo-Json -Depth 3
    
    # Verificar que la respuesta es correcta
    if ($response.dominios.'gmail.com' -eq 2 -and 
        $response.dominios.'yahoo.com' -eq 1 -and 
        $response.dominios.'hotmail.com' -eq 1) {
        Write-Host "✅ TEST PASADO: La respuesta es correcta" -ForegroundColor Green
    } else {
        Write-Host "❌ TEST FALLÓ: La respuesta no es la esperada" -ForegroundColor Red
    }
} catch {
    Write-Host "❌ Error al hacer la petición: $($_.Exception.Message)" -ForegroundColor Red
}