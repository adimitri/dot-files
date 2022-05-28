local options = {
	backup = false,
	fileencoding = "utf-8",
	showtabline = 2,
	swapfile = false,
	expandtab = true,
	tabstop = 2,
	shiftwidth = 2,
	number = true,
	cursorline = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	undofile = true,
	termguicolors = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
