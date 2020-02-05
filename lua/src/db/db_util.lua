module = {}

function module.getMysql()
    local mysql = require "resty.mysql"
    local db, err = mysql:new()
    if not db then
        ngx.say("failed to instantiate mysql: ", err)
        return
    end

    db:set_timeout(1000) -- 1 sec

    local ok, err, errcode, sqlstate =
        db:connect {
        host = "127.0.0.1",
        port = 3306,
        database = "helloworld",
        user = "root",
        password = "root",
        charset = "utf8",
        max_packet_size = 1024 * 1024
    }

    if not ok then
        ngx.say("failed to connect: ", err, ": ", errcode, " ", sqlstate)
        return
    end

    return db
end

function module.selectAll()
    local db = module.getMysql()
    -- run a select query, expected about 10 rows in
    -- the result set:
    res, err, errcode, sqlstate = db:query("select * from helloworld", 10)
    if not res then
        ngx.say("bad result: ", err, ": ", errcode, ": ", sqlstate, ".")
        return
    end

    return res
end

return module