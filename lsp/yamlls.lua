return {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yml", "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values" },
    on_init = function(client)
        client.server_capabilities.documentFormattingProvider = true
    end,
    root_markers = { ".git" },
    settings = {
        redhat = {
            telemetry = {
                enabled = false
            }
        },
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                    "**/oneclick/**/*.y*l"
                }
            },
            format = {
                enable = true
            }
        }
    },
}
