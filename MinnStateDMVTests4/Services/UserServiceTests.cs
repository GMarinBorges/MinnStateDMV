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

            User user = new User
            {
                Username = "Gustavo",
                Password = "EmptyHands"
            };

            User user1 = UserRepository.Users.FirstOrDefault(o => o.Username.Equals(userLogin.Username, StringComparison.OrdinalIgnoreCase) && o.Password.Equals(userLogin.Password));

            Assert.IsNull(user1);
        }
    }
}