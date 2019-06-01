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
    public class GroceryOrderItemsController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/GroceryOrderItems
        public IQueryable<GroceryOrderItem> GetGroceryOrderItems()
        {
            var items = db.GroceryOrderItems;
            foreach (var item in items)
            {
                GroceryItem groceryItem = db.GroceryItems.Find(item.GroceryItemId);
                Unit unit = db.Units.Find(groceryItem.unitid);
                groceryItem.Unit = unit;
                item.GroceryItem = groceryItem;

                GroceryOrder groceryOrder = db.GroceryOrders.Find(item.GroceryOrderId);
                Grocer grocer = db.Grocers.Find(groceryOrder.GrocerId);
                groceryOrder.Grocer = grocer;
                item.GroceryOrder = groceryOrder;

               
            }

            return db.GroceryOrderItems.OrderBy(a => (a.GroceryOrderItemsId));
        }

        // GET api/GroceryOrderItems/5
        [ResponseType(typeof(GroceryOrderItem))]
        public IHttpActionResult GetGroceryOrderItem(int id)
        {
            GroceryOrderItem groceryorderitem = db.GroceryOrderItems.Find(id);
            if (groceryorderitem == null)
            {
                return NotFound();
            }
            
            return Ok(groceryorderitem);
        }

        // PUT api/GroceryOrderItems/5
        public IHttpActionResult PutGroceryOrderItem(GroceryOrderItem groceryorderitem)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            //if (id != groceryorderitem.GroceryOrderItemsId)
            //{
            //    return BadRequest();
            //}
          
            groceryorderitem.UpdatedDate = DateTime.Now;
            db.Entry(groceryorderitem).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GroceryOrderItemExists(groceryorderitem.GroceryOrderItemsId))
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

        // POST api/GroceryOrderItems
        [ResponseType(typeof(GroceryOrderItem))]
        public IHttpActionResult PostGroceryOrderItem(GroceryOrderItem groceryorderitem)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
          
            groceryorderitem.CreatedDate = DateTime.Now;
            groceryorderitem.IsDeleted = false;
            db.GroceryOrderItems.Add(groceryorderitem);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = groceryorderitem.GroceryOrderItemsId }, groceryorderitem);
        }

        // DELETE api/GroceryOrderItems/5
        [ResponseType(typeof(GroceryOrderItem))]
        public IHttpActionResult DeleteGroceryOrderItem(int id,int loginId)
        {
            GroceryOrderItem groceryorderitem = db.GroceryOrderItems.Find(id);
            if (groceryorderitem == null)
            {
                return NotFound();
            }

          
            groceryorderitem.UpdatedBy = loginId;
            groceryorderitem.UpdatedDate = DateTime.Now;
            groceryorderitem.IsDeleted = true;
            db.Entry(groceryorderitem).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return Ok(groceryorderitem);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool GroceryOrderItemExists(int id)
        {
            return db.GroceryOrderItems.Count(e => e.GroceryOrderItemsId == id) > 0;
        }
    }
}