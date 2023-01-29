using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.enums
{
    public enum LoginResult
    {
        用户名不存在 = 0,
        密码错误 = 1,
        用户已被冻结 = 2,
        登录成功 = 3
    }

    public enum RegisterResult
    {
        用户名已存在 = 0,
        注册成功 = 1,
        注册失败 = 2,
    }

    public enum SortType
    {
        
        PriceAsc = 1,
        PriceDesc = 2,
       
        OnsaleDesc = 4
    }
}
