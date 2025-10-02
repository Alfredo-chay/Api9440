# Api9440 - Proyecto de Estadísticas de Correos

Este proyecto es una API REST desarrollada en .NET 8 que proporciona un endpoint para calcular estadísticas de dominios de correos electrónicos.

## Características

- **Framework**: .NET 8
- **Documentación**: Swagger/OpenAPI
- **Endpoint principal**: POST `/usuarios/correos/estadisticas`

## Endpoint Principal

### POST /usuarios/correos/estadisticas

Recibe una lista de correos electrónicos y devuelve un diccionario con la cantidad de correos por dominio.

**Request Body:**
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

**Response:**
```json
{
  "dominios": {
    "gmail.com": 2,
    "yahoo.com": 1,
    "hotmail.com": 1
  }
}
```

## Estructura del Proyecto

```
Api9440/
├── Controllers/
│   └── Usuarios9440Controller.cs    # Controlador principal
├── Models/
│   └── Models/
│       ├── CorreoRequest9440.cs     # Modelo de entrada
│       └── EstadisticaResponse9440.cs # Modelo de respuesta
├── Program.cs                       # Configuración de la aplicación
├── Api9440.http                     # Archivo de pruebas HTTP
└── appsettings.json                 # Configuración
```

## Cómo ejecutar el proyecto

1. Abrir una terminal en la carpeta del proyecto
2. Ejecutar: `dotnet run`
3. Navegar a `http://localhost:5177/swagger` para ver la documentación
4. Usar el archivo `Api9440.http` para realizar pruebas

## Modelos

### CorreoRequest9440
```csharp
public class CorreoRequest9440
{
    public List<string> Correos { get; set; } = new List<string>();
}
```

### EstadisticaResponse9440
```csharp
public class EstadisticaResponse9440
{
    public Dictionary<string, int> Dominios { get; set; } = new Dictionary<string, int>();
}
```

## Validaciones

- Verifica que la lista de correos no esté vacía
- Valida que los correos contengan el símbolo '@'
- Filtra correos vacíos o nulos

## Tecnologías utilizadas

- .NET 8
- ASP.NET Core Web API
- Swagger/OpenAPI
- Entity Framework Core (ready for database integration)