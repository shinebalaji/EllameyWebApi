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
    public class RestaurantOrderController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/RestaurantOrder
        public IQueryable<RestaurantOrder> GetRestaurantOrders()
        {
            var items = db.RestaurantOrders;
            foreach (var item in items)
            {
                //Login login = db.Logins.Find(item.LoginId);
                //item.Login = login;

                OrderStatusRestaurateur orderStatusRestaurateur = db.OrderStatusRestaurateurs.Find(item.OrderStatusId);
                item.OrderStatusRestaurateur = orderStatusRestaurateur;

                PaymentStatu paymentStatus = db.PaymentStatus.Find(item.PaymentStatusId);
                item.PaymentStatu = paymentStatus;

                //Restaurateur restaurateur = db.Restaurateurs.Find(item.RestaurateurId);
                //item.Restaurateur = restaurateur;
            }

            return db.RestaurantOrders.OrderBy(a => (a.RestaurantOrderId));
        }

        [HttpGet]
        [Route("api/GetRestaurantOrdersByLoginId/{LoginId}")]
        public IQueryable<RestaurantOrder> GetRestaurantOrdersByLoginId(int LoginId)
        {
            var items = db.RestaurantOrders.Where(i => i.LoginId == LoginId);
            foreach (var item in items)
            {
                Login login = db.Logins.Find(item.LoginId);
                item.Login = login;

                OrderStatusRestaurateur orderStatusRestaurateur = db.OrderStatusRestaurateurs.Find(item.OrderStatusId);
                item.OrderStatusRestaurateur = orderStatusRestaurateur;

                PaymentStatu paymentStatus = db.PaymentStatus.Find(item.PaymentStatusId);
                item.PaymentStatu = paymentStatus;

                Restaurateur restaurateur = db.Restaurateurs.Find(item.RestaurateurId);
                item.Restaurateur = restaurateur;
            }

            return db.RestaurantOrders.OrderBy(a=>a.RestaurantOrderId);
        }

        // GET api/RestaurantOrder/5
        [ResponseType(typeof(RestaurantOrder))]
        public IHttpActionResult GetRestaurantOrder(int id)
        {
            RestaurantOrder restaurantorder = db.RestaurantOrders.Find(id);
            if (restaurantorder == null)
            {
                return NotFound();
            }

            Login login = db.Logins.Find(restaurantorder.LoginId);
            restaurantorder.Login = login;

            return Ok(restaurantorder);
        }

        // PUT api/RestaurantOrder/5
        public IHttpActionResult PutRestaurantOrder(RestaurantOrder restaurantorder)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            //if (id != restaurantorder.RestaurantOrderId)
            //{
            //    return BadRequest();
            //}
           
            restaurantorder.UpdatedDate = DateTime.Now;
            db.Entry(restaurantorder).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RestaurantOrderExists(restaurantorder.RestaurantOrderId))
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

        [HttpPut]
        [Route("api/UpdateRestaurantOrderResponse/{RestaurantOrderId}/{TrackingId}/{BankRefNo}/{OrderStatus}")]
        public IHttpActionResult UpdateRestaurantOrderResponse(int RestaurantOrderId, string TrackingId, string BankRefNo, string OrderStatus)
        {
            RestaurantOrder restaurantOrder = db.RestaurantOrders.Find(RestaurantOrderId);
            if (restaurantOrder == null)
            {
                return NotFound();
            }

            restaurantOrder.TrackingId = TrackingId;
            restaurantOrder.BankRefNo = BankRefNo;
            restaurantOrder.OrderStatus = OrderStatus;
            db.Entry(restaurantOrder).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return Ok(restaurantOrder);
        }

        // POST api/RestaurantOrder
        [ResponseType(typeof(RestaurantOrder))]
        public IHttpActionResult PostRestaurantOrder(RestaurantOrder restaurantorder)
        {
            //if (!ModelState.IsValid)
            //{
            //    return BadRequest(ModelState);
            //}

            restaurantorder.PaymentStatusId = 2; //Pending
            restaurantorder.OrderStatusId = 1; //Order Received
            restaurantorder.OrderDate = DateTime.Now.ToString(); 
            restaurantorder.CreatedDate = DateTime.Now;
            restaurantorder.IsDeleted = false;
            db.RestaurantOrders.Add(restaurantorder);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = restaurantorder.RestaurantOrderId }, restaurantorder);
        }

        // DELETE api/RestaurantOrder/5
        [ResponseType(typeof(RestaurantOrder))]
        public IHttpActionResult DeleteRestaurantOrder(int id,int loginId)
        {
            RestaurantOrder restaurantorder = db.RestaurantOrders.Find(id);
            if (restaurantorder == null)
            {
                return NotFound();
            }

          
            restaurantorder.UpdatedBy = loginId;
            restaurantorder.UpdatedDate = DateTime.Now;
            restaurantorder.IsDeleted = true;
            db.Entry(restaurantorder).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return Ok(restaurantorder);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool RestaurantOrderExists(int id)
        {
            return db.RestaurantOrders.Count(e => e.RestaurantOrderId == id) > 0;
        }
    }
}