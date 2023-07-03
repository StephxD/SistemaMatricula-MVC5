using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace PlantillaCarrusel.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View("~/Views/Login/Login.cshtml");
        }

        [HttpPost]
        public ActionResult LoginValidacion(string paramusername, string parampassword)
        {
            BusinessLogic bs = new BusinessLogic();

            var user = bs.LoginValidator(paramusername, parampassword);

            if (user != null)
            {
                if (user.Activo == true)
                {
                    var authTicket = new FormsAuthenticationTicket(
                                    1, // version number
                                    user.Usuario, // user's name
                                    DateTime.Now, // date/time issued
                                    DateTime.Now.AddMinutes(30), // expiration date/time
                                    false, // "remember me" checkbox
                                    user.esAlumno.ToString() // user data
                                );
                    string encryptedTicket = FormsAuthentication.Encrypt(authTicket);
                    var authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                    HttpContext.Response.Cookies.Add(authCookie);

                    return RedirectToAction("Index", "Home");

                }
                else
                {
                    TempData["Message"] = "Usuario inactivo";
                    return View("~/Views/Login/Login.cshtml");
                }

            }
            else
            {
                TempData["Message"] = "Usuario o contrasena invalidos";
                return View("~/Views/Login/Login.cshtml");
            }
        }

        public ActionResult LogOut()
        {
            System.Web.Security.FormsAuthentication.SignOut();
            return View("~/Views/Login/Login.cshtml");
        }

    }
}
