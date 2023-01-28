# Neovim config for NvChad

Hi this is my personal "custom" folder for NvChad
it's great for web development

## Installation

First, install [NvChad](https://github.com/NvChad/NvChad) and read it's docs.

Clone this repo inside:

```path
.config/nvim/lua/custom
```

Use [packer](https://github.com/wbthomason/packer.nvim) to install required plugins.

```bash
:PackerSync
```

Check [null-ls builtins](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md) to get config for ["eslint_d", "stylua", "prettierd", "shellcheck"] languages!

for **styled-components**:
  1: install dependency to local npm

```bash
yarn add --dev stylelint stylelint-processor-styled-components stylelint-config-styled-components stylelint-config-recommended
```

  2: create .stylelintrc at the root of project
```json
{
  "processors": [
    "stylelint-processor-styled-components"
  ],
  "extends": [
    "stylelint-config-recommended",
    "stylelint-config-styled-components"
  ]
}


```

## Usage

```
nvim
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Note: I'm newbie in work with neovim and this config may be changed
