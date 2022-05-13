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
    public class LawPersonnelsController : ControllerBase
    {
        private readonly MinnstatedmvContext _context;

        public LawPersonnelsController(MinnstatedmvContext context)
        {
            _context = context;
        }

        // GET: api/LawPersonnels
        [HttpGet]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<ActionResult<IEnumerable<LawPersonnel>>> GetLawPersonnel()
        {
            return await _context.LawPersonnel.ToListAsync();
        }

        // GET: api/LawPersonnels/5
        [HttpGet("{id}")]
        public async Task<ActionResult<LawPersonnel>> GetLawPersonnel(int id)
        {
            var lawPersonnel = await _context.LawPersonnel.FindAsync(id);

            if (lawPersonnel == null)
            {
                return NotFound();
            }

            return lawPersonnel;
        }

        // PUT: api/LawPersonnels/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<IActionResult> PutLawPersonnel(int id, LawPersonnel lawPersonnel)
        {
            if (id != lawPersonnel.LawId)
            {
                return BadRequest();
            }

            _context.Entry(lawPersonnel).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LawPersonnelExists(id))
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

        // POST: api/LawPersonnels
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<ActionResult<LawPersonnel>> PostLawPersonnel(LawPersonnel lawPersonnel)
        {
            _context.LawPersonnel.Add(lawPersonnel);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (LawPersonnelExists(lawPersonnel.LawId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetLawPersonnel", new { id = lawPersonnel.LawId }, lawPersonnel);
        }

        // DELETE: api/LawPersonnels/5
        [HttpDelete("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<IActionResult> DeleteLawPersonnel(int id)
        {
            var lawPersonnel = await _context.LawPersonnel.FindAsync(id);
            if (lawPersonnel == null)
            {
                return NotFound();
            }

            _context.LawPersonnel.Remove(lawPersonnel);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool LawPersonnelExists(int id)
        {
            return _context.LawPersonnel.Any(e => e.LawId == id);
        }
    }
}
