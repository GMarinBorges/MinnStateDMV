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
    public class DmvpersonnelsController : ControllerBase
    {
        private readonly MinnstatedmvContext _context;

        public DmvpersonnelsController(MinnstatedmvContext context)
        {
            _context = context;
        }

        // GET: api/Dmvpersonnels
        [HttpGet]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<ActionResult<IEnumerable<Dmvpersonnel>>> GetDmvpersonnel()
        {
            return await _context.Dmvpersonnel.ToListAsync();
        }

        // GET: api/Dmvpersonnels/5
        [HttpGet("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<ActionResult<Dmvpersonnel>> GetDmvpersonnel(int id)
        {
            var dmvpersonnel = await _context.Dmvpersonnel.FindAsync(id);

            if (dmvpersonnel == null)
            {
                return NotFound();
            }

            return dmvpersonnel;
        }

        // PUT: api/Dmvpersonnels/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<IActionResult> PutDmvpersonnel(int id, Dmvpersonnel dmvpersonnel)
        {
            if (id != dmvpersonnel.Dmvid)
            {
                return BadRequest();
            }

            _context.Entry(dmvpersonnel).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DmvpersonnelExists(id))
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

        // POST: api/Dmvpersonnels
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<ActionResult<Dmvpersonnel>> PostDmvpersonnel(Dmvpersonnel dmvpersonnel)
        {
            _context.Dmvpersonnel.Add(dmvpersonnel);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (DmvpersonnelExists(dmvpersonnel.Dmvid))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetDmvpersonnel", new { id = dmvpersonnel.Dmvid }, dmvpersonnel);
        }

        // DELETE: api/Dmvpersonnels/5
        [HttpDelete("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<IActionResult> DeleteDmvpersonnel(int id)
        {
            var dmvpersonnel = await _context.Dmvpersonnel.FindAsync(id);
            if (dmvpersonnel == null)
            {
                return NotFound();
            }

            _context.Dmvpersonnel.Remove(dmvpersonnel);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool DmvpersonnelExists(int id)
        {
            return _context.Dmvpersonnel.Any(e => e.Dmvid == id);
        }
    }
}
