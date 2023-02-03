local transparent_check = function()
  return not (os.execute("git rev-parse --is-inside-work-tree") == 0)
end


require("transparent").setup({
  enable = transparent_check()
})
