using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MinnStateDMV.Data;
using MinnStateDMV.Models;

namespace MinnStateDMV.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class InfractionsController : ControllerBase
    {
        private readonly MinnstatedmvContext _context;

        public InfractionsController(MinnstatedmvContext context)
        {
            _context = context;
        }

        // GET: api/Infractions
        [HttpGet]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin, Law")]
        public async Task<ActionResult<IEnumerable<Infraction>>> GetInfractions()
        {
            return await _context.Infractions.ToListAsync();
        }

        // GET: api/Infractions/5
        [HttpGet("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin, Law")]
        public async Task<ActionResult<Infraction>> GetInfraction(int id)
        {
            var infraction = await _context.Infractions.FindAsync(id);

            if (infraction == null)
            {
                return NotFound();
            }

            return infraction;
        }

        // PUT: api/Infractions/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin, Law")]
        public async Task<IActionResult> PutInfraction(int id, Infraction infraction)
        {
            if (id != infraction.InfractionsId)
            {
                return BadRequest();
            }

            _context.Entry(infraction).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InfractionExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Infractions
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin, Law")]
        public async Task<ActionResult<Infraction>> PostInfraction(Infraction infraction)
        {
            _context.Infractions.Add(infraction);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (InfractionExists(infraction.InfractionsId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetInfraction", new { id = infraction.InfractionsId }, infraction);
        }

        // DELETE: api/Infractions/5
        [HttpDelete("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin, Law")]
        public async Task<IActionResult> DeleteInfraction(int id)
        {
            var infraction = await _context.Infractions.FindAsync(id);
            if (infraction == null)
            {
                return NotFound();
            }

            _context.Infractions.Remove(infraction);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool InfractionExists(int id)
        {
            return _context.Infractions.Any(e => e.InfractionsId == id);
        }
    }
}
