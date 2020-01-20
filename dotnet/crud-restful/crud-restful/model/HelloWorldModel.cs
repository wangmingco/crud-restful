using SqlSugar;

namespace crud_restful.model
{

    [SugarTable("helloworld")]
    public class HelloWorldModel
    {
        public HelloWorldModel()
        {
        }

        [SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }
        public string Name { get; set; }
    }

}
