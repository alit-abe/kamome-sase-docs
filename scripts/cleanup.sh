#!/bin/bash
# 一時ファイルのクリーンアップスクリプト

cd "$(dirname "$0")/.."

echo "一時ファイルをクリーンアップ中..."

# tmpclaude-* ファイルを削除
find . -maxdepth 2 -name "tmpclaude-*" -type f -delete 2>/dev/null || true

# 他の一時ファイルも削除
rm -f *.tmp 2>/dev/null || true
rm -f docs/**/*.tmp 2>/dev/null || true

echo "✓ クリーンアップ完了"
