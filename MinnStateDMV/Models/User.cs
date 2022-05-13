namespace MinnStateDMV.Models
{
   public class User
    {
        //Fields retrived by "UserRepository"
        //Role makes the diffecence between users for Auth
        public string Role { get; set; }
        //Users
        public string Username { get; set; }
        //Password
        public string Password { get; set; }
    }
}
