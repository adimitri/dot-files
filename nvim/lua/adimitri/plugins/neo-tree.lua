local setup, neotree = pcall(require, "neo-tree")
if not setup then
  return
end

-- configure neo-tree
neotree.setup({
  close_if_last_window = true,
  window = {
    mappings = {
      ["<space>"] = {
        "toggle_node",
        nowait = true,
      },
      ["o"] = "toggle_node",
    },
  },
})
