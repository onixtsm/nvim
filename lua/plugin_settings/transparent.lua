local transparent_check = function()
  local temp = os.execute("git rev-parse --is-inside-work-tree")
  if temp == 0 then
    return false
  end

  return true
end


require("transparent").setup({
  enable = transparent_check()
})
