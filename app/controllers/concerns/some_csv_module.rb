module SomeCsvModule
  extend ActiveSupport::Concern

  def generate_csv(users)
    filename = "情報一覧_#{Date.today}.csv"
    set_csv_request_headers(filename)

    bom = "\uFEFF" # 解説します(1)
    self.response_body = Enumerator.new do |csv_data| # 解説します(2・3)
      csv_data << bom

      header = %i(id 名前 内容)
      csv_data << header.to_csv # 解説します(4)

      users.each do |some|
        body = [
          some.id,
          some.name,
        ]
        csv_data << body.to_csv
      end
    end
  end

  def set_csv_request_headers(filename, charset: 'UTF-8') # 解説します(5)
    # ↓解説します(6)
    self.response.headers['Content-Type'] ||= "text/csv; charset=#{charset}"
    self.response.headers['Content-Disposition'] = "attachment;filename=#{ERB::Util.url_encode(filename)}"
    self.response.headers['Content-Transfer-Encoding'] = 'binary'
  end
end