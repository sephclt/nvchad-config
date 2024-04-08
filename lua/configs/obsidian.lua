local opts = {
  workspaces = {
    {
      name = "personal",
      path = "~/Documents/Notes/my-notes/"
    }
  },

  notes_subdir = "03-Notes",

  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },

  new_notes_location = "notes_subdir",

  note_id_func = function (title)
    local suffix = ""

    if title ~= nil then
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end

    return os.date("%Y-%m-%d") .. "-" .. suffix
  end,

  markdown_link_func = function(opts)
    return require("obsidian.util").markdown_link(opts)
  end,

  preferred_link_style = "markdown",

  image_name_func = function()
    return string.format("%s-", os.date("%Y-%m-%d"))
  end,

  note_frontmatter_func = function(note)
    if note.title then
      note:add_alias(note.title)
    end

    local out = { id = note.id, aliases = note.aliases, tags = note.tags }

    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,

  templates = {
    subdir = "02-Templates",
    date_format = "%Y-%m-%d",
  },

  follow_url_func = function(url)
    vim.fn.jobstart({ "xdg-open", url })
  end,

  picker = {
    name = "telescope.nvim",
    mappings = {
      new = "<C-x>",
    }
  },

  sort_by = "modified",

  open_notes_in = "current",

  attachments = {
    img_folder = "01-Files",

    img_text_func = function (client, path)
      local link_path
      local vault_relative_path = client:valut_relative_path(path)
      if vault_relative_path ~= nil then
        link_path = vault_relative_path
      else
        link_path = tostring(path)
      end

      local display_name = vim.fs.basename(link_path)
      return string.format("![%s](%s)", display_name, link_path)
    end
  }
}

return opts
