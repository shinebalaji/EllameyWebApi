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
    public class FoodItemController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/FoodItem
        public IQueryable<FoodItem> GetFoodItems()
        {
            var items = db.FoodItems;
            foreach (var item in items)
            {
                Restaurateur restaurateur = db.Restaurateurs.Find(item.RestaurateurId);
               
                item.Restaurateur = restaurateur;
           }

            return db.FoodItems.OrderBy(a => (a.FoodItemId));
        }

        // GET api/FoodItem/5
        [ResponseType(typeof(FoodItem))]
        public IHttpActionResult GetFoodItem(int id)
        {
            FoodItem fooditem = db.FoodItems.Find(id);
            if (fooditem == null)
            {
                return NotFound();
            }

            return Ok(fooditem);
        }

        [HttpGet]
        [Route("api/GetFoodItemsByRestaurateurId/{restaurateurid}")]
        public IQueryable<FoodItem> GetFoodItemsByRestaurateurId(int restaurateurid)
        {
           
            return db.FoodItems.Where(item => item.RestaurateurId == restaurateurid).OrderBy(a => (a.FoodItemId));
        }

        // PUT api/FoodItem/5
        public IHttpActionResult PutFoodItem(FoodItem fooditem)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            //if (id != fooditem.FoodItemId)
            //{
            //    return BadRequest();
            //}
           
            fooditem.UpdatedDate = DateTime.Now;
            db.Entry(fooditem).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FoodItemExists(fooditem.FoodItemId))
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

      

        // POST api/FoodItem
        [ResponseType(typeof(FoodItem))]
        public IHttpActionResult PostFoodItem(FoodItem fooditem)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

          
            fooditem.CreatedDate = DateTime.Now;
            fooditem.IsDeleted = false;
            db.FoodItems.Add(fooditem);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = fooditem.FoodItemId }, fooditem);
        }

        // DELETE api/FoodItem/5
        [ResponseType(typeof(FoodItem))]
        public IHttpActionResult DeleteFoodItem(int id,int loginId)
        {
            FoodItem fooditem = db.FoodItems.Find(id);
            if (fooditem == null)
            {
                return NotFound();
            }

            fooditem.UpdatedBy = loginId;
            fooditem.UpdatedDate = DateTime.Now;
            fooditem.IsDeleted = true;
            db.Entry(fooditem).State = System.Data.Entity.EntityState.Modified;
            //db.FoodItems.Remove(fooditem);
            db.SaveChanges();

            return Ok(fooditem);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool FoodItemExists(int id)
        {
            return db.FoodItems.Count(e => e.FoodItemId == id) > 0;
        }
    }
}