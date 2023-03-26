local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true, noremap = true })
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Mimic shell movements
map("i", "<C-E>", "<ESC>A")
map("i", "<C-A>", "<ESC>I")

-- NERDTree Maps
map("n", "<leader>n", ":NvimTreeFindFileToggle<CR>")
map("n", "<leader>m", ":NvimTreeFocus<cr>")
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")

-- navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Resize with arrows
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")

-- Press jk fast to enter
map("i", "jk", "<ESC>")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- close buffer
--[[ map("n", "<leader>qq", ":enew<bar>bd #<CR>") ]]
map("n", "<leader>qq", ":<C-U>bprevious <bar> bdelete #<CR>")

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==g<Esc>")
map("n", "<A-k>", "<Esc>:m .-2<CR>==g<Esc>")

map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Formatting
map("n", "<leader>fr", ":Format<CR>")
