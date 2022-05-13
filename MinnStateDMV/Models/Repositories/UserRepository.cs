using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using MinnStateDMV.Data;
using MinnStateDMV.Models;


namespace MinnStateDMV.Repositories
{
    public class UserRepository
    {
        //List of Users
        public static List<User> Users = new()
        {
            //Police global login
            new() { Username = "LawGlobalUser", Password = "Law%1234", Role = "Law" },
            //DMV personnel login
            new() { Username = "DMVGlobalUser", Password = "DMV%1234", Role = "DMV" },
            //Admin login for maintanence
            new() { Username = "Admin", Password = "Admin%1234", Role = "Admin" }

        };
    }
}
