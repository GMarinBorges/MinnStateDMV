using Microsoft.VisualStudio.TestTools.UnitTesting;
using MinnStateDMV.Models;
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
        public void GetTest()
        {
            UserService userService = new UserService();

            User user = new User
            {
                Username = "Gustavo",
                Password = "EmptyHands"
            };
            Assert.IsNull(userService.Authenticate(user.Username, user.Password));
        }
    }
}