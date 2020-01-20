using System;
using crud_restful.model;

namespace crud_restful.context
{
    public class HelloWorldContext : DbContext<HelloWorldModel>
    {
        public HelloWorldContext()
        {
        }
    }
}
