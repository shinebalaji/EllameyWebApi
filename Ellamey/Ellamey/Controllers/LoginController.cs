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
using System.Web.Http.Cors;

namespace Ellamey.Controllers
{
   // [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class LoginController : ApiController
    {
        private EllameyEntities db = new EllameyEntities();

        // GET api/Login
        public IQueryable<Login> GetLogins()
        {
            var items = db.Logins;
            foreach (var item in items)
            {
                Role role = db.Roles.Find(item.RoleId);
                
                item.Role = role;
                
                
            }


            return db.Logins.OrderBy(a => (a.LoginId));
        }

        [HttpGet]
        [Route("api/LoginsList")]
        public IQueryable<Login> LoginsList()
        {
            var items = db.Logins;
            foreach (var item in items)
            {
                Role role = db.Roles.Find(item.RoleId);

                item.Role = role;


            }


            return db.Logins.OrderBy(a => (a.LoginId));
        }

        // GET api/Login/5
        [ResponseType(typeof(Login))]
        public IHttpActionResult GetLogin(int id)
        {
            Login login = db.Logins.Find(id);
            if (login == null)
            {
                return NotFound();
            }

            return Ok(login);
        }

        // PUT api/Login/5
        public IHttpActionResult PutLogin(Login login)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            //if (id != login.LoginId)
            //{
            //    return BadRequest();
            //}
           
            login.UpdatedDate = DateTime.Now;
            db.Entry(login).State = System.Data.Entity.EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LoginExists(login.LoginId))
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

        // POST api/Login
        [ResponseType(typeof(Login))]
        public IHttpActionResult PostLogin(Login login)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
          
            login.CreatedDate = DateTime.Now;
            login.IsDeleted = false;
            login.isToRead = true;
            db.Logins.Add(login);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = login.LoginId }, login);
        }

        // DELETE api/Login/5
        [ResponseType(typeof(Login))]
        public IHttpActionResult DeleteLogin(int id,int userId)
        {
            Login login = db.Logins.Find(id);
            if (login == null)
            {
                return NotFound();
            }


            login.UpdatedBy = userId;
            login.UpdatedDate = DateTime.Now;
            login.IsDeleted = true;
            db.Entry(login).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return Ok(login);
        }

        [HttpPut]
        [Route("api/UpdatePhoneNumber/{userId}/{phoneNumber}")]
        public IHttpActionResult UpdatePhoneNumber(int userId,string phoneNumber)
        {
            Login login = db.Logins.Find(userId);
            if (login == null)
            {
                return NotFound();
            }


            login.UpdatedBy = userId;
            login.UpdatedDate = DateTime.Now;
            login.PhoneNumber = phoneNumber;
            db.Entry(login).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return Ok(login);
        }

        [HttpPut]
        [Route("api/UpdateDeliveryAddress")]
        public IHttpActionResult UpdateDeliveryAddress(Login loginUser)
        {
            Login login = db.Logins.Find(loginUser.LoginId);
            if (login == null)
            {
                return NotFound();
            }


            login.UpdatedBy = loginUser.LoginId;
            login.UpdatedDate = DateTime.Now;
            login.Address1 = loginUser.Address1;
            login.Address2= loginUser.Address2;
            login.city = loginUser.city;
            login.stateid = loginUser.stateid;
            login.countryid = loginUser.countryid;
            login.postalcode = loginUser.postalcode;
            db.Entry(login).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return Ok(login);
        }

        [HttpPut]
        [Route("api/UpdateProfile")]
        public IHttpActionResult UpdateProfile(Login loginUser)
        {
            Login login = db.Logins.Find(loginUser.LoginId);
            if (login == null)
            {
                return NotFound();
            }


            login.UpdatedBy = loginUser.LoginId;
            login.UpdatedDate = DateTime.Now;
            login.Name = loginUser.Name;
            login.Email = loginUser.Email;
            login.PhotoPath = loginUser.PhotoPath;
            db.Entry(login).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return Ok(login);
        }

        [HttpPut]
        [Route("api/ChangePassword/{userName}/{password}")]
        public IHttpActionResult ChangePassword(string userName,string password)
        {
            if (db.Logins.Where(i => i.UserName == userName).Count() > 0)
            {
                Login login = db.Logins.First(i => i.UserName == userName);

                login.UpdatedBy = login.LoginId;
                login.UpdatedDate = DateTime.Now;
                login.Password = password;
                db.Entry(login).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();

                return Ok(login);
            }
            else
            {
                return NotFound();
            }

        }

        [HttpPut]
        [Route("api/GetUserByEmail")]
        public IHttpActionResult GetUserByEmail(Login loginUser)
        {
            if (db.Logins.Where(i => i.Email == loginUser.Email).Count() > 0)
            {
                Login login = db.Logins.First(i => i.Email == loginUser.Email);

                return Ok(login);
            }
            else
            {
                return NotFound();
            }
            
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool LoginExists(int id)
        {
            return db.Logins.Count(e => e.LoginId == id) > 0;
        }
    }
}