local P = {}
utils = P

-- #############################################################################

--- Correspondence table, used by `switch_word_under_cursor()`
local _switch_table = {
  {'0', '1'},

  {'KTRUE', 'KFALSE'},
  {'true', 'false'},
  {'True', 'False'},
  {'y', 'n'},
  {'yes', 'no'},
  {'YES', 'NO'},

  {'enabled', 'disabled'},
  {'on', 'off'},
  {'ON', 'OFF'},

  {'TASK_STATUS_RUNNING', 'TASK_STATUS_DEAD'},
  {'TASK_AGENT', 'TASK_JOB'},
}

-- build a faster lookup table with every pair declared in _switch_table
local _switch_lookup_table = (function()
  local ans = {}
  for _, vals in ipairs(_switch_table) do
    ans[vals[1]] = vals[2]
    ans[vals[2]] = vals[1]
  end
  return ans
end)()


--- Switch the word under the cursor with its complement, if it exists
-- @see _switch_table
function P.switch_word_under_cursor()
  local word = vim.fn.expand("<cword>")
  local subst = _switch_lookup_table[word]

  if subst ~= nil then
    vim.fn.execute("normal! ciw"..subst)
  else
    print("Don't know how to switch the word "..word.."!")
  end
end

-- #############################################################################

function P.run_exrc(basedir)
  local exrc_lua = basedir .. '/.nvim.lua'
  if not vim.fn.filereadable(exrc_lua) then
    -- file does not exist: nothing to do
    return
  end
  if vim.secure.read(exrc_lua) == nil then
    print('Did not source ' .. exrc_lua .. ': untrusted file')
    return
  end

  -- now we know that exrc_lua exists, and is trusted: source it
  print('Auto-Sourcing file ' .. exrc_lua)
  vim.cmd('luafile ' .. exrc_lua)
end

return utils

