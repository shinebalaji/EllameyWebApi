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
    public class GroceryItemController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/GroceryItem
        public IQueryable<GroceryItem> GetGroceryItems()
        {
            var items = db.GroceryItems;
            foreach (var item in items)
            {
                Unit unit = db.Units.Find(item.unitid);
                item.Unit = unit;

                Grocer grocer = db.Grocers.Find(item.GrocerId);
                item.Grocer = grocer;
            }
            
            return db.GroceryItems.OrderBy(a => (a.GroceryItemId));
        }

        // GET api/GroceryItem/5
        [ResponseType(typeof(GroceryItem))]
        public IHttpActionResult GetGroceryItem(int id)
        {
            GroceryItem groceryitem = db.GroceryItems.Find(id);
            if (groceryitem == null)
            {
                return NotFound();
            }

            return Ok(groceryitem);
        }

        [HttpGet]
        [Route("api/GetGroceryItemsByGrocerId/{grocerid}")]
        public IQueryable<GroceryItem> GetGroceryItemsByGrocerId(int grocerid)
        {

            return db.GroceryItems.Where(item => item.GrocerId == grocerid).OrderBy(a => (a.GroceryItemId));
        }

        // PUT api/GroceryItem/5
        public IHttpActionResult PutGroceryItem(GroceryItem groceryitem)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            //if (id != groceryitem.GroceryItemId)
            //{
            //    return BadRequest();
            //}
          
            groceryitem.UpdatedDate = DateTime.Now;
            db.Entry(groceryitem).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GroceryItemExists(groceryitem.GroceryItemId))
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

        // POST api/GroceryItem
        [ResponseType(typeof(GroceryItem))]
        public IHttpActionResult PostGroceryItem(GroceryItem groceryitem)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            
            groceryitem.CreatedDate = DateTime.Now;
            groceryitem.IsDeleted = false;
            db.GroceryItems.Add(groceryitem);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = groceryitem.GroceryItemId }, groceryitem);
        }

        // DELETE api/GroceryItem/5
        [ResponseType(typeof(GroceryItem))]
        public IHttpActionResult DeleteGroceryItem(int id,int loginId)
        {
            GroceryItem groceryitem = db.GroceryItems.Find(id);
            if (groceryitem == null)
            {
                return NotFound();
            }

          
            groceryitem.UpdatedBy = loginId;
            groceryitem.UpdatedDate = DateTime.Now;
            groceryitem.IsDeleted = true;
            db.Entry(groceryitem).State = System.Data.Entity.EntityState.Modified;
            //db.GroceryItems.Remove(groceryitem);
            db.SaveChanges();

            return Ok(groceryitem);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool GroceryItemExists(int id)
        {
            return db.GroceryItems.Count(e => e.GroceryItemId == id) > 0;
        }
    }
}