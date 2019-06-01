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
    public class OrderStatusController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/OrderStatus
        public IQueryable<OrderStatusGrocer> GetOrderStatus()
        {
            return db.OrderStatusGrocers.OrderBy(a => (a.OrderStatusId));
        }

        // GET api/OrderStatus/5
        [ResponseType(typeof(OrderStatusGrocer))]
        public IHttpActionResult GetOrderStatu(int id)
        {
            OrderStatusGrocer orderstatu = db.OrderStatusGrocers.Find(id);
            if (orderstatu == null)
            {
                return NotFound();
            }

            return Ok(orderstatu);
        }

        // PUT api/OrderStatus/5
        public IHttpActionResult PutOrderStatu(int id, OrderStatusGrocer orderstatu)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != orderstatu.OrderStatusId)
            {
                return BadRequest();
            }

            db.Entry(orderstatu).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrderStatuExists(id))
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

        // POST api/OrderStatus
        [ResponseType(typeof(OrderStatusGrocer))]
        public IHttpActionResult PostOrderStatu(OrderStatusGrocer orderstatu)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.OrderStatusGrocers.Add(orderstatu);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = orderstatu.OrderStatusId }, orderstatu);
        }

        // DELETE api/OrderStatus/5
        [ResponseType(typeof(OrderStatusGrocer))]
        public IHttpActionResult DeleteOrderStatu(int id)
        {
            OrderStatusGrocer orderstatu = db.OrderStatusGrocers.Find(id);
            if (orderstatu == null)
            {
                return NotFound();
            }

            db.OrderStatusGrocers.Remove(orderstatu);
            db.SaveChanges();

            return Ok(orderstatu);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool OrderStatuExists(int id)
        {
            return db.OrderStatusGrocers.Count(e => e.OrderStatusId == id) > 0;
        }
    }
}