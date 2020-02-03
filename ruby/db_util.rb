require 'mysql2'

module DbUtil
    def DbUtil.selectAll
        client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root", :database => "helloworld")
    
        results = client.query("SELECT * FROM helloworld")
        return results
    end
    
end
