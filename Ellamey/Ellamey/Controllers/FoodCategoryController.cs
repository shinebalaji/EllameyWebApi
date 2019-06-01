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
    public class FoodCategoryController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/FoodCategory
        public IQueryable<FoodCategory> GetFoodCategories()
        {
            return db.FoodCategories;
        }

        // GET api/FoodCategory/5
        [ResponseType(typeof(FoodCategory))]
        public IHttpActionResult GetFoodCategory(int id)
        {
            FoodCategory foodcategory = db.FoodCategories.Find(id);
            if (foodcategory == null)
            {
                return NotFound();
            }

            return Ok(foodcategory);
        }

        // PUT api/FoodCategory/5
        public IHttpActionResult PutFoodCategory(int id, FoodCategory foodcategory)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != foodcategory.FoodCategoryId)
            {
                return BadRequest();
            }

            db.Entry(foodcategory).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FoodCategoryExists(id))
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

        // POST api/FoodCategory
        [ResponseType(typeof(FoodCategory))]
        public IHttpActionResult PostFoodCategory(FoodCategory foodcategory)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.FoodCategories.Add(foodcategory);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = foodcategory.FoodCategoryId }, foodcategory);
        }

        // DELETE api/FoodCategory/5
        [ResponseType(typeof(FoodCategory))]
        public IHttpActionResult DeleteFoodCategory(int id)
        {
            FoodCategory foodcategory = db.FoodCategories.Find(id);
            if (foodcategory == null)
            {
                return NotFound();
            }

            db.FoodCategories.Remove(foodcategory);
            db.SaveChanges();

            return Ok(foodcategory);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool FoodCategoryExists(int id)
        {
            return db.FoodCategories.Count(e => e.FoodCategoryId == id) > 0;
        }
    }
}