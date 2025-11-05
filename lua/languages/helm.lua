vim.lsp.config("helm_ls", {
  settings = {
    ["helm-ls"] = {
      valuesFiles = {
        mainValuesFile = "values.yaml",
        additionalValuesFilesGlobPattern = "values.*.yaml",
      },
    },
  },
})
