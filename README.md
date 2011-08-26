# vc-helper

vc-helper は、Microsoft VisualStudio 向け生産性向上スクリプト群です。

## 動作環境

- Ruby 1.9.2
- Windows XP, OS X 10.7

# cutter.rb

## 使い方

- 指定したファイルから、スペースまたはタブで始まる行コメントを削除します。

        > ruby cutter.rb foo.cpp

- 対象に **foo.cpp** ファイルを指定した場合、変換した内容を **_foo.cpp** として上書き出力します。
- 出力ファイルの接頭語はアンダースコア(_)がデフォルトです。変更が必要ならオプション引数(--dst)で指定してください。

        > ruby cutter.rb --dst '_PREFIX_' 'foo.cpp'

- また、ワイルドカードで複数のファイルを対象にすることも可能です。

        > ruby cutter.rb '*.cpp'

- 尚、対象ファイルの文字コードは、CP932(MS社のシフトJISを拡張)でハードコードしています。
