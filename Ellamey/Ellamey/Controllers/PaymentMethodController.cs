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
    public class PaymentMethodController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/PaymentMethod
        public IQueryable<PaymentMethod> GetPaymentMethods()
        {
            return db.PaymentMethods.OrderBy(a => (a.PaymentMethodId));
        }

        // GET api/PaymentMethod/5
        [ResponseType(typeof(PaymentMethod))]
        public IHttpActionResult GetPaymentMethod(int id)
        {
            PaymentMethod paymentmethod = db.PaymentMethods.Find(id);
            if (paymentmethod == null)
            {
                return NotFound();
            }

            return Ok(paymentmethod);
        }

        // PUT api/PaymentMethod/5
        public IHttpActionResult PutPaymentMethod(PaymentMethod paymentmethod)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            //if (id != paymentmethod.PaymentMethodId)
            //{
            //    return BadRequest();
            //}

           
            paymentmethod.UpdatedDate = DateTime.Now;
            db.Entry(paymentmethod).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PaymentMethodExists(paymentmethod.PaymentMethodId))
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

        // POST api/PaymentMethod
        [ResponseType(typeof(PaymentMethod))]
        public IHttpActionResult PostPaymentMethod(PaymentMethod paymentmethod)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }


            
            paymentmethod.CreatedDate = DateTime.Now;
            paymentmethod.IsDeleted = false;
            db.PaymentMethods.Add(paymentmethod);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = paymentmethod.PaymentMethodId }, paymentmethod);
        }

        // DELETE api/PaymentMethod/5
        [ResponseType(typeof(PaymentMethod))]
        public IHttpActionResult DeletePaymentMethod(int id,int loginId)
        {
            PaymentMethod paymentmethod = db.PaymentMethods.Find(id);
            if (paymentmethod == null)
            {
                return NotFound();
            }

            paymentmethod.UpdatedBy = loginId;
            paymentmethod.UpdatedDate = DateTime.Now;
            paymentmethod.IsDeleted = true;
            db.Entry(paymentmethod).State = System.Data.Entity.EntityState.Modified;
            //db.PaymentMethods.Remove(paymentmethod);
            db.SaveChanges();

            return Ok(paymentmethod);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PaymentMethodExists(int id)
        {
            return db.PaymentMethods.Count(e => e.PaymentMethodId == id) > 0;
        }
    }
}