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
