using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Ellamey;

namespace Ellamey.Controllers
{
    public class UnitController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/Unit
        public IQueryable<Unit> GetUnits()
        {
            return db.Units.OrderBy(a => (a.Name));
        }

        // GET api/Unit/5
        [ResponseType(typeof(Unit))]
        public IHttpActionResult GetUnit(int id)
        {
            Unit unit = db.Units.Find(id);
            if (unit == null)
            {
                return NotFound();
            }

            return Ok(unit);
        }

        // PUT api/Unit/5
        public IHttpActionResult PutUnit(int id, Unit unit)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != unit.UnitId)
            {
                return BadRequest();
            }

            db.Entry(unit).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UnitExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST api/Unit
        [ResponseType(typeof(Unit))]
        public IHttpActionResult PostUnit(Unit unit)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Units.Add(unit);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = unit.UnitId }, unit);
        }

        // DELETE api/Unit/5
        [ResponseType(typeof(Unit))]
        public IHttpActionResult DeleteUnit(int id)
        {
            Unit unit = db.Units.Find(id);
            if (unit == null)
            {
                return NotFound();
            }

            db.Units.Remove(unit);
            db.SaveChanges();

            return Ok(unit);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UnitExists(int id)
        {
            return db.Units.Count(e => e.UnitId == id) > 0;
        }
    }
}