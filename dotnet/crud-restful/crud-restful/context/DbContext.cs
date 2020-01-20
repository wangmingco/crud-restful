using System;
using System.Collections.Generic;
using System.Linq;
using SqlSugar;

namespace crud_restful
{
    // TODO 每次都创建一个连接, 看看能否池化
    public class DbContext<T> where T: class,new()
    {
        public DbContext()
        {
            Db = new SqlSugarClient(new ConnectionConfig()
            {
                ConnectionString = "Server=127.0.0.1; Port=3306; Database=helloworld; Uid=root; Pwd=root;",
                DbType = DbType.MySql,
                InitKeyType = InitKeyType.Attribute,//从特性读取主键和自增列信息
                IsAutoCloseConnection = true,//开启自动释放模式和EF原理一样我就不多解释了

            });
            //调式代码 用来打印SQL 
            Db.Aop.OnLogExecuting = (sql, pars) =>
            {
                Console.WriteLine(sql + "\r\n" +
                    Db.Utilities.SerializeObject(pars.ToDictionary(it => it.ParameterName, it => it.Value)));
                Console.WriteLine();
            };
        }


        public SqlSugarClient Db;//用来处理事务多表查询和复杂的操作

        public SimpleClient<T> CurrentDb { get { return new SimpleClient<T>(Db); } }//用来处理T表的常用操作

        public virtual List<T> GetList()
        {
            return CurrentDb.GetList();
        }

        /// <summary>
        /// 根据主键删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public virtual bool Delete(dynamic id)
        {
            return CurrentDb.Delete(id);
        }


        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public virtual bool Update(T obj)
        {
            return CurrentDb.Update(obj);
        }
    }
}
