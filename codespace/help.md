# codespace - VS Code Workspace Helper (╰( ´︶` )╯)

A friendly tool to open VS Code workspaces or directories.

## Usage

Simply run `codespace` in any directory:

- If a `.vscode` directory exists with a `.code-workspace` file, it will open the workspace
- Otherwise, it will open the current directory in VS Code

## Behavior

1. Searches for `.vscode/*.code-workspace` in current directory
2. If found:
   ```bash
   # Opens the workspace file
   ✨ Opening workspace ╰( ´︶` )╯ ✨
   ```

3. If not found:
   ```bash
   # Opens current directory instead
   ⚠️ Opening directory instead... (；´д｀)ゞ
   ```

The tool will automatically detect the appropriate way to open your project in VS Code.
