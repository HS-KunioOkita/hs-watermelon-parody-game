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

### ディレクトリ構成説明

```text
- anddroid ... Androidに関する設定やソースが格納されています
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

