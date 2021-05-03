local config = {}

function config.lspkind_nvim()
  require('lspkind').init()
end

function config.nvim_lsp()
  require('modules.lsp.lspconfig')
end

function config.nvim_compe()
  require'compe'.setup {
    enabled = true;
    debug = false;
    min_length = 1;
    preselect = 'always';
    allow_prefix_unmatch = false;
    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = true;
      nvim_lsp = true;
      spell = true;
      tags = true;
      snippets_nvim = false;
    };
  }
end

function config.vim_vsnip()
  vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/nvim/snippets'
end

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]]
    vim.cmd [[packadd popup.nvim]]
    vim.cmd [[packadd telescope-fzy-native.nvim]]
    vim.cmd [[packadd lsp-trouble.nvim]]
  end
  require('telescope').setup {
    builtin = {
      treesitter = true
    },
    defaults = {
      prompt_position = 'top',
      sorting_strategy = 'ascending',
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
      mappings = {
        i = { ["<c-t>"] = require('trouble.providers.telescope').open_with_trouble },
        n = { ["<c-t>"] = require('trouble.providers.telescope').open_with_trouble },
      },
    },
    extensions = {
      fzy_native = {
          override_generic_sorter = true,
          override_file_sorter = true,
      },
    }
  }
  require('telescope').load_extension('fzy_native')
end

function config.vim_sonictemplate()
  vim.g.sonictemplate_postfix_key = '<C-,>'
  vim.g.sonictemplate_vim_template_dir = os.getenv("HOME").. '/.config/nvim/template'
end


function config.emmet()
  vim.g.user_emmet_complete_tag = 0
  vim.g.user_emmet_install_global = 0
  vim.g.user_emmet_install_command = 0
  vim.g.user_emmet_mode = 'i'
end

function config.lsp_trouble()
  require("trouble").setup {
    use_lsp_diagnostic_signs = true
  }
end

return config
