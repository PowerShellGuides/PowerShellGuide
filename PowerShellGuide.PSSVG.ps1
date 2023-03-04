#requires -Module PSSVG
Push-Location $PSScriptRoot

$assetsRoot = Join-Path $PSScriptRoot "Assets"
if (-not (Test-Path $assetsRoot)) {
    $null = New-Item -ItemType Directory -Path $assetsRoot
}

$docsRoot = Join-Path $PSScriptRoot "docs"
if (-not (Test-Path $docsRoot)) {
    $null = New-Item -ItemType Directory -Path $docsRoot
}

$guideLogo = 
=<svg> -ViewBox 200, 100 -Content @(
    =<svg.defs> @(
        =<svg.style> -Type 'text/css' @'
@import url('https://fonts.googleapis.com/css?family=Righteous')
'@

)    
    =<svg.Spiral> -Theta 42 -Alpha 50 -stroke '#4488ff' -Class foreground-stroke -Transform "translate(25) scale(1.6,1) skewX(-10) skewY(-15)" -Opacity .5 -StrokeWidth 0.5
    =<svg.symbol> -Id psChevron -Content @(
        =<svg.polygon> -Points (@(
            "40,20"
            "45,20"
            "60,50"
            "35,80"
            "32.5,80"
            "55,50"
        ) -join ' ')
    ) -ViewBox 100, 100
    =<svg.use> -Href '#psChevron' -Width 100% -Height 100% -Fill '#4488ff' -X 10% -Class foreground-fill
    =<svg.text> -Content 'PowerShell' -DominantBaseline 'middle' -TextAnchor 'end' -X 55% -Y 50% -Fill '#4488ff' -Style "font-family: 'Righteous';"  -Class foreground-fill
    =<svg.text> -Content 'Guide' -DominantBaseline 'middle' -TextAnchor 'guide' -X 67.5% -Y 50% -Fill '#4488ff' -Style "font-family: 'Righteous';"  -Class foreground-fill
) -OutputPath (Join-Path $assetsRoot .\PowerShellGuide.svg) 

$guideLogo

$guideLogo |
    Copy-Item -Destination (Join-Path $PSScriptRoot docs) -PassThru

$guideLogoSquare = 
=<svg> -ViewBox 200, 200 -Content @(
    =<svg.defs> @(
        =<svg.style> -Type 'text/css' @'
@import url('https://fonts.googleapis.com/css?family=Righteous')
'@
)
   
    =<svg.Spiral> -Theta 42 -Alpha 52 -stroke '#4488ff' -Class foreground-stroke -Transform "translate(18 52) scale(1.6,1) skewX(-10) skewY(-15)" -Opacity .5 -StrokeWidth 0.5
    =<svg.symbol> -Id psChevron -Content @(
        =<svg.polygon> -Points (@(
            "40,20"
            "45,20"
            "60,50"
            "35,80"
            "32.5,80"
            "55,50"
        ) -join ' ')
    ) -ViewBox 100, 100
    =<svg.use> -Href '#psChevron' -Width 90% -Height 90% -Fill '#4488ff' -X 5% -Class foreground-fill -Y 5%
    =<svg.text> -Content 'PowerShell' -DominantBaseline 'middle' -TextAnchor 'end' -X 50% -Y 50% -Fill '#4488ff' -Style "font-family: 'Righteous';"  -Class foreground-fill
    =<svg.text> -Content 'Guide' -DominantBaseline 'middle' -TextAnchor 'guide' -X 60% -Y 50% -Fill '#4488ff' -Style "font-family: 'Righteous';"  -Class foreground-fill
) -OutputPath (Join-Path $assetsRoot .\PowerShellGuideSquare.svg) 
    
$guideLogoSquare

Pop-Location