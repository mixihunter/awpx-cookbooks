wpdir = "/usr/local/bin/"

#/usr/bin/直下にwordpressコマンドラインツールをダウンロードする
remote_file "#{wpdir}/wp" do
  source "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
  owner "root"
  group "root"
  mode 00755
end
