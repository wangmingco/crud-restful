using System;
using System.Collections.Generic;
using crud_restful.context;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace crud_restful.Controllers
{
    [ApiController]
    public class HelloWorldController : ControllerBase
    {
       
        private readonly ILogger<HelloWorldController> _logger;
       
        private HelloWorldContext helloWorldContext = new HelloWorldContext();

        public HelloWorldController(ILogger<HelloWorldController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        [Route("/HelloWorld")]
        public String HelloWorld()
        {
            return "welcome";
        }

        [HttpGet]
        [Route("/SelectAll")]
        public String SelectAll()
        {
            List<model.HelloWorldModel> list = helloWorldContext.GetList();
            return list.ToString();
        }
    }
}
