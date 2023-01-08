local status, notify = pcall(require, "notify")
if not status then
  vim.notify("Nvim-notify plugin wasn't not installed!")
  return
end

notify.setup({
  stages = "static",
  timeout = 5000,
})
vim.notify = notify
