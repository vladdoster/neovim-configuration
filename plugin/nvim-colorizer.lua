local ok, colorizer = pcall(require, 'colorizer')
if not ok then return end
colorizer.setup({'scss', 'html', css={rgb_fn=true}, lua={no_names=true}},
                {RGB=true, RRGGBB=true, RRGGBBAA=true, rgb_fn=true, hsl_fn=true, css=true, css_fn=true})
