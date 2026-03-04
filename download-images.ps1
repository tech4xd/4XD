# Download missing images
$images = @(
    @{url="https://fourxditprd.wpengine.com/wp-content/uploads/2025/07/header-inner-page.png"; name="header-inner-page.png"},
    @{url="https://fourxditprd.wpengine.com/wp-content/uploads/2025/06/hero-variation-1.png"; name="hero-variation-1.png"},
    @{url="https://fourxditprd.wpengine.com/wp-content/uploads/2025/06/stats-overlay.png"; name="stats-overlay.png"},
    @{url="https://fourxditprd.wpengine.com/wp-content/uploads/2025/06/how-easy-to-get-in-touch.png"; name="how-easy-to-get-in-touch.png"},
    @{url="https://fourxditprd.wpengine.com/wp-content/uploads/2025/06/testimonials-base.png"; name="testimonials-base.png"}
)

$outputDir = ".\images"

foreach ($img in $images) {
    $outputPath = Join-Path $outputDir $img.name
    Write-Host "Downloading $($img.name)..."
    try {
        Invoke-WebRequest -Uri $img.url -OutFile $outputPath
        Write-Host "Downloaded $($img.name)" -ForegroundColor Green
    } catch {
        Write-Host "Failed to download $($img.name): $_" -ForegroundColor Red
    }
}

Write-Host "Done!" -ForegroundColor Cyan
