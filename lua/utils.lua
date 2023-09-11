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

-- Remove duplicate words found in a range of lines
function P.RemoveDuplicateWords(line1, line2)
  -- get text in range
  local text = vim.fn.getline(line1, line2)

  -- filter out shit
  local word_already_seen = {}
  local deleted_words = 0
  for lineno, line in ipairs(text) do
    local current_line = {}
    for word in line:gmatch("%S+") do
      if not word_already_seen[word] then
        word_already_seen[word] = true
        table.insert(current_line, word)
      else
        deleted_words = deleted_words + 1
      end
    end
    -- print out the filtered line
    vim.fn.setline(line1 + lineno - 1, table.concat(current_line, " "))
  end

  print("Removed " .. deleted_words .. " duplicate words")
end

return utils
