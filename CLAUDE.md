# Kamome SASE ドキュメント構造

## プロジェクト概要

高度なネットワークセキュリティを実現するKamome SASE製品のマニュアル管理プロジェクト。

## 製品構成

### コンポーネント

1. **ピア（Peer）**
   - **エージェント**: クライアントPC側のエージェント
   - **コネクター**: リモートネットワーク側のコネクター

2. **センターサーバー（Center Server）**
   - **システム管理アプリ**: 集中管理システム
   - **テナント管理アプリ**: テナント管理システム

3. **認証サーバー（Auth Server）**
   - SSO（シングルサインオン）機能を提供

### マニュアル構成

- エージェント インストールおよび操作マニュアル
- コネクター インストールおよび操作マニュアル
- システム管理マニュアル
- テナント管理マニュアル
- 認証サーバーマニュアル

## ディレクトリ構造

```
kamome-sase-docs/
├── README.md                              # GitHub表示用
├── CLAUDE.md                              # 本ファイル（構造説明・TODO管理）
├── mkdocs.yml                             # MkDocs設定ファイル
│   または
├── docusaurus.config.js                   # Docusaurus設定ファイル
│
├── docs/                                  # マニュアル本体（Web生成対象）
│   ├── index.md                           # トップページ/製品概要
│   │
│   ├── agent/                             # エージェントマニュアル
│   │   ├── index.md                       # エージェント概要（目次的役割）
│   │   ├── installation.md                # インストール手順
│   │   ├── operation.md                   # 操作手順
│   │   ├── configuration.md               # 設定詳細
│   │   ├── troubleshooting.md             # トラブルシューティング
│   │   └── images/                        # エージェント用画像
│   │       ├── install_01.png
│   │       └── ...
│   │
│   ├── connector/                         # コネクターマニュアル
│   │   ├── index.md                       # コネクター概要
│   │   ├── installation.md
│   │   ├── operation.md
│   │   ├── configuration.md
│   │   ├── troubleshooting.md
│   │   └── images/
│   │       └── ...
│   │
│   ├── system-admin/                      # システム管理マニュアル
│   │   ├── index.md                       # システム管理概要
│   │   ├── installation.md
│   │   ├── user-guide.md
│   │   ├── features/                      # 機能別ドキュメント
│   │   │   ├── user-management.md
│   │   │   ├── policy-management.md
│   │   │   └── monitoring.md
│   │   ├── troubleshooting.md
│   │   └── images/
│   │       └── ...
│   │
│   ├── tenant-admin/                      # テナント管理マニュアル
│   │   ├── index.md                       # テナント管理概要
│   │   ├── installation.md
│   │   ├── user-guide.md
│   │   ├── features/                      # 機能別ドキュメント
│   │   │   ├── tenant-settings.md
│   │   │   ├── user-management.md
│   │   │   └── reporting.md
│   │   ├── troubleshooting.md
│   │   └── images/
│   │       └── ...
│   │
│   ├── auth-server/                       # 認証サーバーマニュアル
│   │   ├── index.md                       # 認証サーバー概要
│   │   ├── installation.md
│   │   ├── configuration.md
│   │   ├── integration.md
│   │   ├── troubleshooting.md
│   │   └── images/
│   │       └── ...
│   │
│   └── assets/                            # 共通アセット
│       ├── images/
│       │   ├── logo.png
│       │   ├── architecture.png
│       │   └── network-diagram.png
│       └── stylesheets/                   # カスタムCSS（必要に応じて）
│           └── custom.css
│
├── site/                                  # HTML生成出力先（.gitignore推奨）
│   └── (MkDocsやDocusaurusが自動生成)
│
├── pdf/                                   # PDF出力先
│   ├── agent-manual.pdf
│   ├── connector-manual.pdf
│   ├── system-admin-manual.pdf
│   ├── tenant-admin-manual.pdf
│   └── auth-server-manual.pdf
│
├── scripts/                               # ビルドスクリプト
│   ├── build-pdf.sh                       # PDF生成スクリプト
│   └── build-web.sh                       # Web生成スクリプト
│
├── .gitignore
└── package.json または requirements.txt   # 依存関係管理
```

## 主な特徴

### 1. docs/ ディレクトリで統一
- MkDocs、Docusaurus、VitePress など主要な静的サイトジェネレーターの標準に準拠
- すべてのMarkdownファイルと画像を `docs/` 内に配置

### 2. 各ディレクトリに index.md を配置
- `docs/index.md` → 製品全体のトップページ/概要
- `docs/agent/index.md` → エージェントマニュアルの目次・概要
- Web公開時にナビゲーションが自然に機能
- PDFでも各マニュアルの冒頭ページとして機能

### 3. 画像パスの管理
- 各マニュアル内の画像は相対パス参照: `![説明](images/install_01.png)`
- 共通画像は: `![ロゴ](../assets/images/logo.png)`
- PDF/HTML両方で同じパスで動作

### 4. マニュアルごとに独立した画像管理
- 各コンポーネントの `images/` フォルダで個別管理
- 保守性と可搬性が向上

## 設定ファイル例

### MkDocs設定（mkdocs.yml）

