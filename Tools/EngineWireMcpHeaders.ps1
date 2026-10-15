$ErrorActionPreference = 'Stop'

$tokenPath = Join-Path $PSScriptRoot '..\Saved\MCP\capability-token'
$token = (Get-Content -LiteralPath $tokenPath -Raw).Trim()

if ($token -notmatch '^[0-9a-f]{64}$') {
    throw "EngineWire capability token is missing or invalid: $tokenPath"
}

@{ 'X-MCP-Capability-Token' = $token } | ConvertTo-Json -Compress
