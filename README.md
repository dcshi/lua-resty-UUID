调用系统的UUID模块生成的由32位16进制（0-f）数组成的的串，本模块进一步压缩为62进制。

生成8位UUID
local resty_uuid = require "resty.uuid" 

local id =  resty_uuid:gen8()   --output 3uNy6ZzI


生成20为UUID
local resty_uuid = require "resty.uuid" 

local id =  resty_uuid:gen20() -2qYArunu73bABy2RqY3M

正如你所想，生成的UUID越长，理论冲突率就越小，请根据业务需要自行斟酌。
基本思想为把系统生成的16字节（128bit）的UUID转换为62进制（a-zA-Z0-9），同时根据业务需要进行截断。

