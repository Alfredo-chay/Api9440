# Evidencia de Funcionamiento - Api9440

## Resumen del Proyecto

**Nombre del Proyecto**: Api9440  
**Endpoint Principal**: POST `/usuarios/correos/estadisticas`  
**Tecnología**: .NET 8, ASP.NET Core Web API  

## Código Implementado

### 1. Controlador Principal (`Usuarios9440Controller.cs`)

```csharp
using Microsoft.AspNetCore.Mvc;
using Api9440.Models;

namespace Api9440.Controllers
{
    [ApiController]
    [Route("usuarios/correos")]
    public class Usuarios9440Controller : ControllerBase
    {
        [HttpPost("estadisticas")]
        public IActionResult EstadisticasCorreos([FromBody] CorreoRequest9440 request)
        {
            if (request == null || request.Correos == null || !request.Correos.Any())
                return BadRequest("Debe enviar una lista de correos.");

            var dominios = request.Correos
                .Where(c => !string.IsNullOrEmpty(c) && c.Contains('@'))
                .Select(c => c.Split('@').Last())
                .GroupBy(d => d)
                .ToDictionary(g => g.Key, g => g.Count());

            var response = new EstadisticaResponse9440
            {
                Dominios = dominios
            };

            return Ok(response);
        }
    }
}
```

### 2. Modelo de Entrada (`CorreoRequest9440.cs`)

```csharp
namespace Api9440.Models
{
    public class CorreoRequest9440
    {
        public List<string> Correos { get; set; } = new List<string>();
    }
}
```

### 3. Modelo de Respuesta (`EstadisticaResponse9440.cs`)

```csharp
namespace Api9440.Models
{
    public class EstadisticaResponse9440
    {
        public Dictionary<string, int> Dominios { get; set; } = new Dictionary<string, int>();
    }
}
```

### 4. Configuración Principal (`Program.cs`)

```csharp
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// Solo usar HTTPS redirection en producción
if (!app.Environment.IsDevelopment())
{
    app.UseHttpsRedirection();
}

app.MapControllers();

app.Run();
```

## Pruebas del Endpoint

### Ejemplo de Request
```json
{
  "correos": [
    "ana@gmail.com",
    "pedro@yahoo.com",
    "luis@gmail.com",
    "sofia@hotmail.com"
  ]
}
```

### Ejemplo de Response Esperada
```json
{
  "dominios": {
    "gmail.com": 2,
    "yahoo.com": 1,
    "hotmail.com": 1
  }
}
```

## Validaciones Implementadas

1. **Validación de entrada nula**: Verifica que el request no sea nulo
2. **Validación de lista vacía**: Verifica que la lista de correos no esté vacía
3. **Validación de formato de correo**: Filtra correos que no contengan '@'
4. **Validación de correos vacíos**: Ignora entradas nulas o vacías

## Evidencia de Compilación

✅ **Compilación Exitosa**: El proyecto compila sin errores ni advertencias

```
Compilación correcta.
    0 Advertencia(s)
    0 Errores
```

## Estructura Final del Proyecto

```
Api9440/
├── Controllers/
│   └── Usuarios9440Controller.cs
├── Models/
│   └── Models/
│       ├── CorreoRequest9440.cs
│       └── EstadisticaResponse9440.cs
├── Properties/
│   └── launchSettings.json
├── Program.cs
├── Api9440.csproj
├── Api9440.http (archivo de pruebas)
└── appsettings.json
```

## Funcionalidades Implementadas

✅ **Endpoint POST** `/usuarios/correos/estadisticas`  
✅ **Modelos de datos** con nomenclatura 9440  
✅ **Validaciones** de entrada  
✅ **Procesamiento de dominios** correcto  
✅ **Respuesta estructurada** según especificaciones  
✅ **Documentación Swagger** integrada  
✅ **Configuración de desarrollo** optimizada  

## Instrucciones de Ejecución

1. Abrir terminal en la carpeta del proyecto
2. Ejecutar: `dotnet run`
3. Navegar a `http://localhost:5177/swagger` para documentación
4. Probar el endpoint con el archivo `Api9440.http`

## URL del Repositorio

El código está disponible en el workspace local y listo para ser subido a un repositorio Git.

---

**Fecha de Implementación**: 25 de septiembre, 2025  
**Desarrollador**: Proyecto Api9440  
**Estado**: ✅ Implementado y Funcional