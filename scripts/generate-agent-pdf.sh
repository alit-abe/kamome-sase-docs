#!/bin/bash
# エージェントインストールマニュアルのPDF生成スクリプト

set -e  # エラーが発生したら終了

# プロジェクトのルートディレクトリに移動
cd "$(dirname "$0")/.."
PROJECT_ROOT=$(pwd)

# クリーンアップ関数（スクリプト終了時に必ず実行）
cleanup() {
    echo "一時ファイルをクリーンアップ中..."
    cd "$PROJECT_ROOT"
    rm -f tmpclaude-* 2>/dev/null || true
    rm -f docs/agent/tmpclaude-* 2>/dev/null || true
    find . -maxdepth 2 -name "tmpclaude-*" -type f -delete 2>/dev/null || true
}

# スクリプト終了時にクリーンアップを実行
trap cleanup EXIT

echo "エージェントインストールマニュアルのPDF生成を開始します..."

# 既存のPDFを削除
rm -f pdf/agent-installation-manual.pdf

# PDF生成
cd docs/agent
npx markdown-pdf installation.md -o ../../pdf/agent-installation-manual.pdf -s pdf-style.css

# 元のディレクトリに戻る
cd "$PROJECT_ROOT"

# 生成されたPDFの確認
if [ -f "pdf/agent-installation-manual.pdf" ]; then
    FILE_SIZE=$(ls -lh pdf/agent-installation-manual.pdf | awk '{print $5}')
    echo "✓ PDF生成完了: pdf/agent-installation-manual.pdf (${FILE_SIZE})"
else
    echo "✗ PDF生成に失敗しました"
    exit 1
fi
