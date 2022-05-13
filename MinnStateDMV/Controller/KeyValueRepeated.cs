using Microsoft.AspNetCore.Mvc;

namespace ProblemSolvingDic.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class KeyValueRepeated : ControllerBase
    {

        /*
        Author: GustavoMBPro
        Title: ProblemSolvingDic
        */

        [HttpPost(Name = "KeyValueRepeated")]
        public ActionResult<List<KeyValuePair<String, String>>> NewDic(List<KeyValuePair<string, string>> lista )
        {
            List<KeyValuePair<String, String>> paired = new List<KeyValuePair<String, String>>(lista);
            List<string> partA = new List<string>();

            foreach (var i in paired)
            {
               partA.Add(i.Key);
            }

            var dicRepeat = partA.GroupBy(G => G).Where(u => u.Count() > 1).ToDictionary(s => s.Key, t => t.Count().ToString());

            List<KeyValuePair<String, String>> lis2 = new List<KeyValuePair<String, String>>();

            lis2 = dicRepeat.ToList();

            return lis2;
        }
    }
}