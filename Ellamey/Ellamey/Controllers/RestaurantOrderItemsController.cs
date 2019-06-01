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
    public class RestaurantOrderItemsController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/RestaurantOrderItems
        public IQueryable<RestaurantOrderItem> GetRestaurantOrderItems()
        {
            var items = db.RestaurantOrderItems;
            foreach (var item in items)
            {
                FoodItem foodItem = db.FoodItems.Find(item.FoodItemId);
                item.FoodItem = foodItem;

                RestaurantOrder restaurantOrder = db.RestaurantOrders.Find(item.RestaurantOrderId);
                Restaurateur restaurateur = db.Restaurateurs.Find(restaurantOrder.RestaurateurId);
                restaurantOrder.Restaurateur = restaurateur;
                item.RestaurantOrder = restaurantOrder;

             
            }

            return db.RestaurantOrderItems.OrderBy(a => (a.RestaurantOrderItemsId));
        }

        // GET api/RestaurantOrderItems/5
        [ResponseType(typeof(RestaurantOrderItem))]
        public IHttpActionResult GetRestaurantOrderItem(int id)
        {
            RestaurantOrderItem restaurantorderitem = db.RestaurantOrderItems.Find(id);
            if (restaurantorderitem == null)
            {
                return NotFound();
            }
           

            return Ok(restaurantorderitem);
        }

        // PUT api/RestaurantOrderItems/5
        public IHttpActionResult PutRestaurantOrderItem(RestaurantOrderItem restaurantorderitem)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            //if (id != restaurantorderitem.RestaurantOrderItemsId)
            //{
            //    return BadRequest();
            //}
           
            restaurantorderitem.UpdatedDate = DateTime.Now;
            db.Entry(restaurantorderitem).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RestaurantOrderItemExists(restaurantorderitem.RestaurantOrderItemsId))
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

        // POST api/RestaurantOrderItems
        [ResponseType(typeof(RestaurantOrderItem))]
        public IHttpActionResult PostRestaurantOrderItem(RestaurantOrderItem restaurantorderitem)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
           
            restaurantorderitem.CreatedDate = DateTime.Now;
            restaurantorderitem.IsDeleted = false;
            db.RestaurantOrderItems.Add(restaurantorderitem);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = restaurantorderitem.RestaurantOrderItemsId }, restaurantorderitem);
        }

        // DELETE api/RestaurantOrderItems/5
        [ResponseType(typeof(RestaurantOrderItem))]
        public IHttpActionResult DeleteRestaurantOrderItem(int id,int loginId)
        {
            RestaurantOrderItem restaurantorderitem = db.RestaurantOrderItems.Find(id);
            if (restaurantorderitem == null)
            {
                return NotFound();
            }

            //ToDo: UpdatedBy pass login id.
            restaurantorderitem.UpdatedBy = loginId;
            restaurantorderitem.UpdatedDate = DateTime.Now;
            restaurantorderitem.IsDeleted = true;
            db.SaveChanges();

            return Ok(restaurantorderitem);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool RestaurantOrderItemExists(int id)
        {
            return db.RestaurantOrderItems.Count(e => e.RestaurantOrderItemsId == id) > 0;
        }
    }
}