local db_util = require("db.db_util")

local args = ngx.req.get_uri_args()

local res = db_util.selectAll()

local cjson = require "cjson"
ngx.say("", cjson.encode(res))


