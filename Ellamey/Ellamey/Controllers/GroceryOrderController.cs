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
    public class GroceryOrderController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/GroceryOrder
        public IQueryable<GroceryOrder> GetGroceryOrders()
        {
            var items = db.GroceryOrders;
            foreach (var item in items)
            {
                OrderStatusGrocer orderStatusGrocer = db.OrderStatusGrocers.Find(item.OrderStatusId);
                item.OrderStatusGrocer = orderStatusGrocer;

                PaymentStatu paymentStatus = db.PaymentStatus.Find(item.PaymentStatusId);
                item.PaymentStatu = paymentStatus;

                //Login login = db.Logins.Find(item.LoginId);
                //item.Login = login;

                //Grocer grocer = db.Grocers.Find(item.GrocerId);
                //item.Grocer = grocer;
                
            }

            return db.GroceryOrders.OrderBy(a => (a.GroceryOrderId));
        }

        [HttpGet]
        [Route("api/GetGroceryOrdersByLoginId/{LoginId}")]
        public IQueryable<GroceryOrder> GetGroceryOrdersByLoginId(int LoginId)
        {
            var items = db.GroceryOrders.Where(i => i.LoginId == LoginId);
            foreach (var item in items)
            {
                OrderStatusGrocer orderStatusGrocer = db.OrderStatusGrocers.Find(item.OrderStatusId);
                item.OrderStatusGrocer = orderStatusGrocer;

                PaymentStatu paymentStatus = db.PaymentStatus.Find(item.PaymentStatusId);
                item.PaymentStatu = paymentStatus;

                Login login = db.Logins.Find(item.LoginId);
                item.Login = login;

                Grocer grocer = db.Grocers.Find(item.GrocerId);
                item.Grocer = grocer;
            }

            return db.GroceryOrders.OrderBy(a => a.GroceryOrderId);
        }

        // GET api/GroceryOrder/5
        [ResponseType(typeof(GroceryOrder))]
        public IHttpActionResult GetGroceryOrder(int id)
        {
            GroceryOrder groceryorder = db.GroceryOrders.Find(id);
            if (groceryorder == null)
            {
                return NotFound();
            }
            Login login = db.Logins.Find(groceryorder.LoginId);
            groceryorder.Login = login;
            return Ok(groceryorder);
        }

        // PUT api/GroceryOrder/5
        public IHttpActionResult PutGroceryOrder(GroceryOrder groceryorder)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            //if (id != groceryorder.GroceryOrderId)
            //{
            //    return BadRequest();
            //}
           
            groceryorder.UpdatedDate = DateTime.Now;
            db.Entry(groceryorder).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GroceryOrderExists(groceryorder.GroceryOrderId))
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
        [Route("api/UpdateGroceryOrderResponse/{GroceryOrderId}/{TrackingId}/{BankRefNo}/{OrderStatus}")]
        public IHttpActionResult UpdateGroceryOrderResponse(int GroceryOrderId, string TrackingId, string BankRefNo, string OrderStatus)
        {
            GroceryOrder groceryOrder = db.GroceryOrders.Find(GroceryOrderId);
            if (groceryOrder == null)
            {
                return NotFound();
            }


            groceryOrder.TrackingId = TrackingId;
            groceryOrder.BankRefNo = BankRefNo;
            groceryOrder.OrderStatus = OrderStatus;
            db.Entry(groceryOrder).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return Ok(groceryOrder);
        }

        // POST api/GroceryOrder
        [ResponseType(typeof(GroceryOrder))]
        public IHttpActionResult PostGroceryOrder(GroceryOrder groceryorder)
        {
            //if (!ModelState.IsValid)
            //{
            //    return BadRequest(ModelState);
            //}


            groceryorder.PaymentStatusId = 2; //Pending
            groceryorder.OrderStatusId = 1; //Order Received
            groceryorder.OrderDate = DateTime.Now.ToString();
            groceryorder.CreatedDate = DateTime.Now;
            groceryorder.IsDeleted = false;
            db.GroceryOrders.Add(groceryorder);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = groceryorder.GroceryOrderId }, groceryorder);
        }

        // DELETE api/GroceryOrder/5
        [ResponseType(typeof(GroceryOrder))]
        public IHttpActionResult DeleteGroceryOrder(int id,int loginiId)
        {
            GroceryOrder groceryorder = db.GroceryOrders.Find(id);
            if (groceryorder == null)
            {
                return NotFound();
            }

           
            groceryorder.UpdatedBy = loginiId;
            groceryorder.UpdatedDate = DateTime.Now;
            groceryorder.IsDeleted = true;
            db.Entry(groceryorder).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return Ok(groceryorder);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool GroceryOrderExists(int id)
        {
            return db.GroceryOrders.Count(e => e.GroceryOrderId == id) > 0;
        }
    }
}