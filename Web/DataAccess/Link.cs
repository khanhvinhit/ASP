using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DataAccess
{
	public class Link
	{
		private static string BuildAbsolute(string relativeUrl)
		{
			Uri uri = HttpContext.Current.Request.Url;
			string app = HttpContext.Current.Request.ApplicationPath;
			if (!app.EndsWith("/"))
				app += "/";
			relativeUrl = relativeUrl.TrimStart('/');
			return HttpUtility.UrlPathEncode(
				String.Format("http://{0}:{1}{2}{3}",
					uri.Host, uri.Port, app, relativeUrl));
		}

		public static string ToCategory(string categoryId, string page)
		{
			if (page == "1")
				return BuildAbsolute(
					String.Format("Catalog.aspx?CategoryID={0}",
						categoryId));
			else
				return BuildAbsolute(
					String.Format("Catalog.aspx?CategoryID={0}&Page={1}",
						categoryId, page));
		}

		public static string ToCategory(string categoryId)
		{
			return ToCategory(categoryId, "1");
		}
	}
}
 

