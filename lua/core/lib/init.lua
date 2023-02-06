local M = {}

function M.isNil(x)
    return nil == x
end

function M.isTable(tbl)
    return type(tbl) == "table"
end

function M.spread(template)
    return function(tbl)
        local result = {}
        for key, value in pairs(template) do
            result[key] = value
        end

        for key, value in pairs(tbl) do
            if M.isTable(value) and ((not M.isNil(result[key])) and M.isTable(result[key])) then
                local r = M.spread(result[key])(value)
                result[key] = r
            else
                result[key] = value
            end
        end

        return result
    end
end

return M
