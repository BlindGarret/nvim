--[[local fmt_group = vim.api.nvim_create_augroup('autoformat_cmds', {clear = true})

local function organize_imports(client, bufnr)
  local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
  params.context = { only = { "source.organizeImports" } }

  local resp = client.request_sync("textDocument/codeAction", params, 3000, bufnr)
  for _, r in pairs(resp and resp.result or {}) do
    if r.edit then
      vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
    else
      vim.lsp.buf.execute_command(r.command)
    end
  end
end

local function setup_autoformat(event)
  local id = vim.tbl_get(event, 'data', 'client_id')
  local client = id and vim.lsp.get_client_by_id(id)
  if client == nil then
    return
  end

  vim.api.nvim_clear_autocmds({group = fmt_group, buffer = event.buf})

  local buf_format = function(e)
  	organize_imports(client, e.buf)
		vim.lsp.buf.format({
      bufnr = e.buf,
      async = false,
      timeout_ms = 10000,
    })
  end

  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = event.buf,
    group = fmt_group,
    desc = 'Format current buffer',
    callback = buf_format,
  })
end

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Setup format on save',
  callback = setup_autoformat,
})--]]
