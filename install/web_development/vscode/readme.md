# Visual Studio Code

List actual extensions

```bash
code --list-extensions >> vs_code_extensions_list.txt
```

Import extentions

```bash
cat vs_code_extensions_list.txt | xargs -n 1 code --install-extension
```

⚠️ Remove all extensions

```bash
code --list-extensions | xargs -n 1 code --uninstall-extension
```
