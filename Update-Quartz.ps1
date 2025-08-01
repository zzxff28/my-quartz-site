# ============================
# Quartz 網站自動更新腳本
# 適用於 GitHub Pages + Cloudflare Pages
# 作者: ChatGPT 幫你生成
# ============================

# 1️.切換到網站根目錄
Set-Location "D:\obsidian\Novel\OUTPUT"

Write-Host "🔹 開始更新 Quartz 網站..." -ForegroundColor Cyan

# 2️.檢查 Git 狀態
Write-Host "🔹 檢查 Git 狀態..."
git status

# 3️.建構網站（可選，Cloudflare 自動部署時可省略）
Write-Host "🔹 開始本地建構（npm run build）..."
npm run build

# 4️.加入所有變更
git add .

# 5️.產生自動提交訊息
$commitMessage = "更新網站 $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
Write-Host "🔹 Git 提交訊息: $commitMessage"

git commit -m "$commitMessage"

# 6.推送到 GitHub（觸發 GitHub Pages & Cloudflare Pages 自動部署）
Write-Host "🔹 推送到 GitHub 遠端..."
git push origin main

Write-Host "✅ 網站更新完成，GitHub Pages & Cloudflare Pages 會自動重新部署" -ForegroundColor Green
Pause
