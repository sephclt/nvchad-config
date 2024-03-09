local opts = {
  workspaces = {
    {
      name = "personal",
      path = "~/Documents/Notes/my-notes/"
    }
  },

  notes_subdir = "02-Notes",

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

    local out = { id = note.id, created = os.date("%Y-%m-%d"), aliases = note.aliases, tags = note.tags }

    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,

  templates = {
    subdir = "01-Templates",
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

  open_notes_in = "vsplit",

  ui = {
    checkboxes = {
      [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
      ["x"] = { char = "󰄲", hl_group = "ObsidianDone" },
      [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
    },

    -- Use bullet marks for non-checkbox lists.
    bullets = { char = "•", hl_group = "ObsidianBullet" },
    external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    -- Replace the above with this if you don't have a patched font:
    -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    reference_text = { hl_group = "ObsidianRefText" },
    highlight_text = { hl_group = "ObsidianHighlightText" },
    tags = { hl_group = "ObsidianTag" },
    block_ids = { hl_group = "ObsidianBlockID" },

    hl_groups = {
      -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
      ObsidianTodo = { bold = true, fg = "#f78c6c" },
      ObsidianDone = { bold = true, fg = "#89ddff" },
      ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
      ObsidianTilde = { bold = true, fg = "#ff5370" },
      ObsidianBullet = { bold = true, fg = "#89ddff" },
      ObsidianRefText = { bold = true, fg = "#74c7ec" },
      ObsidianExtLinkIcon = { fg = "#c792ea" },
      ObsidianTag = { italic = true, fg = "#89ddff" },
      ObsidianBlockID = { italic = true, fg = "#89ddff" },
      ObsidianHighlightText = { bg = "#75662e" },
    },

    attachments = {
      img_folder = "00-Files",

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
}

return opts
