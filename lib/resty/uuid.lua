module("resty.uuid", package.seeall)

_VERSION = '0.01'

local ffi = require "ffi"
local ffi_new = ffi.new
local ffi_str = ffi.string

ffi.cdef[[
void uuid8(char *out);
void uuid20(char *out);
]]

local libuuid = ffi.load("libuuidx")

function gen8()
	if libuuid then
		local result = ffi_new("char[9]")
		libuuid.uuid8(result)
		return ffi_str(result)
	end
end

function gen20()
	if libuuid then
		local result = ffi_new("char[21]")
		libuuid.uuid20(result)
		return ffi_str(result)
	end
end

-- to prevent use of casual module global variables
getmetatable(resty.uuid).__newindex = function (table, key, val)
	error('attempt to write to undeclared variable "' .. key .. '": '
	.. debug.traceback())
end
