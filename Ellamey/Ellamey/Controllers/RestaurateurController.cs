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
    public class RestaurateurController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/Restaurateur
        public IQueryable<Restaurateur> GetRestaurateurs()
        {
            return db.Restaurateurs.OrderBy(a => (a.Name));
        }

        // GET api/Restaurateur/5
        [ResponseType(typeof(Restaurateur))]
        public IHttpActionResult GetRestaurateur(int id)
        {
            Restaurateur restaurateur = db.Restaurateurs.Find(id);
            if (restaurateur == null)
            {
                return NotFound();
            }
            
            return Ok(restaurateur);
        }

        [HttpGet]
        [Route("api/GetRestaurants/{latitude}/{longitude}/{distance}")] 
        [ResponseType(typeof(sp_getrestaurants_Result))]
        public IHttpActionResult GetRestaurants(float latitude, float longitude, float distance)
        {
            var _latitude = new SqlParameter("@latitude", latitude);
            var _longitude = new SqlParameter("@longitude", longitude);
            var _distance = new SqlParameter("@distance", distance);

            object[] parameters = new object[] { _latitude, _longitude, _distance };
            var result = db.Database.SqlQuery<sp_getrestaurants_Result>("[dbo].[sp_getrestaurants] @latitude,@longitude,@distance", parameters);
            return Ok(result);
        }

        // PUT api/Restaurateur/5
        public IHttpActionResult PutRestaurateur(Restaurateur restaurateur)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            //if (id != restaurateur.RestaurateurId)
            //{
            //    return BadRequest();
            //}
            //ToDo: UpdatedBy pass login id.
          
            restaurateur.UpdatedDate = DateTime.Now;
            db.Entry(restaurateur).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RestaurateurExists(restaurateur.RestaurateurId))
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

        // POST api/Restaurateur
        [ResponseType(typeof(Restaurateur))]
        public IHttpActionResult PostRestaurateur(Restaurateur restaurateur)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            //ToDo: UpdatedBy pass login id.
           
            restaurateur.CreatedDate = DateTime.Now;
            restaurateur.IsDeleted = false;
            db.Restaurateurs.Add(restaurateur);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = restaurateur.RestaurateurId }, restaurateur);
        }

        // DELETE api/Restaurateur/5
        [ResponseType(typeof(Restaurateur))]
        public IHttpActionResult DeleteRestaurateur(int id,int loginId)
        {
            Restaurateur restaurateur = db.Restaurateurs.Find(id);
            if (restaurateur == null)
            {
                return NotFound();
            }

            //ToDo: UpdatedBy pass login id.
            restaurateur.UpdatedBy = loginId;
            restaurateur.UpdatedDate = DateTime.Now;
            restaurateur.IsDeleted = true;
            db.Entry(restaurateur).State = System.Data.Entity.EntityState.Modified;
            //db.Restaurateurs.Remove(restaurateur);
            db.SaveChanges();

            return Ok(restaurateur);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool RestaurateurExists(int id)
        {
            return db.Restaurateurs.Count(e => e.RestaurateurId == id) > 0;
        }
    }
}