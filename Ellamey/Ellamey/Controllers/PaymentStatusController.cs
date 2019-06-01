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
    public class PaymentStatusController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/PaymentStatus
        public IQueryable<PaymentStatu> GetPaymentStatus()
        {
            return db.PaymentStatus.OrderBy(a => (a.PaymentStatusName));
        }

        // GET api/PaymentStatus/5
        [ResponseType(typeof(PaymentStatu))]
        public IHttpActionResult GetPaymentStatu(int id)
        {
            PaymentStatu paymentstatu = db.PaymentStatus.Find(id);
            if (paymentstatu == null)
            {
                return NotFound();
            }

            return Ok(paymentstatu);
        }

        // PUT api/PaymentStatus/5
        public IHttpActionResult PutPaymentStatu(int id, PaymentStatu paymentstatu)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != paymentstatu.PaymentStatusId)
            {
                return BadRequest();
            }

            db.Entry(paymentstatu).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PaymentStatuExists(id))
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

        // POST api/PaymentStatus
        [ResponseType(typeof(PaymentStatu))]
        public IHttpActionResult PostPaymentStatu(PaymentStatu paymentstatu)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.PaymentStatus.Add(paymentstatu);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = paymentstatu.PaymentStatusId }, paymentstatu);
        }

        // DELETE api/PaymentStatus/5
        [ResponseType(typeof(PaymentStatu))]
        public IHttpActionResult DeletePaymentStatu(int id)
        {
            PaymentStatu paymentstatu = db.PaymentStatus.Find(id);
            if (paymentstatu == null)
            {
                return NotFound();
            }

            db.PaymentStatus.Remove(paymentstatu);
            db.SaveChanges();

            return Ok(paymentstatu);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PaymentStatuExists(int id)
        {
            return db.PaymentStatus.Count(e => e.PaymentStatusId == id) > 0;
        }
    }
}