using Microsoft.AspNetCore.Mvc;

namespace ProblemSolvingDic.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class KeyValuePaired : ControllerBase
    {
        [HttpPost(Name = "KeyValuePaired")]
        public ActionResult<List<KeyValuePair<String, String>>> NewDic(List<KeyValuePair<string, string>> lista)
        {
            Dictionary<string, string> dicNormal = new Dictionary<string, string>();
            List<KeyValuePair<String, String>> paired = new List<KeyValuePair<String, String>>(lista);

            foreach (var i in paired)
            {
                try
                {
                    dicNormal.Add(i.Key, i.Value);
                }
                catch
                {
                    continue;
                }
            }

            List<KeyValuePair<String, String>> list1 = new List<KeyValuePair<String, String>>();

            list1 = dicNormal.ToList();

            return list1;
        }
    }
}