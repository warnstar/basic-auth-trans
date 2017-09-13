--
-- Created by IntelliJ IDEA.
-- User: wchuang
-- Date: 8/18/2017
-- Time: 4:09 PM
--

return {
  no_consumer = true,
  fields = {
      user_key = { type = "string", default = "union_id"},
      token_prefix = { type = "string", default = ""},
      redis_host = { type = "string" , default = "localhost"},
      redis_port = { type = "number", default = 6379 },
      redis_database = { type = "number", default = 0 },
      redis_password = { type = "string", default = ""},
  }
}