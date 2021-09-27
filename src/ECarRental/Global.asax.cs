using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;


namespace ECarRental.Model
{
    public class Global : System.Web.HttpApplication
    {
        //public static List<Vehicle> Vehicles;
        public static List<Vehicle> Vehicles = new List<Vehicle>();
        //public static Dictionary<int, int> map = new Dictionary<int, int>();
        //public static Dictionary<int, int> totals = new Dictionary<int, int>();
        public static List<int> totals = new List<int>();
        public static List<int> quantity = new List<int>();
        public static int CartCleared = 0;
        protected void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}