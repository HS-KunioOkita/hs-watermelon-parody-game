# hs_watermelon_parody_game

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 注意
branch をpull してきたら、以下のコマンドを実施してください
```
flutter gen-l10n 
```


### ディレクトリ構成説明

```text
- android ... Androidに関する設定やソースが格納されています
- ios ... iOSに関する設定やソースが格納されています
- web ... webアプリに関する設定やソースが格納されています
- lib ... プロダクトコードを管理するフォルダです。
  - component ... アプリで使用する共通で再利用するUIを管理します。
  - constants ... アプリで使用する定数を管理するフォルダです。
  - game ... ゲーム本体のコードを管理するフォルダです。
    - game.dart ... ゲームのエントリポイント
  - infrastructure ... API通信に関連するコードを格納するフォルダです。
  - model ... アプリの型定義のクラスを管理します。
  - provider ... ViewModelやRepositoryを使用するにあたり、それらを提供するProviderを管理します。
  - repository ... ビジネスロジックの役割を持つクラスを管理します。
  - router ... アプリの画面遷移を担当するクラスを管理します。
  - view ... アプリの画面となるクラスを管理します。
  - view_model ... アプリのUIステートを保持し、画面に表示するデータを変換する役割を持つクラスを管理します。
  - main.dart ... エントリーポイント
```
## コマンド説明

### パッケージの追加
1. コンソールで以下のコマンドを実行する
    ```
    flutter pub add {追加したいパッケージ名}
    ```
1. yaml ファイルに更新が入っていることを確認してから、以下のコマンドを実施する
    ```
    flutter pub get
    ```

### スプラッシュ画面の改修
1. [flutter_native_splash.yaml](flutter_native_splash.yaml) を編集する
1. コンソールで以下のコマンドを実行する
    ```
    dart run flutter_native_splash:create
    ```
1. 必要なファイルが自動的に作成される
1. (アプリをビルドして動作確認を行う)

### ローカライズの適用（テキスト追加）
1. [lib/l10n/](lib/l10n/) 配下の .arb ファイルにKey とそれに紐つくテキストを記載する
1. コンソールで以下のコマンドを実行する
    ```
    flutter gen-l10n 
    ```
1. (アプリをビルドして動作確認を行う)