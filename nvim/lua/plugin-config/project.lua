local status, project = pcall(require, "project_nvim")
if not status then
    vim.notify("project_nvim not found!")
  return
end

-- Support nvim-tree.
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
  detection_methods = { "pattern" },
  patterns = { ".git", "Makefile" },
})

local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("[Telescope] not found when initialize plugin: [project].")
  return
end
pcall(telescope.load_extension, "projects")
