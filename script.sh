cat > ./ohmyposh/.config/ohmyposh/zen.toml << 'EOF'
"$schema" = 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json'
version = 3
final_space = true
console_title_template = '{{ if .Segments.Git.RepoName }}{{ .Segments.Git.RepoName }}{{ else }}{{ .Folder }}{{ end }}'

[palette]
  sapphire = '#4fb6e8'
  teal     = '#4ecdb0'
  mauve    = '#cba6f7'
  success  = '#7ed378'
  danger   = '#ee6690'
  overlay  = '#6c7086'
  base     = '#1e1e2e'

[[blocks]]
  type = 'prompt'
  alignment = 'left'
  newline = true

  # path chip: rounded cap on the left - this is now the true start of the bar
  [[blocks.segments]]
    type = 'path'
    style = 'diamond'
    leading_diamond = "\ue0b6"
    trailing_diamond = ''
    background = 'p:sapphire'
    foreground = 'p:base'
    template = ' {{ .Path }} '
    [blocks.segments.options]
      style = 'full'
      home_icon = '~'

  # language chip: flush on both sides, sits in the middle of the bar
  [[blocks.segments]]
    type = 'node'
    style = 'diamond'
    leading_diamond = ''
    trailing_diamond = ''
    background = 'p:teal'
    foreground = 'p:base'
    template = '  {{ .Full }} '

  [[blocks.segments]]
    type = 'python'
    style = 'diamond'
    leading_diamond = ''
    trailing_diamond = ''
    background = 'p:teal'
    foreground = 'p:base'
    template = '  {{ if .Venv }}{{ .Venv }} {{ end }}{{ .Full }} '
    [blocks.segments.options]
      fetch_virtual_env = true

  [[blocks.segments]]
    type = 'go'
    style = 'diamond'
    leading_diamond = ''
    trailing_diamond = ''
    background = 'p:teal'
    foreground = 'p:base'
    template = '  {{ .Full }} '

  # git chip: flush on the left (touches the language/path chip), rounded
  # on the right since it's the true end of the bar. plain branch name only -
  # branch_icon is explicitly cleared so nothing gets prepended automatically.
  # pastel violet throughout, no red.
  [[blocks.segments]]
    type = 'git'
    style = 'diamond'
    leading_diamond = ''
    trailing_diamond = "\ue0b4"
    background = 'p:mauve'
    foreground = 'p:base'
    template = ' {{ .HEAD }}{{ if .Working.Changed }} !{{ add .Working.Added .Working.Modified .Working.Deleted .Working.Untracked }}{{ end }}{{ if gt .Ahead 0 }} ↑{{ .Ahead }}{{ end }}{{ if gt .Behind 0 }} ↓{{ .Behind }}{{ end }} '
    [blocks.segments.options]
      fetch_status = true
      branch_icon = ''

[[blocks]]
  type = 'prompt'
  alignment = 'right'

  [[blocks.segments]]
    type = 'executiontime'
    style = 'plain'
    foreground = 'p:overlay'
    template = '{{ .FormattedMs }}'
    [blocks.segments.options]
      threshold = 500
      style = 'round'

[[blocks]]
  type = 'prompt'
  alignment = 'left'
  newline = true

  # prompt char is now the cat, colored by last exit code
  [[blocks.segments]]
    type = 'status'
    style = 'plain'
    foreground = 'p:success'
    foreground_templates = ['{{ if gt .Code 0 }}p:danger{{ end }}']
    template = "\ueeed❯"
    [blocks.segments.options]
      always_enabled = true

[secondary_prompt]
  foreground = 'p:overlay'
  template = '❯❯ '
EOF
echo done
