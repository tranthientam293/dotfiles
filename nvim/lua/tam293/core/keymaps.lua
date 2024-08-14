-- Set Space as leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- Clear search highlight
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Disable clipboard when using x
keymap.set("n", "x", '"_x')

-- Exit insert mode
keymap.set("i", "jk", "<esc>", { desc = "exit insert mode" })

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Move lines
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move up" })
keymap.set("i", "<A-j>", "<ESC>:m .+1<CR>==gi", { desc = "Move down" })
keymap.set("i", "<A-k>", "<ESC>:m .-2<CR>==gi", { desc = "Move up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move up" })

-- Save file
keymap.set({ "n", "i", "x", "s" }, "<C-s>", "<ESC>:w<CR>", { desc = "Save File" })

-- Quit
keymap.set("n", "<leader>qq", ":qa<CR>", { desc = "Quit all" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Got to previous tab" })
keymap.set("n", "<leader>tf", ":tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Remove ^M at the end
keymap.set("n", "<leader>rc", ":%s/\r//g<CR>",
  { desc = "Remove carriage return character", silent = true, noremap = true })
