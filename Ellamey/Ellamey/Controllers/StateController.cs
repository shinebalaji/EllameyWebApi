﻿using System;
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
    public class StateController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/State
        public IQueryable<State> GetStates()
        {
            return db.States.OrderBy(a => (a.Name));
        }

        // GET api/State/5
        [ResponseType(typeof(State))]
        public IHttpActionResult GetState(int id)
        {
            State state = db.States.Find(id);
            if (state == null)
            {
                return NotFound();
            }

            return Ok(state);
        }

        // PUT api/State/5
        public IHttpActionResult PutState(int id, State state)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != state.StateId)
            {
                return BadRequest();
            }

            db.Entry(state).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!StateExists(id))
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

        // POST api/State
        [ResponseType(typeof(State))]
        public IHttpActionResult PostState(State state)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.States.Add(state);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = state.StateId }, state);
        }

        // DELETE api/State/5
        [ResponseType(typeof(State))]
        public IHttpActionResult DeleteState(int id)
        {
            State state = db.States.Find(id);
            if (state == null)
            {
                return NotFound();
            }

            db.States.Remove(state);
            db.SaveChanges();

            return Ok(state);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool StateExists(int id)
        {
            return db.States.Count(e => e.StateId == id) > 0;
        }
    }
}