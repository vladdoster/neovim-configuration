local present, format = pcall(require, "format")
if present then
  format.setup {
      ["*"] = { {cmd = {"sed -i 's/[ \t]*$//'"}}},
      lua = { { cmd = { function(file) return string.format("luafmt -l %s -w replace %s", vim.bo.textwidth, file) end } } },
      go = { { cmd = {"gofmt -w", "goimports -w"}, tempfile_postfix = ".tmp" } },
      python = { { cmd = {"black -l 120"} } },
      terraform = { { cmd = {"terraform fmt"} } },
      markdown = {
          {cmd = {"mdformat"}},
          { cmd = {"black"}, start_pattern = "^```python$", end_pattern = "^```$", target = "current" },
          { cmd = {"shfmt -w"}, start_pattern = "^```bash$", end_pattern = "^```$", target = "current" }
      }
  }
end
