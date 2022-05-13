using MinnStateDMV.Models;

namespace MinnStateDMV.Services
{
    public interface IUserService
    {
        public User Get(UserLogin userLogin);
    }
}
