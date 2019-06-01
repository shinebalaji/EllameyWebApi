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
    public class FoodSubCategoryController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/FoodSubCategory
        public IQueryable<FoodSubCategory> GetFoodSubCategories()
        {
            return db.FoodSubCategories;
        }

        // GET api/FoodSubCategory/5
        [ResponseType(typeof(FoodSubCategory))]
        public IHttpActionResult GetFoodSubCategory(int id)
        {
            FoodSubCategory foodsubcategory = db.FoodSubCategories.Find(id);
            if (foodsubcategory == null)
            {
                return NotFound();
            }

            return Ok(foodsubcategory);
        }

        // PUT api/FoodSubCategory/5
        public IHttpActionResult PutFoodSubCategory(int id, FoodSubCategory foodsubcategory)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != foodsubcategory.FoodSubCategoryId)
            {
                return BadRequest();
            }

            db.Entry(foodsubcategory).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FoodSubCategoryExists(id))
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

        // POST api/FoodSubCategory
        [ResponseType(typeof(FoodSubCategory))]
        public IHttpActionResult PostFoodSubCategory(FoodSubCategory foodsubcategory)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.FoodSubCategories.Add(foodsubcategory);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = foodsubcategory.FoodSubCategoryId }, foodsubcategory);
        }

        // DELETE api/FoodSubCategory/5
        [ResponseType(typeof(FoodSubCategory))]
        public IHttpActionResult DeleteFoodSubCategory(int id)
        {
            FoodSubCategory foodsubcategory = db.FoodSubCategories.Find(id);
            if (foodsubcategory == null)
            {
                return NotFound();
            }

            db.FoodSubCategories.Remove(foodsubcategory);
            db.SaveChanges();

            return Ok(foodsubcategory);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool FoodSubCategoryExists(int id)
        {
            return db.FoodSubCategories.Count(e => e.FoodSubCategoryId == id) > 0;
        }
    }
}