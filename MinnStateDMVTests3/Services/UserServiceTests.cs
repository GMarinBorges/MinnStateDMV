using Microsoft.VisualStudio.TestTools.UnitTesting;
using MinnStateDMV.Models;
using MinnStateDMV.Repositories;
using MinnStateDMV.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MinnStateDMV.Services.Tests
{
    [TestClass()]
    public class UserServiceTests
    {
        [TestMethod()]
        public void GetTest(UserLogin userLogin)
        {
            UserRepository.Users.Add(new() { Username = "none", Password = "none", Role = "none" });
            string userTest = "none";

            string passwordTest = "none";

            User user = UserRepository.Users.FirstOrDefault(o => o.Username.Equals(userTest, StringComparison.OrdinalIgnoreCase) && o.Password.Equals(passwordTest));

            Assert.IsNull(user);

        }
    }
}