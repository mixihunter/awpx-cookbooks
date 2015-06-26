require "net/http"
require "uri"

wpdir = "/srv/www/wordpress/current"
#ハンズオンの場合に代入されるもの
#dbname = wordpress, dbuser = wpuser, dbpass = wppassword, dbhost = RDSのホスト名
dbname = node[:deploy][:wordpress][:database][:database]
dbuser = node[:deploy][:wordpress][:database][:username]
dbpass = node[:deploy][:wordpress][:database][:password]
dbhost = node[:deploy][:wordpress][:database][:host]
wp_admin_email = node[:deploy][:wordpress][:wp_admin_email]

#wp-config.phpのセットアップ
execute "wp configure" do
   command "wp core config --dbname=#{dbname} --dbuser=#{dbuser} --dbpass=#{dbpass} --dbhost=#{dbhost}"
   cwd "#{wpdir}"
   user "deploy"
   not_if { File.exists?("#{wpdir}/wp-config.php") }
   action :run
end

#uriで、インスタンスのグローバルホスト名（ec2-52-xx-xx-xx.ap-northeast-1.compute.amazonaws.comのようなもの）
#を取得する。
uri = URI.parse("http://169.254.169.254/latest/meta-data/public-hostname")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)

public_hostname = response.body

#DBを作成する
execute "db create" do
   command "wp db create"
   cwd "#{wpdir}"
   user "deploy"
   action :run
   ignore_failure true
end

#インストールする
# --url = サイトURL（デフォルトはインスタンスのグローバルホスト名） --title = サイトタイトル --admin_name = 最初のユーザー名
# --admin_password= 最初のユーザーのパスワード --admin_email = カスタムJSONで指定したメアド
execute "wp deploy" do
   command "wp core install --url=#{public_hostname} --title=Test --admin_name=admin --admin_password=admin --admin_email=#{wp_admin_email}"
   cwd "#{wpdir}"
   user "deploy"
   action :run
   not_if "sudo -u deploy wp core is-installed --path=#{wpdir}"
end
