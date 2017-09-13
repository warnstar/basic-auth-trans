--
-- Created by IntelliJ IDEA.
-- User: wchuang
-- Date: 8/18/2017
-- Time: 4:09 PM
--
local responses = require "kong.tools.responses"
local BasePlugin = require "kong.plugins.base_plugin"
local redis = require("kong.plugins.basic-auth-trans.redis")


local TokenAuthHandler = BasePlugin:extend()

TokenAuthHandler.PRIORITY = 1000

local PluginName = "token-auth-trans"

--- Get JWT from headers
-- @param request ngx request object
-- @return token
-- @return err
local function extract_token(request)
    local auth_header = request.get_headers()["authorization"]
    if auth_header then
        local iterator, ierr = ngx.re.gmatch(auth_header, "\\s*[Bb]earer\\s+(.+)")
        if not iterator then
            return nil, ierr
        end

        local m, err = iterator()
        if err then
            return nil, err
        end

        if m and #m > 0 then
            return m[1]
        end
    end
end

--- Query auth server to validate token
-- @param token Token to be validated
-- @param conf Plugin configuration
-- @return info    Information associated with token
-- @return err
local function query_and_validate_token(token, conf)
    local redisConfig = {
        host = conf.redis_host,
        port = conf.redis_port,
        database = conf.redis_database,
        password = conf.redis_password
    }

    local red = redis.new(redisConfig)

    local res, err = red:exec(
        function(red)
            return red:hget(token, conf.user_key)
        end
    )

    if not res then
        return nil, "redis err:"..err
    end

    if res == ngx.null then
        return nil
    else
        return res
    end
end


function TokenAuthHandler:new()
    TokenAuthHandler.super.new(self, PluginName)
end


function TokenAuthHandler:access(conf)
    TokenAuthHandler.super.access(self)

    local token, err = extract_token(ngx.req)
    if token then

        local info, err = query_and_validate_token(conf.token_prefix..token, conf)

        if err then
            return responses.send(402, err)
        else
            --- 下划线转换成中杠
            local absKey = string.gsub(conf.user_key, "_", "-")
            ngx.req.set_header(absKey, info)
        end
    end
end

return TokenAuthHandler