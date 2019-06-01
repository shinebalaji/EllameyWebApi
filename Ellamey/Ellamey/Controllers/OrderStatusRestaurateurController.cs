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
    public class OrderStatusRestaurateurController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/OrderStatusRestaurateur
        public IQueryable<OrderStatusRestaurateur> GetOrderStatusRestaurateurs()
        {
            return db.OrderStatusRestaurateurs.OrderBy(a => (a.OrderStatusId));
        }

        // GET api/OrderStatusRestaurateur/5
        [ResponseType(typeof(OrderStatusRestaurateur))]
        public IHttpActionResult GetOrderStatusRestaurateur(int id)
        {
            OrderStatusRestaurateur orderstatusrestaurateur = db.OrderStatusRestaurateurs.Find(id);
            if (orderstatusrestaurateur == null)
            {
                return NotFound();
            }

            return Ok(orderstatusrestaurateur);
        }

        // PUT api/OrderStatusRestaurateur/5
        public IHttpActionResult PutOrderStatusRestaurateur(int id, OrderStatusRestaurateur orderstatusrestaurateur)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != orderstatusrestaurateur.OrderStatusId)
            {
                return BadRequest();
            }

            db.Entry(orderstatusrestaurateur).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrderStatusRestaurateurExists(id))
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

        // POST api/OrderStatusRestaurateur
        [ResponseType(typeof(OrderStatusRestaurateur))]
        public IHttpActionResult PostOrderStatusRestaurateur(OrderStatusRestaurateur orderstatusrestaurateur)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.OrderStatusRestaurateurs.Add(orderstatusrestaurateur);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = orderstatusrestaurateur.OrderStatusId }, orderstatusrestaurateur);
        }

        // DELETE api/OrderStatusRestaurateur/5
        [ResponseType(typeof(OrderStatusRestaurateur))]
        public IHttpActionResult DeleteOrderStatusRestaurateur(int id)
        {
            OrderStatusRestaurateur orderstatusrestaurateur = db.OrderStatusRestaurateurs.Find(id);
            if (orderstatusrestaurateur == null)
            {
                return NotFound();
            }

            db.OrderStatusRestaurateurs.Remove(orderstatusrestaurateur);
            db.SaveChanges();

            return Ok(orderstatusrestaurateur);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool OrderStatusRestaurateurExists(int id)
        {
            return db.OrderStatusRestaurateurs.Count(e => e.OrderStatusId == id) > 0;
        }
    }
}