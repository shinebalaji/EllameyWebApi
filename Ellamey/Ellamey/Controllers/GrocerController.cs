using System;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web.Http;
using System.Web.Http.Description;

namespace Ellamey.Controllers
{
    public class GrocerController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/Grocer
        public IQueryable<Grocer> GetGrocers()
        {
            return db.Grocers.OrderBy(a => (a.Name));
        }

        // GET api/Grocer/5
        [ResponseType(typeof(Grocer))]
        public IHttpActionResult GetGrocer(int id)
        {
            Grocer grocer = db.Grocers.Find(id);
            if (grocer == null)
            {
                return NotFound();
            }

            return Ok(grocer);
        }

        [HttpGet]
        [Route("api/GetGroceryShops/{latitude}/{longitude}/{distance}")]
        [ResponseType(typeof(sp_getgroceryshops_Result))]
        public IHttpActionResult GetGroceryShops(float latitude, float longitude, float distance)
        {
            var _latitude = new SqlParameter("@latitude", latitude);
            var _longitude = new SqlParameter("@longitude", longitude);
            var _distance = new SqlParameter("@distance", distance);

            object[] parameters = new object[] { _latitude, _longitude, _distance };
            var result = db.Database.SqlQuery<sp_getgroceryshops_Result>("[dbo].[sp_getgroceryshops] @latitude,@longitude,@distance", parameters);
            return Ok(result);
        }

        // PUT api/Grocer/5
        public IHttpActionResult PutGrocer(Grocer grocer)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            //if (id != grocer.GrocerId)
            //{
            //    return BadRequest();
            //}
         
            grocer.UpdatedDate = DateTime.Now;
            db.Entry(grocer).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GrocerExists(grocer.GrocerId))
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

        // POST api/Grocer
        [ResponseType(typeof(Grocer))]
        public IHttpActionResult PostGrocer(Grocer grocer)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

          
            grocer.CreatedDate = DateTime.Now;
            grocer.IsDeleted = false;
            db.Grocers.Add(grocer);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = grocer.GrocerId }, grocer);
        }

        // DELETE api/Grocer/5
        [ResponseType(typeof(Grocer))]
        public IHttpActionResult DeleteGrocer(int id,int loginId)
        {
            Grocer grocer = db.Grocers.Find(id);
            if (grocer == null)
            {
                return NotFound();
            }


            grocer.UpdatedBy = loginId;
            grocer.UpdatedDate = DateTime.Now;
            grocer.IsDeleted = true;
            db.Entry(grocer).State = System.Data.Entity.EntityState.Modified;
            //db.Grocers.Remove(grocer);
            db.SaveChanges();

            return Ok(grocer);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool GrocerExists(int id)
        {
            return db.Grocers.Count(e => e.GrocerId == id) > 0;
        }
    }
}