```yaml
site_name: Kamome SASE マニュアル
site_description: ネットワークセキュリティ製品マニュアル
site_author: Your Company

nav:
  - ホーム: index.md
  - エージェント:
      - 概要: agent/index.md
      - インストール: agent/installation.md
      - 操作: agent/operation.md
      - 設定: agent/configuration.md
      - トラブルシューティング: agent/troubleshooting.md
  - コネクター:
      - 概要: connector/index.md
      - インストール: connector/installation.md
      - 操作: connector/operation.md
      - 設定: connector/configuration.md
      - トラブルシューティング: connector/troubleshooting.md
  - システム管理:
      - 概要: system-admin/index.md
      - インストール: system-admin/installation.md
      - 利用ガイド: system-admin/user-guide.md
      - 機能:
          - ユーザー管理: system-admin/features/user-management.md
          - ポリシー管理: system-admin/features/policy-management.md
          - 監視: system-admin/features/monitoring.md
      - トラブルシューティング: system-admin/troubleshooting.md
  - テナント管理:
      - 概要: tenant-admin/index.md
      - インストール: tenant-admin/installation.md
      - 利用ガイド: tenant-admin/user-guide.md
      - 機能:
          - テナント設定: tenant-admin/features/tenant-settings.md
          - ユーザー管理: tenant-admin/features/user-management.md
          - レポート: tenant-admin/features/reporting.md
      - トラブルシューティング: tenant-admin/troubleshooting.md
  - 認証サーバー:
      - 概要: auth-server/index.md
      - インストール: auth-server/installation.md
      - 設定: auth-server/configuration.md
      - 連携: auth-server/integration.md
      - トラブルシューティング: auth-server/troubleshooting.md

theme:
  name: material
  language: ja
  palette:
    primary: indigo
    accent: indigo
  features:
    - navigation.tabs
    - navigation.sections
    - navigation.expand
    - search.suggest
    - search.highlight

plugins:
  - search:
      lang: ja
  - pdf-export:
      combined: false
      media_type: print

markdown_extensions:
  - admonition
  - codehilite
  - footnotes
  - toc:
      permalink: true
```

## PDF生成方法

### 方法1: MkDocs + pdf-export plugin
```bash
pip install mkdocs-material
pip install mkdocs-pdf-export-plugin
mkdocs build
```

### 方法2: Pandoc
```bash
# 各マニュアルを個別にPDF化
pandoc docs/agent/*.md -o pdf/agent-manual.pdf --toc
pandoc docs/connector/*.md -o pdf/connector-manual.pdf --toc
```

### 方法3: md-to-pdf
```bash
npm install -g md-to-pdf
md-to-pdf docs/agent/*.md --output pdf/agent-manual.pdf
```

## Web公開方法

### MkDocsの場合
```bash
# ローカルプレビュー
mkdocs serve

# 静的サイト生成
mkdocs build

# GitHub Pagesへデプロイ
mkdocs gh-deploy
```

### Docusaurusの場合
```bash
# インストール
npx create-docusaurus@latest kamome-docs classic

# ローカルプレビュー
npm start

# ビルド
npm run build
```

## 将来の課題（TODO）

### 優先度：高
- [ ] 静的サイトジェネレーターの選定（MkDocs vs Docusaurus vs VitePress）
- [ ] 基本的なディレクトリ構造の作成
- [ ] README.mdの作成（プロジェクト概要、ビルド方法、貢献ガイド）
- [ ] .gitignoreの設定（site/, pdf/, node_modules/ など）
- [ ] 各マニュアルのindex.mdテンプレート作成
- [ ] 画像ファイルの命名規則の策定

### 優先度：中
- [ ] マニュアルテンプレートの作成（共通フォーマット）
- [ ] PDF生成スクリプトの作成（scripts/build-pdf.sh）
- [ ] Web生成スクリプトの作成（scripts/build-web.sh）
- [ ] CI/CD設定（GitHub Actions等）- 自動ビルド・デプロイ
- [ ] バージョン管理戦略の策定
- [ ] マニュアルレビュープロセスの確立
- [ ] 多言語対応の検討（英語版など）

### 優先度：低
- [ ] 検索機能の最適化
- [ ] カスタムテーマの作成
- [ ] PDFデザインのカスタマイズ（ヘッダー、フッター、表紙）
- [ ] アクセス解析の導入（Web版）
- [ ] コメント機能の検討（Web版）
- [ ] ダークモード対応
- [ ] モバイル最適化
- [ ] オフライン対応（PWA化）

### 技術的検討事項
- [ ] Markdown拡張構文の選定（admonition、タブ、コードブロック等）
- [ ] 画像最適化戦略（サイズ、フォーマット）
- [ ] PDF生成時の日本語フォント問題への対応
- [ ] 大量の画像がある場合のビルドパフォーマンス最適化
- [ ] マニュアル間のクロスリファレンス方法

### ドキュメント作成タスク
- [ ] 製品アーキテクチャ図の作成
- [ ] ネットワーク構成図の作成
- [ ] 共通用語集の作成
- [ ] FAQ（よくある質問）セクションの追加
- [ ] リリースノート・変更履歴の管理方法

### 運用・保守
- [ ] マニュアル更新フローの確立
- [ ] スクリーンショット更新プロセス
- [ ] レビュー担当者の割り当て
- [ ] 定期的な内容見直しスケジュール

## メモ

- Markdown形式で管理し、PDF出力とHTML出力の両対応
- 画像は各マニュアルごとに管理し、共通画像はassetsに配置
- 将来的にはWeb公開を想定した構造
