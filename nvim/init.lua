require("core")
-- NOTE: Do not put lazy.lua in the lua/ directly.
-- More info please refer to https://github.com/folke/lazy.nvim/issues/1233.
require("lazy.lazy")

local function send2net()
    local ch = vim.fn.sockconnect('tcp', '127.0.0.1:22222', {rpc = false})
    if ch == -1 then
        vim.cmd('echomsg "Failed to open channel, status = ' .. ch .. '"')
        return
    end
    vim.fn.chansend(ch, vim.fn.getreg('"'))
    vim.fn.chanclose(ch)
end

vim.api.nvim_create_augroup('send2net', {clear = true})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = 'send2net',
    callback = function()
        if vim.v.event.operator == 'y' then
            send2net()
        end
    end
})
