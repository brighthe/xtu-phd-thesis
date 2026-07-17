$source = "C:\workspace\xtu-phd-thesis"
$destination = "C:\Users\Lenovo\iCloudDrive\iCloud~md~obsidian\xtu-phd-thesis"

# 1. 检查 Git 仓库状态
Write-Host "检查 Git 仓库状态..." -ForegroundColor Cyan
# 使用 --porcelain 获取干净的状态输出
$gitStatus = git status --porcelain 2>$null

# 如果有错误（可能因为 safe directory 设置等），我们暂不终止，而是检查 $LASTEXITCODE
if ($LASTEXITCODE -ne 0) {
    Write-Host "警告: 'git status' 运行失败。这可能是因为目录的安全权限配置问题。" -ForegroundColor Yellow
    Write-Host "是否强制继续同步？" -ForegroundColor Yellow
    $response = Read-Host "输入 Y 强制继续，输入 N 退出"
    if ($response -notmatch "^[Yy]$") {
        Write-Host "已退出。" -ForegroundColor Red
        Pause
        exit
    }
} elseif (![string]::IsNullOrWhiteSpace($gitStatus)) {
    # 如果输出不为空，则说明有未提交更改
    Write-Host "检测到仓库中有未提交的更改！请先 commit 您的更改，然后再进行同步。" -ForegroundColor Red
    Write-Host "当前变动文件如下："
    Write-Host $gitStatus
    Pause
    exit
}

# 2. 开始同步
Write-Host "工作区干净。开始将仓库同步至 iCloud Obsidian..." -ForegroundColor Cyan
# 使用 /MIR 镜像目录树。排除了 .git 文件夹。
# /R:3 重试3次 /W:3 每次重试等待3秒
# /NFL : No File List - don't log file names
# /NDL : No Directory List - don't log directory names
# /NJH : No Job Header
# /NJS : No Job Summary
# /nc /ns /np : No classes, sizes, progress
robocopy $source $destination /MIR /XD ".git" /R:3 /W:3 /NFL /NDL /NJH /NJS /nc /ns /np

# 检查 robocopy 的退出码。robocopy 退出码在 0-7 之间通常都表示成功或有部分文件被更新
if ($LASTEXITCODE -le 7) {
    Write-Host "同步完成！" -ForegroundColor Green
} else {
    Write-Host "同步过程中遇到错误！Robocopy 退出码: $LASTEXITCODE" -ForegroundColor Red
}

Pause
