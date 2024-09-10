require('lspconfig').helm_ls.setup {
  settings = {
    ['helm-ls'] = {
      valuesFiles = {
        mainValuesFile = "values.yaml",
        additionalValuesFilesGlobPattern = "values.*.yaml"
      },
    },
  }
}
